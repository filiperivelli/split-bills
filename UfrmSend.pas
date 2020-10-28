unit UfrmSend;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.Buttons;

type
  TfrmSend = class(TForm)
    cbbHouse: TComboBox;
    qrySend: TFDQuery;
    redtSend: TRichEdit;
    btnCopy: TBitBtn;
    btnShare: TButton;
    procedure send(qry: TFDQuery);
    procedure FormCreate(Sender: TObject);
    procedure cbbHouseChange(Sender: TObject);
    procedure sendWhatsApp (msg: string);
    procedure btnCopyClick(Sender: TObject);
    procedure btnShareClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSend: TfrmSend;

implementation

uses
  UFrmMain, UDM, UClasses, Winapi.ShellAPI, ClipBrd;

{ TfrmSend }

procedure TfrmSend.btnCopyClick(Sender: TObject);
begin
  Clipboard.AsText := redtSend.Text;
end;

procedure TfrmSend.btnShareClick(Sender: TObject);
begin
  sendWhatsApp(redtSend.Text);
end;

procedure TfrmSend.cbbHouseChange(Sender: TObject);
begin
  send(qrySend);
end;

procedure TfrmSend.FormCreate(Sender: TObject);
begin
  btnShare.Visible := False;
  frmMain.loadHouses(cbbHouse);
  cbbHouse.ItemIndex := frmMain.cbbHouse.ItemIndex;
  send(qrySend);
end;

procedure TfrmSend.send(qry: TFDQuery);
begin
  try
    begin
      qry := TFDQuery.Create(nil);
      qry.Connection := frmDM.con;



      qry.SQL.Add('select r.name, r.name as display_name , round(s.amount,2) as amount, b.name as title');
      qry.SQL.Add('from split s');
      qry.SQL.Add('inner join residents r on (s.cod_resident = r.cod_resident)');
      qry.SQL.Add('inner join bills b on (s.cod_bills = b.cod_bills )');
      qry.SQL.Add('where b.send is true');
      qry.SQL.Add('and b.cod_house = :P_COD_HOUSE');
      qry.SQL.Add('UNION');
      qry.SQL.Add('select r.name ,''*''||r.name as display_name ,(sum(round(s.amount,2)))||''*'' as amount, ''Total'' as title');
      qry.SQL.Add('from split s');
      qry.SQL.Add('inner join residents r on (s.cod_resident = r.cod_resident)');
      qry.SQL.Add('inner join bills b on (s.cod_bills = b.cod_bills)');
      qry.SQL.Add('where b.send is true');
      qry.SQL.Add('and b.cod_house = :P_COD_HOUSE');
      qry.SQL.Add('GROUP by r.name');
      qry.ParamByName('P_COD_HOUSE').AsInteger
      := THouse(cbbHouse.Items.Objects[cbbHouse.ItemIndex]).cod_house;
      qry.Open;
      qry.First;
      redtSend.Clear;
      while not qry.Eof do
      begin
        {
        redtSend.Lines.Add(qry.FieldByName('title').AsString);
        redtSend.Lines.Add(qry.FieldByName('name').AsString);
        redtSend.Lines.Add(qry.FieldByName('amount').AsString);
        redtSend.Lines.Add('');
        }
        if qry.FieldByName('title').AsString = 'Total' then
        begin
          redtSend.Lines.Add('');
          redtSend.SelAttributes.Style := redtSend.SelAttributes.Style + [fsBold];
        end
        else
          redtSend.SelAttributes.Style := redtSend.SelAttributes.Style - [fsBold];

        redtSend.Lines.Add(String.Format('%15-s%10s%7s',
        [qry.FieldByName('display_name').AsString
        ,qry.FieldByName('title').AsString
        ,qry.FieldByName('amount').AsString
        ]));

        qry.Next;
      end;
    end;
  finally
    qry.Free;
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
