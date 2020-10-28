unit UFrmCategorias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmCategorias = class(TForm)
    qryBillType: TFDQuery;
    dsBillType: TDataSource;
    dbgrdBillType: TDBGrid;
    fdtncfldBillTypecod_bill_type: TFDAutoIncField;
    strngfldBillTypetype: TStringField;
    dbnvgrBillType: TDBNavigator;
    procedure FormCreate(Sender: TObject);
    procedure qryBillTypeBeforeInsert(DataSet: TDataSet);
    procedure qryBillTypeAfterPost(DataSet: TDataSet);
    procedure qryBillTypeBeforeEdit(DataSet: TDataSet);
    procedure qryBillTypeBeforeCancel(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure qryBillTypeDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCategorias: TfrmCategorias;

implementation
uses
UDM;
{$R *.dfm}

procedure TfrmCategorias.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if dbgrdBillType.Enabled then
  begin
    MessageDlg('Before close you should confirn or cancel the edits' , mtError, [mbOk],0, mbOk);
    CanClose := False;
  end;
end;

procedure TfrmCategorias.FormCreate(Sender: TObject);
begin
  qryBillType.Active := True;
  qryBillType.Open;
  dbgrdBillType.Enabled := False;
end;

procedure TfrmCategorias.qryBillTypeAfterPost(DataSet: TDataSet);
begin
  qryBillType.Close;
  qryBillType.Open;
  dbgrdBillType.Enabled := False;
end;

procedure TfrmCategorias.qryBillTypeBeforeCancel(DataSet: TDataSet);
begin
  dbgrdBillType.Enabled := False;
end;

procedure TfrmCategorias.qryBillTypeBeforeEdit(DataSet: TDataSet);
begin
  dbgrdBillType.Enabled := True;
  dbgrdBillType.SetFocus;
end;

procedure TfrmCategorias.qryBillTypeBeforeInsert(DataSet: TDataSet);
begin
  dbgrdBillType.Enabled := True;
  dbgrdBillType.SetFocus;
end;

procedure TfrmCategorias.qryBillTypeDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MessageDlg('This category has bills, you should delete it before deleting category.' , mtError, [mbOk],0, mbOk);
end;

end.
