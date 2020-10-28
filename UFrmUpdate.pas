unit UFrmUpdate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdFTP,
  Vcl.ComCtrls, IdException, Vcl.StdCtrls, Winapi.ShellAPI, Vcl.Buttons, Winapi.WinInet;

type
  TfrmUpdate = class(TForm)
    idFtp2: TIdFTP;
    pbProgressBar: TProgressBar;
    lblProgress: TLabel;
    btnSearchUpdate: TBitBtn;
    mmoStatus: TMemo;
    function conectaFTP: Boolean;
    procedure idFtp2Work(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure idFtp2WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    function getFTPVersion(IdFTP: TIdFTP; fileName: String): SmallInt;
    procedure btnSearchUpdateClick(Sender: TObject);
    function VerificarExisteConexaoComInternet: boolean;
    function ObterDiretorioDoExecutavel: string;
    function ObterNumeroVersaoLocal: smallint;
    function ObterNumeroVersaoFTP: smallint;
    procedure BaixarAtualizacao;
    procedure FormCreate(Sender: TObject);
    procedure idFtp2Connected(Sender: TObject);
    procedure idFtp2BeforeGet(Sender: TObject);
    procedure idFtp2Disconnected(Sender: TObject);
    procedure idFtp2BannerBeforeLogin(ASender: TObject; const AMsg: string);
    procedure idFtp2AfterClientLogin(Sender: TObject);
    procedure sendLog;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUpdate: TfrmUpdate;
  FnTamanhoTotal: Integer;

implementation
uses
  UFuncions, System.IniFiles, UConstantes, System.Diagnostics;
{$R *.dfm}

{ TfrmUpdate }
procedure TfrmUpdate.BaixarAtualizacao;
begin
  try
    // obtém o tamanho da atualização e preenche a variável "FnTamanhoTotal"
    mmoStatus.Lines.Add('Cheking size...');
    FnTamanhoTotal := IdFTP2.Size('SplitBills.exe');

    //Apaga arquivos que podem ter sido deixados por atualizacoes mal sucedidas.
    if FileExists(ObterDiretorioDoExecutavel+'SplitBillsNew.exe')then
      DeleteFile(ObterDiretorioDoExecutavel+'SplitBillsNew.exe');
    if FileExists(ObterDiretorioDoExecutavel+'SplitBillsOld.exe') then
      DeleteFile(ObterDiretorioDoExecutavel+'SplitBillsOld.exe');

    // faz o download do arquivo "SplitBills.exe"
    mmoStatus.Lines.Add('Downloading new version...');
    IdFTP2.Get('SplitBills.exe',
      ObterDiretorioDoExecutavel + 'SplitBillsNew.exe', True, True);

    RenameFile(ObterDiretorioDoExecutavel+'SplitBills.exe'
    ,ObterDiretorioDoExecutavel+'SplitBillsOld.exe');

    RenameFile(ObterDiretorioDoExecutavel+'SplitBillsNew.exe'
    ,ObterDiretorioDoExecutavel+'SplitBills.exe');

    if FileExists(ObterDiretorioDoExecutavel+'SplitBillsNew.exe')then
      DeleteFile(ObterDiretorioDoExecutavel+'SplitBillsNew.exe');

    if FileExists(ObterDiretorioDoExecutavel+'SplitBillsOld.exe') then
      DeleteFile(ObterDiretorioDoExecutavel+'SplitBillsOld.exe');

    if MessageDlg('Update complete. Application will be restarted.'
    ,mtConfirmation,[mbOk],0, mbOk) = mrOk then
    begin
      //Chama o novo executavel
      ShellExecute(Handle, nil, PChar(Application.ExeName)
      , '', nil, SW_SHOWNORMAL);
      //Encerra o executavel antigo
      Application.Terminate;
    end;
  except
    On E:Exception do
    begin
      // ignora a exceção "Connection Closed Gracefully"
      if E is EIdConnClosedGracefully then
        Exit;

      mmoStatus.Lines.Add('Error:' + E.Message);

      // interrompe a atualização
      Abort;
    end;
  end;
end;

procedure TfrmUpdate.btnSearchUpdateClick(Sender: TObject);
var
  nNumeroVersaoLocal, nNumeroVersaoFTP: smallint;
  date :TDateTime;
  updated: Boolean;
begin
  if MessageDlg('Split Bills will freeze during this process, but don''t worry.', mtInformation, [mbOk],0, mbOk) <> mrOk then
    Exit;

  date := Now;
  mmoStatus.Lines.Add('***Update Process***'+DateTimeToStr(date));
  if not conectaFTP then
    Exit;

  nNumeroVersaoLocal := ObterNumeroVersaoLocal;
  nNumeroVersaoFTP := ObterNumeroVersaoFTP;


  if nNumeroVersaoLocal < nNumeroVersaoFTP then
  //if true then
  begin
    lblProgress.Visible := True;
    pbProgressBar.Visible := True;
    BaixarAtualizacao;
    mmoStatus.Lines.Add('Sucesfull updated.');
    updated := True;
  end
  else
  begin
    mmoStatus.Lines.Add('You are using latest version.');
    updated := False;
  end;

  sendLog;
  idFtp2.Disconnect;

  if not updated then
    if MessageDlg('You are using latest version.', mtInformation, [mbOk],0, mbOk) = mrOk then
    begin
      Self.Close;
    end;
end;

function TfrmUpdate.conectaFTP: Boolean;
begin
  Result := False;
  if not VerificarExisteConexaoComInternet then
    Exit;

  idFtp2.Disconnect;

  idFtp2.Host := 'ftp.filiperivelli.com.br';
  idFtp2.Username := 'splitBills@filiperivelli.com.br';
  idFtp2.Password := 'splitbills';
  idFtp2.Passive := True;
  idFtp2.UseTLS := utNoTLSSupport;

  mmoStatus.Lines.Add('Conecting ...');
  try
    idFtp2.Connect;
    Result := True;
  except
    on e:Exception do
    begin
      MessageDlg('Error:' + E.Message, mtError, [mbOk],0, mbOk);
      Result := False;
    end;
  end;
end;

procedure TfrmUpdate.FormCreate(Sender: TObject);
begin
  lblProgress.Visible := False;
  pbProgressBar.Visible := False;
  lblProgress.Caption := '';
  mmoStatus.Lines.Clear;

  idFtp2.Disconnect;
end;

function TfrmUpdate.getFTPVersion(IdFTP: TIdFTP; fileName: String): SmallInt;
var
  sNumeroVersao: string;
  oArquivoINI: TIniFile;
begin
  // baixa o arquivo "VersaoFTP.ini" para o computador
  if FileExists(fileName) then
    DeleteFile(fileName);

  IdFTP.Get(ExtractFileName(fileName),fileName, True, True);

  // abre o arquivo "VersaoFTP.ini"
  oArquivoINI := TIniFile.Create(fileName);
  try
    // lê o número da versão
    sNumeroVersao := oArquivoINI.ReadString('VersaoFTP', 'Numero', EmptyStr);

    // retira os pontos (exemplo: de "1.0.1" para "101")
    sNumeroVersao := StringReplace(sNumeroVersao, '.', EmptyStr, [rfReplaceAll]);

    // converte o número da versão para número
    result := StrToIntDef(sNumeroVersao, 0);
  finally
    FreeAndNil(oArquivoINI);
  end;
end;

procedure TfrmUpdate.idFtp2AfterClientLogin(Sender: TObject);
begin
  mmoStatus.Lines.Add('Client login Ok...(Event)');
end;

procedure TfrmUpdate.idFtp2BannerBeforeLogin(ASender: TObject;
  const AMsg: string);
begin
  mmoStatus.Lines.Add('Trying login...(Event)');
end;

procedure TfrmUpdate.idFtp2BeforeGet(Sender: TObject);
begin
  Application.ProcessMessages;
  mmoStatus.Lines.Add('Dowloading...(Event)');
end;

procedure TfrmUpdate.idFtp2Connected(Sender: TObject);
begin
   mmoStatus.Lines.Add('Connected...(Event)');
end;

procedure TfrmUpdate.idFtp2Disconnected(Sender: TObject);
begin
  mmoStatus.Lines.Add('Disconected...(Event)');
end;

procedure TfrmUpdate.idFtp2Work(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
var
  nTamanhoTotal, nTransmitidos, nPorcentagem: real;
begin
  if FnTamanhoTotal = 0 then
    Exit;

  Application.ProcessMessages;
  mmoStatus.Lines.Add('Working...');

  // obtém o tamanho total do arquivo em bytes
  nTamanhoTotal := FnTamanhoTotal div 1024;

  // obtém a quantidade de bytes já baixados
  nTransmitidos := AWorkCount div 1024;

  // calcula a porcentagem de download
  nPorcentagem := (nTransmitidos * 100) / nTamanhoTotal;

  // atualiza o componente TLabel com a quantidade de KBytes
  lblProgress.Caption := Format('%s KB de %s KB',
    [FormatFloat('##,###,##0', nTransmitidos), FormatFloat('##,###,##0', nTamanhoTotal)]);

  // atualiza a barra de preenchimento do componente TProgressBar
  pbProgressBar.Position := AWorkCount div 1024;
end;

procedure TfrmUpdate.idFtp2WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
  pbProgressBar.Max := FnTamanhoTotal div 1024;
end;

function TfrmUpdate.ObterDiretorioDoExecutavel: string;
begin
  result := ExtractFilePath(Application.ExeName);
end;

function TfrmUpdate.ObterNumeroVersaoFTP: smallint;
var
  sNumeroVersao: string;
  oArquivoINI: TIniFile;
begin
  // deleta o arquivo "VersaoFTP.ini" do computador, caso exista,
  // evitando erro de arquivo já existente
  if FileExists(ObterDiretorioDoExecutavel + 'VersaoFTP.ini') then
    DeleteFile(ObterDiretorioDoExecutavel + 'VersaoFTP.ini');

  // baixa o arquivo "VersaoFTP.ini" para o computador
  mmoStatus.Lines.Add('Cheking version ...');
  IdFTP2.Get('VersaoFTP.ini', ObterDiretorioDoExecutavel + 'VersaoFTP.ini', True, True);

  // abre o arquivo "VersaoFTP.ini"
  oArquivoINI := TIniFile.Create(ObterDiretorioDoExecutavel + 'VersaoFTP.ini');
  try
    // lê o número da versão
    sNumeroVersao := oArquivoINI.ReadString('VersaoFTP', 'Numero', EmptyStr);

    // retira os pontos (exemplo: de "1.0.1" para "101")
    sNumeroVersao := StringReplace(sNumeroVersao, '.', EmptyStr, [rfReplaceAll]);

    //Printa a versao
    mmoStatus.Lines.Add('Server Version: '+sNumeroVersao);

    // converte o número da versão para número
    result := StrToIntDef(sNumeroVersao, 0);
  finally
    FreeAndNil(oArquivoINI);
  end;
end;

function TfrmUpdate.ObterNumeroVersaoLocal: smallint;
begin
  Result := version;
  mmoStatus.Lines.Add('Your Version: '+IntToStr(version));
end;

procedure TfrmUpdate.sendLog;
var
  logFile: string;
begin
  mmoStatus.Lines.Add('App Name: '+Application.ExeName);
  mmoStatus.Lines.Add('App Version: '+IntToStr(version));
  mmoStatus.Lines.Add('User: '+getUser);

  //Nome do arquivo de log
  logFile := FormatDateTime('YYYYMMDD_HHMM',now)+'.txt';
  //Salva memo em arquivo
  mmoStatus.Lines.SaveToFile(ObterDiretorioDoExecutavel+logFile);
  //Se nao estiver conectado faz a conexao
  if not idFtp2.Connected then
    conectaFTP;
  //Envia arquivo de log para servidor ftp
  idFtp2.Put(ObterDiretorioDoExecutavel+logFile);
  //Apaga arquivo de log gerado
  if FileExists(ObterDiretorioDoExecutavel+logFile) then
    DeleteFile(ObterDiretorioDoExecutavel+logFile);
end;

function TfrmUpdate.VerificarExisteConexaoComInternet: boolean;
var
  nFlags: Cardinal;
begin
  result := InternetGetConnectedState(@nFlags, 0);
end;

end.
