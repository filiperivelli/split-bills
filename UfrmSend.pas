unit UfrmSend;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.Buttons, UClasses,
  Vcl.Grids, Vcl.DBGrids, frxClass, frxDBSet, frxExportBaseDialog, frxExportPDF,
  Vcl.WinXCalendars;

type
  TfrmSend = class(TForm)
    qrySend: TFDQuery;
    dbgrdReport: TDBGrid;
    dsSend: TDataSource;
    frxrprt1: TfrxReport;
    frxdbdtst1: TfrxDBDataset;
    frxPDFExport: TfrxPDFExport;
    btnToPdf: TButton;
    dlgSave: TSaveDialog;
    qryBills: TFDQuery;
    frxdbBills: TfrxDBDataset;
    strngfldBillstype: TStringField;
    dtfldBillsdt_from: TDateField;
    dtfldBillsdt_to: TDateField;
    fltfldBillsamount: TFloatField;
    lblDueDate: TLabel;
    dtpDueDate: TDateTimePicker;
    procedure send(qry: TFDQuery);
    procedure FormCreate(Sender: TObject);
    procedure cbbHouseChange(Sender: TObject);
    procedure sendWhatsApp (msg: string);
    procedure btnToPdfClick(Sender: TObject);
    procedure bills(qry: TFDQuery);
    procedure frxrprt1GetValue(const VarName: string; var Value: Variant);
    procedure dbgrdReportDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    pHouse :THouse;
    house  :THouse;
    constructor Create(AOwner : TComponent; pHouse: THouse);
  end;

var
  frmSend: TfrmSend;

implementation

uses
  UFrmMain, UDM, Winapi.ShellAPI, ClipBrd;

{ TfrmSend }

procedure TfrmSend.bills(qry: TFDQuery);
begin
  qry.Connection := frmDM.con;
  qry.SQL.Clear;
  qry.SQL.Add('select t.type, b.dt_from, b.dt_to, b.amount');
  qry.SQL.Add('from bills b');
  qry.SQL.Add('inner join bill_type t on (b.cod_bill_type = t.cod_bill_type)');
  qry.SQL.Add('where send = 1');
  qry.SQL.Add('and b.cod_house = :P_COD_HOUSE');
  qry.ParamByName('P_COD_HOUSE').AsInteger := house.cod_house;
  qry.Open;
end;

procedure TfrmSend.btnToPdfClick(Sender: TObject);
var
  time: string;
begin
  DateTimeToString(time,'_YYYY_MM_DD_HH_NN',Now);
  dlgSave.FileName := 'Report'+time+'.pdf';
  if dlgSave.Execute then
  begin
    if dlgSave.FileName <> '*.pdf'  then
    begin
      frxPDFExport.FileName := dlgSave.FileName;
      frxrprt1.PrintOptions.ShowDialog := False;
      frxPDFExport.ShowDialog := False;
      frxrprt1.PrepareReport();
      frxrprt1.Export(frxPDFExport);
      try
        ShellExecute(Handle, 'open', PChar(frxPDFExport.FileName), nil, nil, SW_SHOW);
      except
        MessageDlg('File not found.',mtError,mbOKCancel,0);
      end;
    end;
  end;
end;

procedure TfrmSend.cbbHouseChange(Sender: TObject);
begin
  send(qrySend);
end;

constructor TfrmSend.Create(AOwner: TComponent; pHouse: THouse);
begin
  inherited Create(AOwner);
  house := THouse.Create;
  house := pHouse;
end;

procedure TfrmSend.dbgrdReportDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  grid: TDBGrid;
begin
  grid := Sender as TDBGrid;
  if grid.DataSource.DataSet.FieldByName('title').AsString = 'Total'  then
    grid.Canvas.Font.Style := grid.Canvas.Font.Style + [fsBold];

  grid.DefaultDrawColumnCell(Rect, DataCol, Column, State) ;
end;

procedure TfrmSend.FormCreate(Sender: TObject);
begin
  send(qrySend);
  bills(qryBills);
end;

procedure TfrmSend.frxrprt1GetValue(const VarName: string; var Value: Variant);
begin
  if CompareText(VarName, 'due_date') = 0 then
    Value := dtpDueDate.Date;
end;

procedure TfrmSend.send(qry: TFDQuery);
var
  dueDateD: TDateTime;
  dueDateS: String;
begin
  qry.Connection := frmDM.con;
  qry.SQL.Clear;
  qry.SQL.Add('select * from (');
  qry.SQL.Add('select r.name, r.name as display_name , round(s.amount,2) as amount, t.type as title');
  qry.SQL.Add(', ''0'' as x, strftime(''%d/%m/%Y'', b.dead_line) as due_date');
  qry.SQL.Add('from split s');
  qry.SQL.Add('inner join residents r on (s.cod_resident = r.cod_resident)');
  qry.SQL.Add('inner join bills b on (s.cod_bills = b.cod_bills )');
  qry.SQL.Add('inner join bill_type t on (t.cod_bill_type = b.cod_bill_type)');
  qry.SQL.Add('where b.send is true');
  qry.SQL.Add('and b.cod_house = :P_COD_HOUSE');
  qry.SQL.Add('and s.amount > 0');
  qry.SQL.Add('UNION');
  qry.SQL.Add('select r.name ,r.name as display_name ,(sum(round(s.amount,2))) as amount, ''Total'' as title');
  qry.SQL.Add(', ''1'' as x, '''' as due_date');
  qry.SQL.Add('from split s');
  qry.SQL.Add('inner join residents r on (s.cod_resident = r.cod_resident)');
  qry.SQL.Add('inner join bills b on (s.cod_bills = b.cod_bills)');
  qry.SQL.Add('where b.send is true');
  qry.SQL.Add('and b.cod_house = :P_COD_HOUSE');
  qry.SQL.Add('and s.amount > 0');
  qry.SQL.Add('GROUP by r.name');
  qry.SQL.Add(') order by display_name, x');
  qry.ParamByName('P_COD_HOUSE').AsInteger := house.cod_house;
  qry.Open;

  dbgrdReport.Columns.Add;
  dbgrdReport.Columns.Items[0].Field := qry.FieldByName('display_name');
  dbgrdReport.Columns.Items[0].Width := 144;
  dbgrdReport.Columns.Items[0].Title.Caption := 'Name';

  dbgrdReport.Columns.Add;
  dbgrdReport.Columns.Items[1].Field := qry.FieldByName('title');
  dbgrdReport.Columns.Items[1].Width := 144;
  dbgrdReport.Columns.Items[1].Title.Caption := 'Bill';

  dbgrdReport.Columns.Add;
  dbgrdReport.Columns.Items[2].Field := qry.FieldByName('amount');
  dbgrdReport.Columns.Items[2].Width := 80;
  dbgrdReport.Columns.Items[2].Title.Caption := 'Amount';

  dbgrdReport.Columns.Add;
  dbgrdReport.Columns.Items[3].Field := qry.FieldByName('due_date');
  dbgrdReport.Columns.Items[3].Width := 80;
  dbgrdReport.Columns.Items[3].Title.Caption := 'Bill Due Date';

  qry.First;
  dueDateS :=  qry.FieldByName('due_date').AsString;
  dueDateD :=  StrToDate(dueDateS);
  dtpDueDate.Date := dueDateD;
  while not qry.Eof do
  begin
    if qry.FieldByName('title').AsString <> 'Total' then
    begin
      if qry.FieldByName('due_date').AsDateTime < dueDateD then
      begin
        dueDateS :=  qry.FieldByName('due_date').AsString;
        dueDateD :=  StrToDate(dueDateS);
        dtpDueDate.Date := dueDateD;
      end;
    end;
    qry.Next;
  end;
end;

procedure TfrmSend.sendWhatsApp(msg: string);
var
  url: string;
begin
  url :=  'https://web.whatsapp.com/send?text='+msg;
  ShellExecute(Handle,
               'open',
               PChar(url),
               nil,
               nil,
               SW_SHOWMAXIMIZED);
end;

{$R *.dfm}

end.
