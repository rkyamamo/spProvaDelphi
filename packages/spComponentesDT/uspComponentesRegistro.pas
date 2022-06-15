unit uspComponentesRegistro;

interface

procedure Register;

implementation

uses
  uspQuery, Classes;

procedure Register;
begin
  RegisterComponents('spComponentes', [TspQuery]);
end;

end.

