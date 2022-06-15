unit uThreadTarefa2;

interface

uses
  System.Classes, Vcl.ComCtrls;

implementation

type
  TThreadTarefa2 = class(TThread)
  private
    FSleepTime: Integer;
    FProgressBar: TProgressBar;
  protected
  public
    property SleepTime: Integer read FSleepTime write FSleepTime;
    property ProgressBar: TProgressBar read FProgressBar write FProgressBar;
  end;
end.
