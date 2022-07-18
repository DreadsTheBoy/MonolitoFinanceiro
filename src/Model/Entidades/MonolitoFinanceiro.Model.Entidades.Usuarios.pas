unit MonolitoFinanceiro.Model.Entidades.Usuarios;

interface
type
  TModelEntidadeUsuario = class
  private
    FId: String;
    FLogin: String;
    FNome: String;
    procedure SetId(const Value   : String);
    procedure SetLogin(const Value: String);
    procedure SetNome(const Value : String);
  public
    property Id    : String read FId    write SetId;
    property Login : String read FLogin write SetLogin;
    property Nome  : String read FNome  write SetNome;
  end;

implementation

{ TModelEntidadeUsuario }

procedure TModelEntidadeUsuario.SetId(const Value: String);
begin
  FId := Value;
end;

procedure TModelEntidadeUsuario.SetLogin(const Value: String);
begin
  FLogin := Value;
end;

procedure TModelEntidadeUsuario.SetNome(const Value: String);
begin
  FNome := Value;
end;

end.
