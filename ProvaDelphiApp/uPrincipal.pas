unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    menuTarefa: TMenuItem;
    miTarefa1: TMenuItem;
    miTarefa2: TMenuItem;
    miTarefa3: TMenuItem;
    miSair: TMenuItem;
    N1: TMenuItem;
    procedure miTarefa1Click(Sender: TObject);
    procedure miSairClick(Sender: TObject);
    procedure miTarefa2Click(Sender: TObject);
    procedure miTarefa3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrincipal: TfPrincipal;

implementation

uses uTarefa1, uTarefa2, uTarefa3;
{$R *.dfm}

procedure TfPrincipal.miSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfPrincipal.miTarefa1Click(Sender: TObject);
begin
  if fTarefa1 = nil then
  begin
    Application.CreateForm(TfTarefa1, fTarefa1);
  end;
  fTarefa1.Show;
end;

procedure TfPrincipal.miTarefa2Click(Sender: TObject);
begin
  if fTarefa2 = nil then
  begin
    Application.CreateForm(TfTarefa2, fTarefa2);
  end;
  fTarefa2.Show;
end;

procedure TfPrincipal.miTarefa3Click(Sender: TObject);
begin
  if fTarefa3 = nil then
  begin
    Application.CreateForm(TfTarefa3, fTarefa3);
  end;
  fTarefa3.Show;
end;

end.
