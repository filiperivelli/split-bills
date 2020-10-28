unit UFrmAvg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls,
  Vcl.Buttons, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls,
  Vcl.Samples.Spin, Vcl.WinXPickers;

type
  TfrmAvg = class(TForm)
    redtAvg: TRichEdit;
    qryAvg: TFDQuery;
    btnOk: TBitBtn;
    lblYear: TLabel;
    dtpckr: TDatePicker;
    lblResidents: TLabel;
    seResidents: TSpinEdit;
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    codHouse: integer;
  public
    { Public declarations }
    constructor Create(AOwner : TComponent; pcodHouse : integer);
  end;

var
  frmAvg: TfrmAvg;
  month: TArray<String> =
 ['January'
,'February'
,'March'
,'April'
,'May'
,'June'
,'July'
,'August'
,'September'
,'October'
,'November'
,'December'];

implementation

uses
  System.DateUtils, UDM, UFuncions, UConstant;

{$R *.dfm}
constructor TfrmAvg.Create(AOwner: TComponent; pcodHouse: Integer);
begin
  inherited Create(AOwner);
  codHouse := pcodHouse;
end;

procedure TfrmAvg.btnOkClick(Sender: TObject);
var
  i,j,days,residents: Integer;
  daysOverlap: Integer;
  amount, monthTotal :Float64;
  firstDay, lastDay :TDate;
begin
  residents := StrToInt(seResidents.Text);
  qryAvg.ParamByName('P_COd_HOUSE').AsInteger := codHouse;
  qryAvg.Open;
  qryAvg.First;
  redtAvg.Clear;
  firstDay := StrToDate('01/01/'+IntToStr(System.DateUtils.YearOf(dtpckr.Date)));
  for i := 0 to 11 do
  begin
    days := DaysInAMonth(System.DateUtils.YearOf(dtpckr.Date),i+1);
    lastDay := firstDay + (days-1);
    monthTotal := 0;

    //Mes, primeiro e ultimo dia
    redtAvg.SelAttributes.Style := redtAvg.SelAttributes.Style + [fsBold];
    redtAvg.Lines.Add(month[i]);
    redtAvg.SelAttributes.Style := redtAvg.SelAttributes.Style - [fsBold];

    while not qryAvg.Eof do
    begin
      daysOverlap := UFuncions.DaysRangeOverlap(
      firstDay
      ,lastDay
      ,qryAvg.FieldByName('dt_from').AsDateTime
      ,qryAvg.FieldByName('dt_to').AsDateTime);
      amount := (daysOverlap * qryAvg.FieldByName('perDay').AsFloat)/residents;
      monthTotal := monthTotal + amount;

      //Tipo de conta e total
      redtAvg.Lines.Add(
      qryAvg.FieldByName('type').AsString+FormatFloat(' AUD$ ,0.00',amount));
      qryAvg.Next;
    end;
    redtAvg.Lines.Add(
    'Total per resident'+ FormatFloat(' AUD$ ,0.00',monthTotal));
    redtAvg.Lines.Add('');
    firstDay := lastDay +1;
    qryAvg.First;
  end;
end;

procedure TfrmAvg.FormCreate(Sender: TObject);
begin
  redtAvg.Clear;
  dtpckr.Date := now;
end;

end.
