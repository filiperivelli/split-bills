unit UfrmUnsliptedBills;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls,UClasses;

type
  TfrmUnsplitedBills = class(TForm)
    lblWarnig: TLabel;
    dbgrdUnsplitedBills: TDBGrid;
    qryUnsplitedBills: TFDQuery;
    dsUnsplitedBills: TDataSource;
    function SearchForUnsplitedBills: Boolean;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    pHouse :THouse;
    house  :THouse;
    constructor Create(AOwner : TComponent; pHouse: THouse);
  end;

var
  frmUnsplitedBills: TfrmUnsplitedBills;

implementation

uses
UDM;

{$R *.dfm}

{ TfrmUnsplitedBills }
constructor TfrmUnsplitedBills.Create(AOwner: TComponent; pHouse: THouse);
begin
  inherited Create(AOwner);
  house := THouse.Create;
  house := pHouse;
end;

procedure TfrmUnsplitedBills.FormShow(Sender: TObject);
begin
  SearchForUnsplitedBills;
end;

function TfrmUnsplitedBills.SearchForUnsplitedBills;
begin
  qryUnsplitedBills.Connection := frmDM.con;
  qryUnsplitedBills.SQL.Clear;
  qryUnsplitedBills.SQL.Add('SELECT b.name as ''Bill'', b.amount as ''Amount''');
  qryUnsplitedBills.SQL.Add('from bills b');
  qryUnsplitedBills.SQL.Add('left join split s on (b.cod_bills=s.cod_bills)');
  qryUnsplitedBills.SQL.Add('where s.cod_split is null');
  qryUnsplitedBills.SQL.Add('and b.cod_house = :P_COD_HOUSE');
  qryUnsplitedBills.SQL.Add('and b.send = 1');
  qryUnsplitedBills.ParamByName('P_COD_HOUSE').AsInteger := house.cod_house;
  qryUnsplitedBills.Open;
  if qryUnsplitedBills.Eof then
    Result := False
  else
    Result := True;
end;

end.
