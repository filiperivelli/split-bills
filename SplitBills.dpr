program SplitBills;

{$R *.dres}

uses
  Vcl.Forms,
  UFrmManageHouses in 'UFrmManageHouses.pas' {frmManageHouses},
  UDM in 'UDM.pas' {frmDM: TDataModule},
  UFrmManageResidents in 'UFrmManageResidents.pas' {frmManageResidents},
  UFrmMain in 'UFrmMain.pas' {frmMain},
  UFrmCategorias in 'UFrmCategorias.pas' {frmCategorias},
  UClasses in 'UClasses.pas',
  UFuncions in 'UFuncions.pas',
  UfrmSend in 'UfrmSend.pas' {frmSend},
  UfrmEmail in 'UfrmEmail.pas' {frmEmail},
  UFrmAvg in 'UFrmAvg.pas' {frmAvg},
  UFrmView in 'UFrmView.pas' {frmView},
  UFrmUpdate in 'UFrmUpdate.pas' {frmUpdate},
  UConstantes in 'UConstantes.pas',
  UFrmAbout in 'UFrmAbout.pas' {frmAbout},
  UFrmSplitOnePerson in 'UFrmSplitOnePerson.pas' {frmOnePersonPays},
  UfrmUnsliptedBills in 'UfrmUnsliptedBills.pas' {frmUnsplitedBills};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmDM, frmDM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmUnsplitedBills, frmUnsplitedBills);
  Application.Run;
end.
