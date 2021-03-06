unit TestUspQuery;

interface

uses
  TestFramework, System.SysUtils, System.Classes, UspQuery, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.FB;
type
  TestTspQuery = class(TTestCase)
  strict private
    FspQuery: TspQuery;
    FListColunas: TSTringlist;
    FListTabelas: TStringList;
    FListCondicoes: TStringList;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestGeraSQL;
    procedure TestGeraSQLSemColuna;
    procedure TestGeraSQLSemWhere;
    procedure TestGeraSQLMaisDeUmaTabela;
    procedure TestGeraSQLSemTabela;
  end;

implementation

procedure TestTspQuery.SetUp;
begin
  FspQuery := TspQuery.Create(nil);
  FListColunas := TStringList.Create;
  FListTabelas := TStringList.Create;
  FListCondicoes := TStringList.Create;
end;

procedure TestTspQuery.TearDown;
begin
  FspQuery.Free;
  FspQuery := nil;
  FListColunas.Free;
  FListTabelas.Free;
  FListCondicoes.Free;
end;

procedure TestTspQuery.TestGeraSQL;
begin
  FListColunas.Add('coluna1');
  FListTabelas.Add('tabela1');
  FListCondicoes.Add('coluna2 = 0');
  FspQuery.spColunas := FListColunas;
  FspQuery.spTabelas := FListTabelas;
  FspQuery.spCondicoes := FListCondicoes;
  FspQuery.GeraSQL;
  CheckEqualsString('Select coluna1'+#$D#$A+'from tabela1'+#$D#$A+'where coluna2 = 0'+#$D#$A, FspQuery.SQL.Text, 'N?o gerou SQL correto');
end;

procedure TestTspQuery.TestGeraSQLMaisDeUmaTabela;
begin
  FListTabelas.Add('tabela0 zr');
  FListTabelas.Add('tabela1 um');
  FspQuery.spColunas := FListColunas;
  FspQuery.spTabelas := FListTabelas;
  FspQuery.spCondicoes := FListCondicoes;
  StartExpectingException(Exception);
  FspQuery.GeraSQL;
  StopExpectingException();
end;

procedure TestTspQuery.TestGeraSQLSemColuna;
begin
  FListColunas.Add('');
  FListTabelas.Add('tabela1');
  FListCondicoes.Add('coluna2 = 0');
  FspQuery.spColunas := FListColunas;
  FspQuery.spTabelas := FListTabelas;
  FspQuery.spCondicoes := FListCondicoes;
  FspQuery.GeraSQL;
  Check(FspQuery.SQL.Text.Contains('Select *'), 'Coluna vazia n?o gerou asterisco(Select *)');
end;

procedure TestTspQuery.TestGeraSQLSemTabela;
begin
  FListColunas.Add('coluna1');
  FListCondicoes.Add('coluna2 = 0');
  FspQuery.spColunas := FListColunas;
  FspQuery.spTabelas := FListTabelas;
  FspQuery.spCondicoes := FListCondicoes;
  StartExpectingException(Exception);
  FspQuery.GeraSQL;
  StopExpectingException();
end;

procedure TestTspQuery.TestGeraSQLSemWhere;
begin
  FListTabelas.Add('tabela1');
  FspQuery.spColunas := FListColunas;
  FspQuery.spTabelas := FListTabelas;
  FspQuery.spCondicoes := FListCondicoes;
  FspQuery.GeraSQL;
  CheckFalse(FspQuery.SQL.Text.Contains('where'), 'Gerou sql com where');
end;

initialization
  RegisterTest(TestTspQuery.Suite);
end.

