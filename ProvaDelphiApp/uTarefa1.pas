unit uTarefa1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, UspQuery, FireDAC.Phys.FB;

type
  TfTarefa1 = class(TForm)
    lblColunas: TLabel;
    lblTabela: TLabel;
    lblCondicoes: TLabel;
    memoColunas: TMemo;
    memoTabela: TMemo;
    memoCondicoes: TMemo;
    btnGeraSQL: TButton;
    spQuery1: TspQuery;
    memoSQLGerado: TMemo;
    lblSQLGerado: TLabel;
    procedure btnGeraSQLClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure GeraSQL;
  public
    { Public declarations }
  end;

var
  fTarefa1: TfTarefa1;

implementation

{$R *.dfm}

procedure TfTarefa1.btnGeraSQLClick(Sender: TObject);
begin
  GeraSQL;
end;

procedure TfTarefa1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Release;
  fTarefa1 := nil;
end;
procedure TfTarefa1.GeraSQL;
begin
  memoSQLGerado.Lines.Clear;
  spQuery1.spColunas := TStringList(memocolunas.Lines);
  spQuery1.spTabelas := TStringList(memoTabela.Lines);
  spQuery1.spCondicoes := TStringList(memoCondicoes.Lines);
  spQuery1.GeraSQL;
  memoSQLGerado.Lines.Add(spquery1.SQL.Text);
end;

end.
