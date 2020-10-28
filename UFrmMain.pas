unit UFrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors,
  Data.Bind.Components, Data.Bind.DBScope, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ExtCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids;

type
  TfrmMain = class(TForm)
    statBar: TStatusBar;
    btnNewResident: TBitBtn;
    mmMenu: TMainMenu;
    qryBillType: TFDQuery;
    fdtncfldBillTypecod_bill_type: TFDAutoIncField;
    strngfldBillTypetype: TStringField;
    dsBillType: TDataSource;
    qryBills: TFDQuery;
    qrySplit: TFDQuery;
    dsSplit: TDataSource;
    dsBills: TDataSource;
    dbgrdBills: TDBGrid;
    lblBillName: TLabel;
    dbedtname: TDBEdit;
    lblAmount: TLabel;
    dbedtAmount: TDBEdit;
    lblDtFrom: TLabel;
    lblDtTo: TLabel;
    dbnvgrBills: TDBNavigator;
    btnSplit: TBitBtn;
    dbgrdSplit: TDBGrid;
    dblkcbbBillType: TDBLookupComboBox;
    Reports1: TMenuItem;
    AmountperMonth1: TMenuItem;
    dtpBillFrom: TDateTimePicker;
    dtpBillTo: TDateTimePicker;
    pnlHeader: TPanel;
    btnNewHouse: TBitBtn;
    pnlBillFields: TPanel;
    pnlBills: TPanel;
    lblBillType: TLabel;
    cbbHouse: TComboBox;
    lbl1: TLabel;
    dtpDeadLine: TDateTimePicker;
    lbl2: TLabel;
    btnNewBillCategory: TBitBtn;
    dbedtPaidDay: TDBEdit;
    strngfldSplitname: TStringField;
    wdstrngfldSplitamount: TWideStringField;
    dbchkSend: TDBCheckBox;
    btnSend: TBitBtn;
    chkSendFilter: TCheckBox;
    strngfldBillstype: TStringField;
    fdtncfldBillscod_bills: TFDAutoIncField;
    strngfldBillsname: TStringField;
    fltfldBillsamount: TFloatField;
    dtfldBillsdead_line: TDateField;
    blbfldBillsattachment: TBlobField;
    dtfldBillspaid_day: TDateField;
    intgrfldBillscod_house: TIntegerField;
    dtfldBillsdt_from: TDateField;
    dtfldBillsdt_to: TDateField;
    intgrfldBillscod_bill_type: TIntegerField;
    blnfldBillssend: TBooleanField;
    cbbBillType: TComboBox;
    FindDatabase1: TMenuItem;
    FindaDatabaseFile1: TMenuItem;
    btnAddFile: TBitBtn;
    btnOpenFile: TBitBtn;
    btnDeleteFile: TBitBtn;
    dlgOpen: TOpenDialog;
    strngfldBillsmime_type: TStringField;
    About1: TMenuItem;
    btnOnePersonPays: TBitBtn;
    Searchforupdates1: TMenuItem;
    procedure House1Click(Sender: TObject);
    procedure btnNewHouseClick(Sender: TObject);
    procedure btnNewResidentClick(Sender: TObject);
    procedure NewBillCategory1Click(Sender: TObject);
    procedure qryBillsBeforeInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure cbbHouseChange(Sender: TObject);
    procedure load;
    procedure loadHouses(lista: TComboBox);
    procedure loadBills;
    procedure loadBillsType;
    procedure loadSplit;
    procedure loadBillTypeFilter(lista: TComboBox);
    procedure loadDates;
    procedure cbbHouseClick(Sender: TObject);
    procedure cbbHouseEnter(Sender: TObject);
    procedure dbnvgrBillsClick(Sender: TObject; Button: TNavigateBtn);
    procedure btnNewBillCategoryClick(Sender: TObject);
    procedure btnSplitClick(Sender: TObject);
    procedure dbgrdBillsCellClick(Column: TColumn);
    procedure dbgrdBillsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrdBillsKeyPress(Sender: TObject; var Key: Char);
    procedure dbgrdBillsKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dblkcbbBillTypeContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure btnSendClick(Sender: TObject);
    procedure chkSendFilterClick(Sender: TObject);
    procedure qryBillsAfterApplyUpdates(DataSet: TFDDataSet; AErrors: Integer);
    procedure qryBillsAfterEdit(DataSet: TDataSet);
    procedure dblkcbbBillTypeDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dsBillsUpdateData(Sender: TObject);
    procedure qryBillsBeforeApplyUpdates(DataSet: TFDDataSet);
    procedure qryBillsAfterPost(DataSet: TDataSet);
    procedure cbbBillTypeChange(Sender: TObject);
    procedure dbgrdBillsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dtpBillFromChange(Sender: TObject);
    procedure dtpBillToChange(Sender: TObject);
    procedure dtpDeadLineChange(Sender: TObject);
    procedure qryBillsBeforePost(DataSet: TDataSet);
    procedure FindaDatabaseFile1Click(Sender: TObject);
    procedure SendEmail1Click(Sender: TObject);
    procedure SendEmail;
    function UsuarioLogado : string;
    procedure AmountperMonth1Click(Sender: TObject);
    procedure btnAddFileClick(Sender: TObject);
    function downloadFile: string;
    procedure btnOpenFileClick(Sender: TObject);
    function addFile: Boolean;
    function deleteBillFile: Boolean;
    procedure btnDeleteFileClick(Sender: TObject);
    procedure loadFileButtons;
    procedure Createmimetypefield1Click(Sender: TObject);
    function createMIMEField :Boolean;
    procedure ativaDesativaBills(ativa: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    function connectDB: Boolean;
    procedure About1Click(Sender: TObject);
    procedure btnOnePersonPaysClick(Sender: TObject);
    procedure Searchforupdates1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses
UFrmUpdate, UFrmManageHouses, UFrmManageResidents, UFrmCategorias,UfrmSend, UDM,
UClasses, UfrmEmail, UFrmAvg, UFrmView, System.Win.ComObj, Winapi.ShellAPI,
UFrmAbout, UFrmSplitOnePerson, UFuncions;
{$R *.dfm}

procedure TfrmMain.About1Click(Sender: TObject);
var
  frmAbout :TfrmAbout;
begin
  try
    frmAbout := TfrmAbout.Create(nil);
    frmAbout.ShowModal;
  finally
    frmAbout.Free;
  end;
end;

function TfrmMain.addFile: Boolean;
var
  qryInsertFile :TFDQuery;
begin
  qryInsertFile := TFDQuery.Create(nil);
  if dlgOpen.Execute then
  begin
    with qryInsertFile do
    begin
      try
        Connection := UDM.frmDM.con;
        try
          SQL.Clear;
          SQL.Add('UPDATE bills');
          SQL.Add('SET attachment = :FILE, mime_type = :mime_type');
          SQL.Add('WHERE cod_bills = :COD_BILLS');
          ParamByName('COD_BILLS').AsInteger
          := qryBills.FieldByName('cod_bills').AsInteger;
          ParamByName('FILE').LoadFromFile(dlgOpen.FileName, ftBlob);
          ParamByName('mime_type').AsString := ExtractFileExt(dlgOpen.FileName);
          Execute;
          UDM.frmDM.con.Commit;
        finally
          qryBills.Refresh;
          qryInsertFile.Free;
          Result := True;
        end;
      except
      on E: Exception do
        begin
          MessageDlg('Erro:' + E.Message, mtError, [mbOk],0, mbOk);
          UDM.frmDM.con.Rollback;
          qryInsertFile.Free;
          Result := False;
        end;
      end;
    end;
  end;
end;

procedure TfrmMain.AmountperMonth1Click(Sender: TObject);
var
  frmAvg: TfrmAvg;
begin
  frmAvg := TfrmAvg.Create(nil,
  THouse(cbbHouse.Items.Objects[cbbHouse.ItemIndex]).cod_house);
  try
    frmAvg.ShowModal;
  finally
    frmAvg.Free;
  end;
end;

procedure TfrmMain.ativaDesativaBills(ativa: Boolean);
begin
  dblkcbbBillType.Enabled := ativa;
  dbedtname.Enabled       := ativa;
  dbedtAmount.Enabled     := ativa;
  dtpBillFrom.Enabled     := ativa;
  dtpBillTo.Enabled       := ativa;
  dtpDeadLine.Enabled     := ativa;
  dbedtPaidDay.Enabled    := ativa;
  dbchkSend.Enabled       := ativa;
  btnAddFile.Enabled      := ativa;
  btnDeleteFile.Enabled   := ativa;
  //btnOpenFile.Enabled     := ativa;
end;

procedure TfrmMain.btnAddFileClick(Sender: TObject);
var
  qryInsertFile :TFDQuery;
begin
  if addFile then
    qryBills.Refresh;
    loadFileButtons;
end;

procedure TfrmMain.btnDeleteFileClick(Sender: TObject);
begin
  if deleteBillFile then
  begin
    qryBills.Refresh;
    loadFileButtons;
  end;
end;

procedure TfrmMain.btnNewBillCategoryClick(Sender: TObject);
var
  frmCategoria: TfrmCategorias;
begin
  frmCategoria := TfrmCategorias.Create(nil);
  try
    frmCategoria.ShowModal;
  finally
    frmCategoria.Free;
    loadBillsType;
  end;
end;

procedure TfrmMain.btnNewHouseClick(Sender: TObject);
var
  frmManageHouses: TfrmManageHouses;
begin
  frmManageHouses := TfrmManageHouses.Create(nil);
  try
    frmManageHouses.ShowModal;
  finally
    frmManageHouses.Free;
    loadHouses(cbbHouse);
  end;
end;

procedure TfrmMain.btnNewResidentClick(Sender: TObject);
var
  frmManageResidents: TfrmManageResidents;
begin
  frmManageResidents := TfrmManageResidents.Create(nil,
  THouse(cbbHouse.Items.Objects[cbbHouse.ItemIndex]));
  try
    frmManageResidents.ShowModal;
  finally
    frmManageResidents.Free;
  end;
end;

procedure TfrmMain.btnOpenFileClick(Sender: TObject);
begin
  try
    ShellExecute(Handle, 'open', PChar(downloadFile), nil, nil, SW_SHOW);
  except
    MessageDlg('File not found.',mtError,mbOKCancel,0);
  end;
end;

procedure TfrmMain.btnSendClick(Sender: TObject);
var
  frmSend: TfrmSend;
begin
  frmSend := TfrmSend.Create(nil);
  try
    frmSend.ShowModal;
  finally
    frmSend.Free;
  end;
end;

procedure TfrmMain.btnSplitClick(Sender: TObject);
var
  bill: TBill;
  qryResidentsToSplit, qryInsereSplit: TFDQuery;
  n,i :Integer;
  residentToSplit :TResident;
begin
  n := 0;

  bill := TBill.Create;
  bill.cod_bills      := qryBills.FieldByName('cod_bills').AsInteger;
  bill.nameBill       := qryBills.FieldByName('name').AsString;
  bill.amount         := qryBills.FieldByName('amount').AsFloat;
  bill.dead_line      := qryBills.FieldByName('dead_line').AsDateTime;
  bill.paid_day       := qryBills.FieldByName('paid_day').AsDateTime;
  bill.cod_house      := qryBills.FieldByName('cod_house').AsInteger;
  bill.dt_from        := qryBills.FieldByName('dt_from').AsDateTime;
  bill.dt_to          := qryBills.FieldByName('dt_to').AsDateTime;
  bill.cod_bill_type  := qryBills.FieldByName('cod_bill_type').AsInteger;

  qryResidentsToSplit := TFDQuery.Create(nil);
  with qryResidentsToSplit do
  begin
    Connection := frmDM.con;
    SQL.Text := 'select * from residents where cod_house = :P_COD_HOUSE';
    ParamByName('P_COD_HOUSE').AsInteger := THouse(cbbHouse.Items.Objects[cbbHouse.ItemIndex]).cod_house;
    Open;
  end;

  qryResidentsToSplit.Last;
  n := qryResidentsToSplit.RecordCount;
  SetLength(bill.residents,n);
  qryResidentsToSplit.First;


  for i := 0 to n-1 do
  begin
    residentToSplit := TResident.Create;
    residentToSplit.cod_resident := qryResidentsToSplit.FieldByName('cod_resident').AsInteger;
    residentToSplit.nameResident := qryResidentsToSplit.FieldByName('name').AsString;
    residentToSplit.dt_in        := qryResidentsToSplit.FieldByName('dt_in').AsDateTime;
    residentToSplit.dt_out       := qryResidentsToSplit.FieldByName('dt_out').AsDateTime;
    residentToSplit.couple       := qryResidentsToSplit.FieldByName('couple').AsBoolean;
    bill.residents[i] := residentToSplit;
    qryResidentsToSplit.Next;
  end;

  if (MessageDlg('Would you like to confirm?'+#13#10+bill.split,mtConfirmation,mbYesNo,0)) = mrNo then
    Exit;

  try
    try
      frmDM.con.StartTransaction;
      qryInsereSplit := TFDQuery.Create(nil);
      qryInsereSplit.Connection := frmDM.con;

      qryInsereSplit.SQL.Clear;
      qryInsereSplit.SQL.Add('DELETE FROM SPLIT');
      qryInsereSplit.SQL.Add('WHERE COD_BILLS = :P_COD_BILLS');
      qryInsereSplit.ParamByName('P_COD_BILLS').AsInteger := qryBills.FieldByName('COD_BILLS').AsInteger;
      qryInsereSplit.ExecSQL;

      for i := 0 to Length(bill.residents)-1 do
      begin
        qryInsereSplit.SQL.Clear;
        qryInsereSplit.SQL.Add('INSERT INTO SPLIT(cod_resident, cod_bills, split_date, amount)');
        qryInsereSplit.SQL.Add('VALUES (:P_COD_RESIDENT, :P_COD_BILLS, datetime(''now''), :P_AMOUNT)');
        qryInsereSplit.ParamByName('P_COD_RESIDENT').AsInteger := bill.residents[i].cod_resident;
        qryInsereSplit.ParamByName('P_COD_BILLS').AsInteger    := bill.cod_bills;
        qryInsereSplit.ParamByName('P_AMOUNT').AsFloat         := bill.residents[i].amountPerUser;
        qryInsereSplit.ExecSQL;
      end;
    finally
      qryInsereSplit.Connection.Commit;
      qryInsereSplit.Free;
      qryResidentsToSplit.Free;
    end;
  except
    qryInsereSplit.Connection.Rollback;
    qryInsereSplit.Free;
    qryResidentsToSplit.Free;
  end;

  loadSplit;

  bill := nil;
  qryInsereSplit := nil;
  qryResidentsToSplit := nil;
end;

procedure TfrmMain.btnOnePersonPaysClick(Sender: TObject);
var
  bill: TBill;
  qryInsereSplit: TFDQuery;
  frmOnePersonPays: TfrmOnePersonPays;
  residentOnePersonPay: TResident;
begin
  residentOnePersonPay := TResident.Create;

  frmOnePersonPays := TfrmOnePersonPays.Create(nil,
   THouse(cbbHouse.Items.Objects[cbbHouse.ItemIndex]));
  if frmOnePersonPays.ShowModal = IDOK then
    residentOnePersonPay := frmOnePersonPays.resident;

  bill := TBill.Create;
  bill.cod_bills      := qryBills.FieldByName('cod_bills').AsInteger;
  bill.nameBill       := qryBills.FieldByName('name').AsString;
  bill.amount         := qryBills.FieldByName('amount').AsFloat;
  bill.dead_line      := qryBills.FieldByName('dead_line').AsDateTime;
  bill.paid_day       := qryBills.FieldByName('paid_day').AsDateTime;
  bill.cod_house      := qryBills.FieldByName('cod_house').AsInteger;
  bill.dt_from        := qryBills.FieldByName('dt_from').AsDateTime;
  bill.dt_to          := qryBills.FieldByName('dt_to').AsDateTime;
  bill.cod_bill_type  := qryBills.FieldByName('cod_bill_type').AsInteger;

  SetLength(bill.residents,1);
  bill.residents[0] := residentOnePersonPay;

  bill.residents[0].amountPerUser := bill.amount;

  if (MessageDlg('Would you like to confirm?'+#13#10+bill.onePersonPays,mtConfirmation,mbYesNo,0)) = mrNo then
    Exit;

  try
    try
      frmDM.con.StartTransaction;
      qryInsereSplit := TFDQuery.Create(nil);
      qryInsereSplit.Connection := frmDM.con;

      qryInsereSplit.SQL.Clear;
      qryInsereSplit.SQL.Add('DELETE FROM SPLIT');
      qryInsereSplit.SQL.Add('WHERE COD_BILLS = :P_COD_BILLS');
      qryInsereSplit.ParamByName('P_COD_BILLS').AsInteger := qryBills.FieldByName('COD_BILLS').AsInteger;
      qryInsereSplit.ExecSQL;

      qryInsereSplit.SQL.Clear;
      qryInsereSplit.SQL.Add('INSERT INTO SPLIT(cod_resident, cod_bills, split_date, amount)');
      qryInsereSplit.SQL.Add('VALUES (:P_COD_RESIDENT, :P_COD_BILLS, datetime(''now''), :P_AMOUNT)');
      qryInsereSplit.ParamByName('P_COD_RESIDENT').AsInteger := bill.residents[0].cod_resident;
      qryInsereSplit.ParamByName('P_COD_BILLS').AsInteger    := bill.cod_bills;
      qryInsereSplit.ParamByName('P_AMOUNT').AsFloat         := bill.residents[0].amountPerUser;
      qryInsereSplit.ExecSQL;
    finally
      qryInsereSplit.Connection.Commit;
      qryInsereSplit.Free;
    end;
  except
    qryInsereSplit.Connection.Rollback;
    qryInsereSplit.Free;
  end;

  loadSplit;
  frmOnePersonPays.Free;
  bill := nil;
  qryInsereSplit := nil;
end;

procedure TfrmMain.cbbBillTypeChange(Sender: TObject);
begin
  if cbbBillType.ItemIndex <> 0 then
  begin
    qryBills.Filter := 'cod_bill_type = '
    +IntToStr(TBillType(cbbBillType.Items.Objects[cbbBillType.ItemIndex]).cod_bill_type);
    loadBills;
  end
  else
  begin
    loadBills;
  end;
end;

procedure TfrmMain.cbbHouseChange(Sender: TObject);
begin
  loadBills;
end;

procedure TfrmMain.cbbHouseClick(Sender: TObject);
begin
  loadHouses(cbbHouse);
end;

procedure TfrmMain.cbbHouseEnter(Sender: TObject);
begin
  loadHouses(cbbHouse);
end;

procedure TfrmMain.chkSendFilterClick(Sender: TObject);
begin
  loadBills;
end;

function TfrmMain.connectDB :Boolean;
begin
  Result := False;
  try
    if FileExists(UDM.frmDM.con.Params.Database) then
      UDM.frmDM.con.Open
    else
    begin
      if  MessageDlg('Could not find dbSplitBills.db'
      +', would you like to find it by yourself?'
      , mtConfirmation, [mbYes,mbNo],0) = mrNo then
        Exit;

      if not(UDM.frmDM.openDBFile) then
        Exit;
    end;
    Result := True;
  except
    on E: EDatabaseError do
    begin
      MessageDlg('Exception raised on TfrmMain.connectDB: ' + E.Message
      , mtError, [mbOK],0);
    end;
  end;
end;

function TfrmMain.createMIMEField: Boolean;
var
  qryCreateMIMEField: TFDQuery;
begin
  Result := False;
  try
    qryCreateMIMEField := TFDQuery.Create(nil);
    qryCreateMIMEField.Connection := UDM.frmDM.con;
    qryCreateMIMEField.Connection.StartTransaction;
    qryCreateMIMEField.SQL.Add('ALTER TABLE BILLS ADD COLUMN mime_type VARCHAR(5)');
    qryCreateMIMEField.ExecSQL;
    qryCreateMIMEField.Connection.Commit;
    MessageDlg('The field mime_type was sucesfull created.', mtInformation, [mbOK],0);
    load;
    Result := True;
  except
    qryCreateMIMEField.Connection.Rollback;
    qryCreateMIMEField.Free;
    Result := False;
  end;
end;

procedure TfrmMain.Createmimetypefield1Click(Sender: TObject);
var
  qryCreateMIMEField: TFDQuery;
begin
  try
    qryCreateMIMEField := TFDQuery.Create(nil);
    qryCreateMIMEField.Connection := UDM.frmDM.con;
    qryCreateMIMEField.Connection.StartTransaction;
    qryCreateMIMEField.SQL.Add('ALTER TABLE BILLS ADD COLUMN mime_type VARCHAR(5)');
    qryCreateMIMEField.ExecSQL;
    qryCreateMIMEField.Connection.Commit;
    MessageDlg('The field mime_type was sucesfull created.', mtInformation, [mbOK],0);
    load;
  except
    on E: Exception do
    begin
      MessageDlg('Erro:' + E.Message, mtError, [mbOK],0);
    end;
  end;
end;

procedure TfrmMain.dbgrdBillsCellClick(Column: TColumn);
begin
  ativaDesativaBills(false);
  loadSplit;
end;

procedure TfrmMain.dbgrdBillsDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  grid: TDBGrid;
begin
  grid := Sender as TDBGrid;
  if (grid.DataSource.DataSet.FieldByName('dead_line').AsDateTime < Date)
  and grid.DataSource.DataSet.FieldByName('paid_day').IsNull  then
    grid.Canvas.Font.Color := clRed;

  grid.DefaultDrawColumnCell(Rect, DataCol, Column, State) ;
end;

procedure TfrmMain.dbgrdBillsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  loadSplit;
end;

procedure TfrmMain.dbgrdBillsKeyPress(Sender: TObject; var Key: Char);
begin
  loadSplit;
end;

procedure TfrmMain.dbgrdBillsKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  loadSplit;
end;

procedure TfrmMain.dblkcbbBillTypeContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
 loadBillsType;
end;

procedure TfrmMain.dblkcbbBillTypeDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  loadBills;
end;

procedure TfrmMain.dbnvgrBillsClick(Sender: TObject; Button:
 TNavigateBtn);
begin
case Button of
    nbInsert:
    begin
      qryBills.FieldByName('cod_bill_type').AsInteger := 1;
      qryBills.FieldByName('cod_house').AsInteger := THouse(cbbHouse.Items.Objects[cbbHouse.ItemIndex]).cod_house;
      dtpBillTo.DateTime := Now -30;
      dtpBillFrom.DateTime := now;
      dtpDeadLine.DateTime := now;
      dbchkSend.Checked := True;
      ativaDesativaBills(true);
      dblkcbbBillType.SetFocus;
    end;
    nbEdit:
    begin
      ativaDesativaBills(true);
      dblkcbbBillType.SetFocus;
    end;
    nbCancel:
    begin
      ativaDesativaBills(false);
    end;
  end;
end;

function TfrmMain.deleteBillFile: Boolean;
var
 qryDeleteFile :TFDQuery;
begin
  Result := false;
  if (MessageDlg('Are you sure to remove this file?', mtConfirmation, mbYesNo,0)=mrNo) then
    Exit;
  try
    qryDeleteFile := TFDQuery.Create(nil);
    qryDeleteFile.Connection := UDM.frmDM.con;
    qryDeleteFile.Connection.StartTransaction;
    qryDeleteFile.SQL.Clear;
    qryDeleteFile.SQL.Add('UPDATE BILLS');
    qryDeleteFile.SQL.Add('SET attachment = null, mime_type = null');
    qryDeleteFile.SQL.Add('WHERE cod_bills = :P_COD_BILL');
    qryDeleteFile.ParamByName('P_COD_BILL').AsInteger := qryBills.FieldByName('cod_bills').AsInteger;
    qryDeleteFile.ExecSQL;
  finally
    qryDeleteFile.Connection.Commit;
    qryDeleteFile.Free;
    Result := True;
  end;
end;

procedure TfrmMain.dsBillsUpdateData(Sender: TObject);
begin
  //loadBills;
end;

procedure TfrmMain.dtpBillFromChange(Sender: TObject);
begin
  qryBills.Edit;
end;

procedure TfrmMain.dtpBillToChange(Sender: TObject);
begin
  qryBills.Edit;
end;

procedure TfrmMain.dtpDeadLineChange(Sender: TObject);
begin
  qryBills.Edit;
end;

procedure TfrmMain.FindaDatabaseFile1Click(Sender: TObject);
begin
  frmDM.openDBFile;
  load;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if dbedtname.Enabled then
  begin
    MessageDlg('Before close you should confirn or cancel the edits' , mtError, [mbOk],0, mbOk);
    CanClose := False;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  if FileExists(ObterDiretorioDoExecutavel+'SplitBillsNew.exe')then
    DeleteFile(ObterDiretorioDoExecutavel+'SplitBillsNew.exe');

  if FileExists(ObterDiretorioDoExecutavel+'SplitBillsOld.exe') then
    DeleteFile(ObterDiretorioDoExecutavel+'SplitBillsOld.exe');
  if connectDB then
    load
  else
    Application.Terminate;
end;

procedure TfrmMain.House1Click(Sender: TObject);
var
  frmManageHouse: TfrmManageHouses;
begin
  frmManageHouse := TfrmManageHouses.Create(nil);
  try
    frmManageHouse.ShowModal;
  finally
    frmManageHouse.Free;
  end;
end;

procedure TfrmMain.load;
begin
  frmMain.Caption := 'Split Bills - ' + frmDM.con.Params.Database;
  //createMIMEField;
  loadHouses(cbbHouse);
  loadBillsType;
  loadBillTypeFilter(cbbBillType);
  loadBills;
end;

procedure TfrmMain.loadBills;
begin
  qryBills.Close;

  qryBills.SQL.Clear;
  qryBills.SQL.Add('SELECT t.type,b.*');
  qryBills.SQL.Add('from bills b');
  qryBills.SQL.Add('inner join bill_type t on (b.cod_bill_type = t.cod_bill_type)');
  qryBills.SQL.Add('where b.cod_house = :P_COD_HOUSE');
  if cbbBillType.ItemIndex > 0 then
    qryBills.SQL.Add('and b.cod_bill_type = :P_COD_BILL_TYPE');
  if chkSendFilter.Checked then
    qryBills.SQL.Add('and send = true');
  qryBills.SQL.Add('order by b.dead_line desc');

  if cbbBillType.ItemIndex > 0 then
    qryBills.ParamByName('P_COD_BILL_TYPE').AsInteger
    := TBillType(cbbBillType.Items.Objects[cbbBillType.ItemIndex]).cod_bill_type;

  qryBills.ParamByName('P_COD_HOUSE').AsInteger
  := THouse(cbbHouse.Items.Objects[cbbHouse.ItemIndex]).cod_house;
  qryBills.Open;

  ativaDesativaBills(false);
  loadSplit;
end;

procedure TfrmMain.loadBillsType;
begin
  qryBillType.Close;
  qryBillType.Open;
end;

procedure TfrmMain.loadBillTypeFilter(lista: TComboBox);
var
  billType: TBillType;
begin
  loadBillsType;
  lista.Clear;
  lista.Items.Add('All');
  qryBillType.First;
  while not qryBillType.Eof do
  begin
    billType := TBillType.Create;
    billType.cod_bill_type := qryBillType.FieldByName('cod_bill_type').AsInteger;
    billType.billType := qryBillType.FieldByName('type').AsString;
    lista.Items.AddObject(billType.billType,TObject(billType));
    qryBillType.Next;
  end;
  lista.ItemIndex := 0;
end;

procedure TfrmMain.loadDates;
begin
  dtpBillTo.Date   := qryBills.FieldByName('dt_to').AsDateTime;
  dtpBillFrom.Date := qryBills.FieldByName('dt_from').AsDateTime;
  dtpDeadLine.Date := qryBills.FieldByName('dead_line').AsDateTime;
end;

procedure TfrmMain.loadFileButtons;
begin
  btnAddFile.Enabled := btnAddFile.Enabled and (qryBills.FieldByName('mime_type').AsString = '');
  btnDeleteFile.Enabled := btnDeleteFile.Enabled and not(btnAddFile.Enabled);
  btnOpenFile.Enabled := qryBills.FieldByName('mime_type').AsString <> '';
end;

procedure TfrmMain.loadHouses(lista: TComboBox);
var
  house: THouse;
begin
  frmDM.qryHouse.Close;
  frmDM.qryHouse.Open;
  frmDM.qryHouse.First;
  lista.Clear;
  while not frmDM.qryHouse.Eof do
  begin
    house := THouse.Create;
    house.nickName  := frmDM.qryHouse.FieldByName('nick_name').AsString;
    house.adress    := frmDM.qryHouse.FieldByName('adress').AsString;
    house.cod_house := frmDM.qryHouse.FieldByName('cod_house').AsInteger;
    lista.Items.AddObject(house.nickName, TObject(house));
    frmDM.qryHouse.Next;
  end;
  lista.ItemIndex := 0;
end;

procedure TfrmMain.loadSplit;
begin
  qrySplit.Close;
  qrySplit.ParamByName('P_COD_BILLS').AsInteger
  := qryBills.FieldByName('COD_BILLS').AsInteger;
  qrySplit.Open;

  loadFileButtons;
  loadDates;
end;

procedure TfrmMain.NewBillCategory1Click(Sender: TObject);
var
  frmCategoria: TfrmCategorias;
begin
  frmCategoria := TfrmCategorias.Create(nil);
  try
    frmCategoria.ShowModal;
  finally
    frmCategoria.Free;
  end;
end;

procedure TfrmMain.qryBillsAfterApplyUpdates(DataSet: TFDDataSet;
  AErrors: Integer);
begin
  loadBills;
  dbgrdBills.Refresh
end;

procedure TfrmMain.qryBillsAfterEdit(DataSet: TDataSet);
begin
  loadBills;
end;

procedure TfrmMain.qryBillsAfterPost(DataSet: TDataSet);
begin
  loadBills;
end;

procedure TfrmMain.qryBillsBeforeApplyUpdates(DataSet: TFDDataSet);
begin
  loadBills;
end;

procedure TfrmMain.qryBillsBeforeInsert(DataSet: TDataSet);
begin
  //dblkcbbBillType.SetFocus;
end;

procedure TfrmMain.qryBillsBeforePost(DataSet: TDataSet);
begin
  qryBills.FieldByName('cod_house').AsInteger
  := THouse(cbbHouse.Items.Objects[cbbHouse.ItemIndex]).cod_house;
  qryBills.FieldByName('dt_to').AsDateTime := dtpBillTo.Date;
  qryBills.FieldByName('dt_from').AsDateTime := dtpBillFrom.Date;
  qryBills.FieldByName('dead_line').AsDateTime := dtpDeadLine.Date;
  qryBills.FieldByName('send').AsBoolean := dbchkSend.Checked;
end;

procedure TfrmMain.Searchforupdates1Click(Sender: TObject);
var
  frmUpdate :TfrmUpdate;
begin
  frmUpdate := TfrmUpdate.Create(nil);
  try
    frmUpdate.ShowModal;
  finally
    frmUpdate.Free;
  end;
end;

procedure TfrmMain.SendEmail;
var
  frmEmail: TfrmEmail;
begin
  frmEmail := TfrmEmail.Create(nil);
  try
    frmEmail.sendEmail(UsuarioLogado);
  finally
    frmEmail.Free;
  end;
end;

procedure TfrmMain.SendEmail1Click(Sender: TObject);
var
  frmEmail: TfrmEmail;
begin
  frmEmail := TfrmEmail.Create(nil);
  try
    frmEmail.ShowModal;
  finally
    frmEmail.Free;
  end;
end;

function TfrmMain.UsuarioLogado : string;
var
  nsize: Cardinal;
  UserName: string;
begin
  nsize := 25;
  SetLength(UserName,nsize);
  if GetUserName(PChar(UserName), nsize) then
  begin
  SetLength(UserName,nsize-1);
  Result := UserName;
  end;
end;

function TfrmMain.downloadFile: string;
var
  nomeArquivo: String;
  path: string;
begin
  path := GetEnvironmentVariable('TEMP')+'\splitBills\';
  if not DirectoryExists(Path)then
    CreateDir(Path);
  DeleteFile(path+'*.*');

  nomeArquivo :=  path+IntToStr(random(1000))+qryBills.FieldByName('mime_type').AsString;
  (qryBills.FieldByName('attachment') as TBlobField).SaveToFile(nomeArquivo);
  result := nomeArquivo
end;

{
procedure ExpXLS(DataSet: TDataSet; Arq: string);
var
  ExcApp: OleVariant;
  i,l: integer;
  header: TStringList;
begin
  header := TStringList.Create;
  header := DataSet.FieldList;
  ExcApp := CreateOleObject('Excel.Application');
  ExcApp.Visible := False;
  ExcApp.WorkBooks.Add;
  DataSet.First;
  l := 2;
  DataSet.First;
  ProgressBar.Min := 0;
  ProgressBar.Max := DataSet.RecordCount;
  while not DataSet.EOF do
  begin
    //Cabecalhos
    for i := 0 to DataSet.Fields.Count - 1 do
      ExcApp.WorkBooks[1].Sheets[1].Cells[1,i + 1] := header[i];
    //Conteudo
    for i := 0 to DataSet.Fields.Count - 1 do
      ExcApp.WorkBooks[1].Sheets[1].Cells[l,i + 1] := DataSet.Fields[i].DisplayText;
    DataSet.Next;
    l := l + 1;
    ProgressBar.StepIt;
  end;
  try
    ExcApp.WorkBooks[1].SaveAs(Arq);
    except
      on E: Exception do
      begin
        MessageDlg('Erro:' + E.Message, mtError, [mbOK],0);
      end;
  end;
  ProgressBar.Position := 0;
  ExcApp.Visible := true;
end;
}
end.
