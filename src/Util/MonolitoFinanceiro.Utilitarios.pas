unit MonolitoFinanceiro.Utilitarios;

interface
type
  TUtilitarios = class
    class function GetID : String;
  end;

implementation
  uses
    System.SysUtils;

{ TUtilitarios }

class function TUtilitarios.GetID: String;
begin
  result := TGUID.NewGuid.ToString;
  result := StringReplace(result, '{', '', [rfReplaceAll]);
  result := StringReplace(result, '}', '', [rfReplaceAll]);
end;

end.
