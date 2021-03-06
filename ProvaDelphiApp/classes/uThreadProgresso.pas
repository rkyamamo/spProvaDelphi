unit uThreadProgresso;

interface

uses
  System.Classes, Vcl.ComCtrls;

type
  TOnProgress = procedure (const AContador, AIDThread: Integer) of object;

  TThreadProgresso = class(TThread)
  private
    FContador: Integer;
    FOnProgress: TOnProgress;
    FIDThread: integer;
    FSleepTime: Integer;
    FTerminated: Boolean;
    procedure CallOnProgress;
    procedure DoProgress;
  protected
    procedure TerminatedSet; override;
  public
    procedure Execute; override;
    property IDThread: integer read FIDThread write FIDThread;
    property OnProgress: TOnProgress read FOnProgress write FOnProgress;
    property Contador: Integer read FContador;
    property SleepTime: Integer read FSleepTime write FSleepTime;
    property Terminated: Boolean read FTerminated;
  end;

implementation

{ TThreadProgresso }

procedure TThreadProgresso.CallOnProgress;
begin
  if Assigned(FOnProgress) then
  begin
    FOnProgress(FContador, FIDThread);
  end;
end;

procedure TThreadProgresso.DoProgress;
begin
  if Assigned(FOnProgress) then
  begin
    Synchronize(CallOnProgress);
  end;
end;

procedure TThreadProgresso.Execute;
var
  vCont: Integer;
begin
  inherited;
  for vCont := 1 to 100 do
  begin
    Sleep(FSleepTime);
    FContador := vCont;
    DoProgress;
  end;
  Terminate;
end;

procedure TThreadProgresso.TerminatedSet;
begin
  inherited;
  FTerminated := true;
end;

end.
