unit uTarefa2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, uThreadProgresso;

type
  TfTarefa2 = class(TForm)
    ProgressBar1: TProgressBar;
    lblThread1: TLabel;
    ProgressBar2: TProgressBar;
    lblThread2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    btnIniciar: TButton;
    btnFechar: TButton;
    lblSleep1: TLabel;
    lblSleep2: TLabel;
    lblContador1: TLabel;
    lblContador2: TLabel;
    procedure btnIniciarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure AtualizaProgressBar(ANumero, APosicao: Integer);
  private
    { Private declarations }
    FThread1: TThreadProgresso;
    FThread2: TThreadProgresso;
    function CriaThreadProgesso(AIDThread, ASleepTime: Integer): TThreadProgresso;
    procedure DispararThreads;
    procedure DoProgress (const AContador, AIDThread: Integer);
    procedure ThreadTerminate (Sender: TObject);
  public
    { Public declarations }
  end;

var
  fTarefa2: TfTarefa2;
const
  STRCONTADOR = 'Contador: %d';

implementation

{$R *.dfm}

procedure TfTarefa2.AtualizaProgressBar(ANumero, APosicao: Integer);
begin
  case ANumero of
    1: ProgressBar1.Position := APosicao;
    2: ProgressBar2.Position := APosicao;
  end;
end;

procedure TfTarefa2.btnIniciarClick(Sender: TObject);
begin
  btnIniciar.Enabled := false;
  btnFechar.Enabled := false;
  DispararThreads;
end;

function TfTarefa2.CriaThreadProgesso(AIDThread, ASleepTime: Integer): TThreadProgresso;
begin
  Result := TThreadprogresso.Create(false);
  with Result do
  begin
    IDThread := AIDThread;
    SleepTime := ASleepTime;
    OnProgress := DoProgress;
    OnTerminate := ThreadTerminate;
    FreeOnTerminate := true;
  end;
end;

procedure TfTarefa2.DispararThreads;
var
  strContador: String;
begin
  lblContador1.Caption := Format(STRCONTADOR, [0]);
  lblContador2.Caption := Format(STRCONTADOR, [0]);
  lblContador1.Visible := true;
  lblContador2.Visible := true;

  FThread1 := CriaThreadProgesso(1, StrToInt(Edit1.Text));
  FThread2 := CriaThreadProgesso(2, StrToInt(Edit2.Text));
end;

procedure TfTarefa2.DoProgress(const AContador, AIDThread: Integer);
begin
  case AIDThread of
    1:
    begin
      ProgressBar1.Position := AContador;
      lblContador1.Caption := Format(strContador, [AContador]);
    end;
    2:
    begin
      ProgressBar2.Position := AContador;
      lblContador2.Caption := Format(strContador, [AContador]);
    end;
  end;
end;

procedure TfTarefa2.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfTarefa2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fTarefa2.free;
end;

procedure TfTarefa2.ThreadTerminate(Sender: TObject);
begin
  if FThread1.Terminated and FThread2.Terminated then
  begin
    btnIniciar.Enabled := true;
    btnFechar.Enabled := true;
  end;
end;

end.

