unit uTarefa3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls, Data.DB, Datasnap.DBClient, System.Math;

type
  TfTarefa3 = class(TForm)
    dbGridProjeto: TDBGrid;
    PanelSuperior: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtTotal: TEdit;
    edtTotalDiv: TEdit;
    btnObterTotal: TButton;
    btnObterTotalDiv: TButton;
    Panel1: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnObterTotalClick(Sender: TObject);
    procedure btnObterTotalDivClick(Sender: TObject);
  private
    { Private declarations }
    FCDSVirtual: TClientDataSet;
    FDSVirtual: TDataSource;
    procedure CriarClientDataSet;
    procedure PopularTela;
    procedure ObterTotal;
    procedure ObterTotalDivisoes;
  public
    { Public declarations }
  end;

var
  fTarefa3: TfTarefa3;

implementation

{$R *.dfm}

procedure TfTarefa3.btnObterTotalClick(Sender: TObject);
begin
  ObterTotal;
end;

procedure TfTarefa3.btnObterTotalDivClick(Sender: TObject);
begin
  ObterTotalDivisoes;
end;

procedure TfTarefa3.CriarClientDataSet;
begin
  FCDSVirtual := TClientDataSet.Create(nil);
  FCDSVirtual.FieldDefs.Clear;
  FCDSVirtual.FieldDefs.add('IdProjeto', ftInteger);
  FCDSVirtual.FieldDefs.add('NomeProjeto', ftString, 50);
  FCDSVirtual.FieldDefs.add('Valor', ftCurrency);
  FCDSVirtual.CreateDataSet;
  FCDSVirtual.IndexFieldNames := 'IdProjeto';
end;

procedure TfTarefa3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FCDSVirtual.Free;
  FDSVirtual.Free;
  Action := caFree;
  Release;
  fTarefa3 := nil;
end;

procedure TfTarefa3.FormCreate(Sender: TObject);
begin
  CriarClientDataSet;
  FDSVirtual := TDataSource.Create(self);
  FDSVirtual.DataSet := FCDSVirtual;
  dbGridProjeto.DataSource := FDSVirtual;
  Populartela;
end;

procedure TfTarefa3.ObterTotal;
var
  vTotal: Currency;
begin
  FCDSVirtual.DisableControls;
  try
    FCDSVirtual.First;
    vTotal := 0;
    while not (FCDSVirtual.Eof) do
    begin
      vTotal := vTotal + FCDSVirtual.FieldByName('Valor').AsCurrency;
      FCDSVirtual.Next
    end;
    edtTotal.Text := FloatToStr(vTotal);
  finally
    FCDSVirtual.EnableControls;
  end;
end;

procedure TfTarefa3.ObterTotalDivisoes;
var
  vSoma: Currency;
  vValorAnterior: Currency;
begin
  FCDSVirtual.DisableControls;
  try
    FCDSVirtual.First;
    vSoma := 0;
    vValorAnterior := 0;
    while not (FCDSVirtual.Eof) do
    begin
      if vValorAnterior > 0 then
      begin
        vSoma := vSoma + FCDSVirtual.FieldByName('Valor').AsCurrency/vValorAnterior;
      end;
      vValorAnterior := FCDSVirtual.FieldByName('Valor').AsCurrency;
      FCDSVirtual.Next
    end;
    edtTotalDiv.Text := FloatToStr(SimpleRoundTo(vSoma, -2));
  finally
    FCDSVirtual.EnableControls;
  end;
end;

procedure TfTarefa3.Populartela;
var
  i: Integer;
begin
   for i := 1 to 10 do
   begin
     FCDSVirtual.Insert;
     FCDSVirtual.FieldByName('IdProjeto').AsInteger := i;
     FCDSVirtual.FieldByName('NomeProjeto').AsString := Format('Projeto %d',[i]);
     randomize;
     FCDSVirtual.FieldByName('Valor').AsCurrency := Random(100000)/100;
   end;

end;

end.
