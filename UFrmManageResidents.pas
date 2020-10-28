unit UFrmManageResidents;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.Buttons, UClasses;

type
  TfrmManageResidents = class(TForm)
    dsResidents: TDataSource;
    qryResidents: TFDQuery;
    lblName: TLabel;
    dbedtname: TDBEdit;
    lblEmail: TLabel;
    dbedtemail: TDBEdit;
    lblMobile: TLabel;
    dbedtmobile: TDBEdit;
    dbchkCouple: TDBCheckBox;
    dbgrdResidents: TDBGrid;
    dbnvgr1: TDBNavigator;
    lbl4: TLabel;
    dbedtdt_in: TDBEdit;
    lbl5: TLabel;
    dbedtdt_out: TDBEdit;
    strngfldResidentsname: TStringField;
    blnfldResidentscouple: TBooleanField;
    strngfldResidentsemail: TStringField;
    strngfldResidentsmobile: TStringField;
    intgrfldResidentscod_house: TIntegerField;
    dtfldResidentsdt_in: TDateField;
    dtfldResidentsdt_out: TDateField;
    strngfldResidentshouse: TStringField;
    edtNameFilter: TEdit;
    lblNameFilter: TLabel;
    btnClear: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure edtNameFilterKeyPress(Sender: TObject; var Key: Char);
    procedure btnClearClick(Sender: TObject);
    procedure dbnvgr1Click(Sender: TObject; Button: TNavigateBtn);
    procedure qryResidentsBeforePost(DataSet: TDataSet);
    procedure qryResidentsAfterPost(DataSet: TDataSet);
    procedure ativaDesativaResidents(ativa: Boolean);
    procedure qryResidentsBeforeInsert(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure qryResidentsDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
  private
    { Private declarations }
  public
    { Public declarations }
    pHouse :THouse;
    house  :THouse;
    constructor Create(AOwner : TComponent; pHouse: THouse);
  end;

var
  frmManageResidents: TfrmManageResidents;

implementation

uses
UDM;

{$R *.dfm}
constructor TfrmManageResidents.Create(AOwner: TComponent; pHouse: THouse);
begin
  inherited Create(AOwner);
  house := THouse.Create;
  house := pHouse;
end;

procedure TfrmManageResidents.ativaDesativaResidents(ativa: Boolean);
begin
  dbedtname.Enabled := ativa;
  dbedtdt_in.Enabled := ativa;
  dbedtemail.Enabled := ativa;
  dbedtdt_out.Enabled := ativa;
  dbedtmobile.Enabled := ativa;
  dbchkCouple.Enabled := ativa;
end;

procedure TfrmManageResidents.btnClearClick(Sender: TObject);
begin
  qryResidents.Filter := '';
  edtNameFilter.Text := '';
  qryResidents.Filtered := False;
  qryResidents.Open;
end;

procedure TfrmManageResidents.dbnvgr1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  case Button of
    nbInsert:
    begin
      dbchkCouple.Checked := False;
    end;
    nbEdit:
    begin
      ativaDesativaResidents(true);
      dbedtname.SetFocus;
    end;
    nbPost:
      ativaDesativaResidents(false);
    nbCancel:
      ativaDesativaResidents(false);
  end;
end;

procedure TfrmManageResidents.edtNameFilterKeyPress(Sender: TObject;
  var Key: Char);
begin
  qryResidents.Filter := 'upper(name) like ''%'
  + UpperCase(edtNameFilter.Text) + '%''';
  qryResidents.Filtered := True;
end;

procedure TfrmManageResidents.qryResidentsAfterPost(DataSet: TDataSet);
begin
  qryResidents.Close;
  qryResidents.Open;
end;

procedure TfrmManageResidents.qryResidentsBeforeInsert(DataSet: TDataSet);
begin
  ativaDesativaResidents(true);
  dbedtname.SetFocus;
end;

procedure TfrmManageResidents.qryResidentsBeforePost(DataSet: TDataSet);
begin
  qryResidents.FieldByName('cod_house').AsInteger := house.cod_house;
  if dbedtdt_in.Text = '' then
  begin
    raise Exception.Create('Move in cannot be empty.');
    dbedtdt_in.SetFocus;
  end;

  if dbedtdt_out.Text = '' then
  begin
    raise Exception.Create('Move out cannot be empty.');
    dbedtdt_out.SetFocus;
  end;
end;

procedure TfrmManageResidents.qryResidentsDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MessageDlg('This resident has bills, you should delete it before deleting resident.' , mtError, [mbOk],0, mbOk);
end;

procedure TfrmManageResidents.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if dbedtname.Enabled then
  begin
    MessageDlg('Before close you should confirn or cancel the edits' , mtError, [mbOk],0, mbOk);
    CanClose := False;
  end;
end;

procedure TfrmManageResidents.FormCreate(Sender: TObject);
begin
  qryResidents.Connection := UDM.frmDM.con;
  qryResidents.ParamByName('P_COD_HOUSE').AsInteger := house.cod_house;
  qryResidents.Open;
end;

procedure TfrmManageResidents.FormShow(Sender: TObject);
begin
  ativaDesativaResidents(false);
  Caption := 'Manager Residents - ' + house.nickName;
end;

end.
