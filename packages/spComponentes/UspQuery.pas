unit UspQuery;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TTipoLista = (tlColunas, tlTabelas, tlCondicoes);
  TspQuery = class(TFDQuery)
  private
    FspCondicoes: TStringList;
    FspColunas: TStringList;
    FspTabelas: TStringList;
    procedure SetspColunas(const Value: TStringList);
    procedure SetspCondicoes(const Value: TStringList);
    procedure SetspTabelas(const Value: TStringList);
    function MontaSQL(ATipoLista: TTipoLista; ALista: TStringList; Akeyword: String; ASeparador:string = ''): String;
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
  published
    property spColunas: TStringList read FspColunas write SetspColunas;
    property spCondicoes: TStringList read FspCondicoes write SetspCondicoes;
    property spTabelas: TStringList read FspTabelas write SetspTabelas;
    procedure GeraSQL;
  end;

implementation

{ TspQuery }

procedure TspQuery.GeraSQL;
begin
  SQL.Clear;
  SQL.Add(MontaSQL(tlColunas, FspColunas, 'Select ', ', '));
  SQL.Add(MontaSQL(tlTabelas, FspTabelas, 'from '));
  SQL.Add(MontaSQL(tlCondicoes, FspCondicoes, 'where ', ' and '));
end;

function TspQuery.MontaSQL(ATipoLista: TTipoLista; ALista: TStringList; Akeyword: String; ASeparador:string = ''): String;
  procedure RetiraLinhasEmBranco;
  var
    x : Integer;
  begin
    for x := (Alista.Count-1) downto 0 do
    begin
      if (Trim(Alista[x]) = EmptyStr) then
       ALista.Delete(x);
    end;
  end;
var
  i: Integer;
begin
  RetiraLinhasEmBranco;
  case ATipoLista of
    tlColunas, tlCondicoes:
    begin
      if Alista.Count > 0 then
      begin
        Result := Akeyword;
        i := 0;
        while i < Alista.Count do
        begin
          Result := Result + Alista[i];
          Inc(i);
          if i < Alista.Count then
          begin
            Result := Result + ASeparador;
          end;
        end;
      end
      else
      begin
        if ATipoLista = tlColunas then
        begin
          Result := Akeyword + '* ';
        end;
      end;
    end;
    tlTabelas:
    begin
      if Alista.Count > 1 then
      begin
        raise Exception.Create('? permitido informar apenas uma tabela para gera??o do SQL.');
      end
      else if Alista.Count = 0 then
      begin
        raise Exception.Create('? necess?rio informar uma tabela para gera??o do SQL.');
      end
      else
      begin
        Result := 'from ' + Alista[0];
      end;
    end;
  end;
end;

procedure TspQuery.SetspColunas(const Value: TStringList);
begin
  if not Assigned(FspColunas) then
  begin
    FspColunas := TStringList.Create;
  end;
  FspColunas := Value;
end;

procedure TspQuery.SetspCondicoes(const Value: TStringList);
begin
  if not Assigned(FspCondicoes) then
  begin
    FspCondicoes := TStringList.Create;
  end;
  FspCondicoes := Value;
end;

procedure TspQuery.SetspTabelas(const Value: TStringList);
begin
  if not Assigned(FspTabelas) then
  begin
    FspTabelas := TStringList.Create;
  end;
  FspTabelas := Value;
end;

end.
