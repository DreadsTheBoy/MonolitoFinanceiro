unit MonolitoFinanceiro.Model.Entidades.Usuarios;

interface
type
  TModelEntidadeUsuario = class
  private
    FId: String;
    FLogin: String;
    FNome: String;
    FSenha: String;
    FSenhaTemporaria: Boolean;
    procedure SetId(const Value   : String);
    procedure SetLogin(const Value: String);
    procedure SetNome(const Value : String);
    procedure SetSenha(const Value: String);
    procedure SetSenhaTemporaria(const Value: Boolean);

  public
    property Id              : String read FId              write SetId;
    property Login           : String read FLogin           write SetLogin;
    property Nome            : String read FNome            write SetNome;
    property Senha           : String read FSenha           write SetSenha;
    property SenhaTemporaria : Boolean read FSenhaTemporaria write SetSenhaTemporaria;

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

procedure TModelEntidadeUsuario.SetSenha(const Value: String);
begin
  FSenha := Value;
end;

procedure TModelEntidadeUsuario.SetSenhaTemporaria(const Value: Boolean);
begin
  FSenhaTemporaria := Value;
end;

end.
