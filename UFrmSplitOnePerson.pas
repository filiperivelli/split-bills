unit UFrmSplitOnePerson;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.DBCtrls, UClasses,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids;

type
  TfrmOnePersonPays = class(TForm)
    qryResidents: TFDQuery;
    btnOk: TBitBtn;
    cbbResidents: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure loadResidents(lista: TComboBox);
    procedure cbbResidentsChange(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    pHouse :THouse;
    house  :THouse;
    resident :TResident;
    constructor Create(AOwner : TComponent; pHouse: THouse);
  end;

var
  frmOnePersonPays: TfrmOnePersonPays;

implementation

  uses
    UDM;

{$R *.dfm}

procedure TfrmOnePersonPays.btnOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmOnePersonPays.cbbResidentsChange(Sender: TObject);
begin
  resident := TResident(cbbResidents.Items.Objects[cbbResidents.ItemIndex]);
end;

constructor TfrmOnePersonPays.Create(AOwner: TComponent; pHouse: THouse);
begin
  inherited Create(AOwner);
  house := THouse.Create;
  house := pHouse;
  resident := TResident.Create;
end;

procedure TfrmOnePersonPays.FormCreate(Sender: TObject);
begin
  loadResidents(cbbResidents);
  resident := TResident(cbbResidents.Items.Objects[cbbResidents.ItemIndex]);
end;

procedure TfrmOnePersonPays.loadResidents(lista: TComboBox);
var
  resident: TResident;
begin
  qryResidents.Close;
  qryResidents.ParamByName('P_COD_HOUSE').AsInteger := house.cod_house;
  qryResidents.Open;
  qryResidents.First;
  lista.Clear;
  while not qryResidents.Eof do
  begin
    resident := TResident.Create;
    resident.nameResident := qryResidents.FieldByName('name').AsString;
    resident.cod_resident := qryResidents.FieldByName('cod_resident').AsInteger;
    lista.Items.AddObject(resident.nameResident, TObject(resident));
    qryResidents.Next;
  end;
  lista.ItemIndex := 0;
end;
end.
