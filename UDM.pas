unit UDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.Dialogs, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdFTP, Vcl.Controls;

type
  TfrmDM = class(TDataModule)
    con: TFDConnection;
    dsHouse: TDataSource;
    qryHouse: TFDQuery;
    fdtncfldHousecod_house: TFDAutoIncField;
    strngfldHouseadress: TStringField;
    strngfldHousenick_name: TStringField;
    dlgOpen: TOpenDialog;
    idftp2: TIdFTP;
    procedure DataModuleCreate(Sender: TObject);
    function openDBFile: Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDM: TfrmDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}
procedure TfrmDM.DataModuleCreate(Sender: TObject);
begin
{$IFDEF RELEASE}
  con.Params.Database := 'dbSplitBills.db';
{$ENDIF}

{$IFDEF DEBUG}
  con.Params.Database := 'C:\sqlite\dbSplitBills.db';
{$ENDIF}
end;

function TfrmDM.openDBFile: Boolean;
begin
  Result := False;
  dlgOpen.Title := 'Choose database';
  dlgOpen.FileName := '*.db';
  dlgOpen.Execute;
  if dlgOpen.FileName <> '*.db'  then
  begin
    con.Params.Database := dlgOpen.FileName;
    try
      con.Open;
      if con.Connected then
        Result := True;
    except
      on E: EDatabaseError do
      begin
        MessageDlg('Exception raised on TfrmDM.openDBFile: ' + E.Message
        , mtError, [mbOK],0);
      end;
    end;
  end;
end;
end.
