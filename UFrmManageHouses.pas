unit UFrmManageHouses;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask;

type
  TfrmManageHouses = class(TForm)
    dbgrdHouse: TDBGrid;
    dsHouse: TDataSource;
    qryHouse: TFDQuery;
    dbnvgrHouse: TDBNavigator;
    procedure FormCreate(Sender: TObject);
    procedure qryHouseBeforeInsert(DataSet: TDataSet);
    procedure qryHouseAfterPost(DataSet: TDataSet);
    procedure qryHouseBeforeEdit(DataSet: TDataSet);
    procedure qryHouseAfterCancel(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure qryHouseBeforePost(DataSet: TDataSet);
    procedure qryHouseDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManageHouses: TfrmManageHouses;

implementation

uses
UDM;
{$R *.dfm}

procedure TfrmManageHouses.qryHouseAfterCancel(DataSet: TDataSet);
begin
  dbgrdHouse.Enabled := False;
end;

procedure TfrmManageHouses.qryHouseAfterPost(DataSet: TDataSet);
begin
  qryHouse.Close;
  qryHouse.Open;
  dbgrdHouse.Enabled := False;
end;

procedure TfrmManageHouses.qryHouseBeforeEdit(DataSet: TDataSet);
begin
  dbgrdHouse.Enabled := True;
end;

procedure TfrmManageHouses.qryHouseBeforeInsert(DataSet: TDataSet);
begin
  dbgrdHouse.Enabled := True;
  dbgrdHouse.SetFocus;
end;

procedure TfrmManageHouses.qryHouseBeforePost(DataSet: TDataSet);
begin
  if qryHouse.FieldByName('adress').AsString = '' then
  begin
    raise Exception.Create('Adress cannot be empty.');
    dbgrdHouse.SetFocus;
  end;

  if qryHouse.FieldByName('nick_name').AsString = '' then
  begin
    raise Exception.Create('Nickname cannot be empty.');
    dbgrdHouse.SetFocus;
  end;
end;

procedure TfrmManageHouses.qryHouseDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  MessageDlg('You should delete residents before delete this house.' , mtError, [mbOk],0, mbOk);
end;

procedure TfrmManageHouses.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if dbgrdHouse.Enabled then
  begin
    MessageDlg('Before close you should confirn or cancel the edits' , mtError, [mbOk],0, mbOk);
    CanClose := False;
  end;
end;

procedure TfrmManageHouses.FormCreate(Sender: TObject);
begin
  qryHouse.Connection := UDM.frmDM.con;
  qryHouse.Active := True;
  dbgrdHouse.Enabled := False;
end;

end.
