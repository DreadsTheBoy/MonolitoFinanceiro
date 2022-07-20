unit MonolitoFinanceiro.Model.Usuarios;

interface

uses
  System.SysUtils,
  System.Classes,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Datasnap.Provider,
  Datasnap.DBClient,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  BCrypt,
  MonolitoFinanceiro.Model.Conexao,
  MonolitoFinanceiro.Model.Entidades.Usuarios;

type
  TdmUsuarios = class(TDataModule)
    SQLUsuarios: TFDQuery;
    dspUsuarios: TDataSetProvider;
    cdsUsuarios: TClientDataSet;
    cdsUsuariosNOME: TStringField;
    cdsUsuariosLOGIN: TStringField;
    cdsUsuariosSENHA: TStringField;
    cdsUsuariosSTATUS: TStringField;
    cdsUsuariosDATA_CADASTRO: TDateField;
    cdsUsuariosID: TStringField;
    cdsUsuariosSENHA_TEMPORARIA: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    FEntidadeUsuario : TModelEntidadeUsuario;
  public
    { Public declarations }
    function TemLoginCadastrado(Login : String; ID : String) : Boolean;
    function GetUsuarioLogado : TModelEntidadeUsuario;

    procedure EfetuarLogin(Login : String; Senha : String);
    procedure LimparSenha(IdUsuario : String);
    procedure RedefinirSenha(Usuario : TModelEntidadeUsuario);

    const TEMP_PASSWORD = '123456';

  end;

var
  dmUsuarios: TdmUsuarios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmUsuarios }

procedure TdmUsuarios.DataModuleCreate(Sender: TObject);
begin

  FEntidadeUsuario := TModelEntidadeUsuario.Create;

end;

procedure TdmUsuarios.DataModuleDestroy(Sender: TObject);
begin
  FEntidadeUsuario.Free;
end;

procedure TdmUsuarios.EfetuarLogin(Login, Senha: String);
var
  SQLConsulta : TFDQuery;

begin
  SQLConsulta := TFDQuery.Create(nil);

  try

    SQLConsulta.Connection := dmConexao.SQLConexao;
    SQLConsulta.sql.Clear;
    SQLConsulta.sql.Add('SELECT * FROM USUARIOS WHERE LOGIN = :LOGIN');
    SQLConsulta.ParamByName('LOGIN').AsString := Login;
    //Desativado para usa nova implementa��o de senha criptografada
    //SQLConsulta.ParamByName('SENHA').AsString := Senha;
    SQLConsulta.Open;

    if SQLConsulta.IsEmpty then
      raise Exception.Create('Usu�rio e/ou Senha inv�lidos!!');

    //Novo Modelo para compara��o da senha criptografada
    if not TBCrypt.CompareHash(Senha, SQLConsulta.FieldByName('SENHA').AsString) then
      raise Exception.Create('Usu�rio e/ou Senha inv�lidos!!');

    if SQLConsulta.FieldByName('STATUS').AsString <> 'A' then
      raise Exception.Create('Usu�rio Bloqueado, Favor entrar em contato com o Administrador');

    FEntidadeUsuario.Id    := SQLConsulta.FieldByName('ID').AsString;
    FEntidadeUsuario.Login := SQLConsulta.FieldByName('LOGIN').AsString;
    FEntidadeUsuario.Nome  := SQLConsulta.FieldByName('NOME').AsString;
    FEntidadeUsuario.Senha := SQLConsulta.FieldByName('SENHA').AsString;
    FEntidadeUsuario.SenhaTemporaria := SQLConsulta.FieldByName('SENHA_TEMPORARIA').AsString = 'S';

  finally

    SQLConsulta.Close;
    SQLConsulta.Free;

  end;

end;

function TdmUsuarios.GetUsuarioLogado: TModelEntidadeUsuario;
begin
  Result := FEntidadeUsuario;
end;

procedure TdmUsuarios.LimparSenha(IdUsuario: String);
var
  SQLQuery : TFDQuery;
begin
  SQLQuery := TFDQuery.Create(nil);
  try
    SQLQuery.Connection := dmConexao.SQLConexao;
    SQLQuery.sql.Clear;
    SQLQuery.sql.Add('UPDATE USUARIOS SET SENHA_TEMPORARIA = :SENHA_TEMPORARIA, SENHA = :SENHA WHERE ID = :ID');
    SQLQuery.ParamByName('SENHA_TEMPORARIA').AsString := 'S';
    SQLQuery.ParamByName('SENHA').AsString := TBCrypt.GenerateHash(TEMP_PASSWORD);
    SQLQuery.ParamByName('ID').AsString := IdUsuario;
    SQLQuery.ExecSQL;
  finally
    SQLQuery.Close;
    SQLQuery.Free;
  end;

end;

procedure TdmUsuarios.RedefinirSenha(Usuario: TModelEntidadeUsuario);
var
  SQLQuery : TFDQuery;
begin
  SQLQuery := TFDQuery.Create(nil);
  try
    SQLQuery.Connection := dmConexao.SQLConexao;
    SQLQuery.sql.Clear;
    SQLQuery.sql.Add('UPDATE USUARIOS SET SENHA_TEMPORARIA = :SENHA_TEMPORARIA, SENHA = :SENHA WHERE ID = :ID');
    SQLQuery.ParamByName('SENHA_TEMPORARIA').AsString := 'N';
    SQLQuery.ParamByName('SENHA').AsString := TBCrypt.GenerateHash(Usuario.Senha);
    SQLQuery.ParamByName('ID').AsString := Usuario.Id;
    SQLQuery.ExecSQL;
  finally
    SQLQuery.Close;
    SQLQuery.Free;
  end;
end;

function TdmUsuarios.TemLoginCadastrado(Login, ID: String): Boolean;
var
  SQLConsulta : TFDQuery;
begin
  Result := False;
  SQLConsulta := TFDQuery.Create(nil);
  try
    SQLConsulta.Connection := dmConexao.SQLConexao;
    SQLConsulta.sql.Clear;
    SQLConsulta.sql.Add('SELECT ID FROM USUARIOS WHERE LOGIN = :LOGIN');
    SQLConsulta.ParamByName('LOGIN').AsString := Login;
    SQLConsulta.Open;
    if not SQLConsulta.IsEmpty then
      Result := SQLConsulta.FieldByName('ID').AsString <> ID;
  finally
    SQLConsulta.Close;
    SQLConsulta.Free;
  end;
end;

end.
