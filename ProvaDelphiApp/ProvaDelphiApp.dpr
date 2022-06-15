program ProvaDelphiApp;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {fPrincipal},
  uTarefa1 in 'uTarefa1.pas' {fTarefa1},
  uTarefa2 in 'uTarefa2.pas' {fTarefa2},
  uThreadProgresso in 'classes\uThreadProgresso.pas',
  uTarefa3 in 'uTarefa3.pas' {fTarefa3};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := true;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfPrincipal, fPrincipal);
  Application.CreateForm(TfTarefa3, fTarefa3);
  Application.Run;
end.
