unit MonolitoFinanceiro.Model.Conexao;

interface

uses
  System.SysUtils,
  System.Classes,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.VCLUI.Wait,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TdmConexao = class(TDataModule)
    FDQuery1: TFDQuery;
    SQLConexao: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);

  private
    { Private declarations }
    const ArquivoConfiguracao = 'D:\Dev\Project Delphi\MonolitoFinanceiro\db\SistemaFinanceiro.db';
  public
    { Public declarations }
    procedure CarregarConfiguracoes;
    procedure Conectar;
    procedure Desconectar;
  end;

var
  dmConexao: TdmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

procedure TdmConexao.CarregarConfiguracoes;
var
  parametroNome     : String;
  parametroValor    : String;
  Contador  : Integer;
  ListaParametro  : TStringList;
begin
  SQLConexao.Params.Clear;
  if not FileExists(ArquivoConfiguracao) then
    raise exception.Create('Arquivo de Configuração não encontrado!!!');
  ListaParametro := TStringList.Create;
  try
    ListaParametro.LoadFromFile(ArquivoConfiguracao);
    for Contador := 0 to Pred(ListaParametro.Count) do
    begin
      if ListaParametro[Contador].IndexOf('=') > 0 then
      begin
        parametroNome   := ListaParametro[Contador].Split(['='])[0].Trim;
        parametroValor  := ListaParametro[Contador].Split(['='])[1].Trim;
        SQLConexao.Params.Add(parametroNome + '=' + parametroValor);
      end;
    end;
  finally
    ListaParametro.Free;
  end;
end;

procedure TdmConexao.Conectar;
begin
  SQLConexao.Connected;
end;

procedure TdmConexao.DataModuleCreate(Sender: TObject);
begin
  //CarregarConfiguracoes;
  Conectar;
end;

procedure TdmConexao.Desconectar;
begin
  SQLConexao.Connected := False;
end;

end.
