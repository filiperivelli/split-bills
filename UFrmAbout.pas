unit UFrmAbout;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmAbout = class(TForm)
    imgLogo: TImage;
    lblSplitBills: TLabel;
    lblCreator: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation
uses
UConstantes,System.MaskUtils;
{$R *.dfm}

procedure TfrmAbout.FormCreate(Sender: TObject);
begin
  lblSplitBills.Caption := 'Split Bills Version: '
  +FormatMaskText('0\.0\.0;0;',IntToStr(version));
end;

end.
