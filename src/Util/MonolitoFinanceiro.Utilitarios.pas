unit MonolitoFinanceiro.Utilitarios;

interface

uses
  Vcl.DBGrids;
type
  TUtilitarios = class
    class function GetID : String;
    class function LikeFind(Pesquisa : string; Grid : TDBGrid) : String;
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

class function TUtilitarios.LikeFind(Pesquisa: string; Grid: TDBGrid): String;
var
  LContador : Integer;
begin
  Result := '';
  if Pesquisa.Trim.IsEmpty then
    exit;

  for LContador := 0 to Pred(Grid.Columns.Count) do
  begin
    Result := Result + Grid.Columns.Items[LContador].FieldName +
              ' LIKE ' + QuotedStr('%' + Trim(Pesquisa) + '%') + ' OR ';
  end;
  Result := ' WHERE ' + Copy(Result, 1,Length(Result) - 4)

end;

end.
