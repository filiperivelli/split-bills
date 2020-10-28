unit UFrmView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtrls, SHDocVw, IdBaseComponent,
  IdComponent, IdCustomTCPServer, IdCustomHTTPServer, IdHTTPServer;

type
  TfrmView = class(TForm)
    wbView: TWebBrowser;
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
    fileName: string;
  public
    { Public declarations }
    constructor Create(AOwner : TComponent; p_fileName : String);
  end;
var
  frmView: TfrmView;


implementation

{$R *.dfm}
uses
Winapi.ShellAPI;

constructor TfrmView.Create(AOwner: TComponent; p_fileName: String);
begin
  inherited Create(AOwner);
  fileName := p_fileName;
end;

procedure TfrmView.FormShow(Sender: TObject);
begin
  if FileExists(fileName) then
    wbView.Navigate('file:///'+fileName);
end;
end.
