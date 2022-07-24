unit MonolitoFinanceiro.Model.Caixa;

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
  Data.DB,
  Datasnap.DBClient,
  Datasnap.Provider,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  MonolitoFinanceiro.Model.Conexao,
  MonolitoFinanceiro.Model.Entidades.Caixa.Resumo;

type
  TdmCaixa = class(TDataModule)
    SQLCaixa: TFDQuery;
    dspCaixa: TDataSetProvider;
    cdsCaixa: TClientDataSet;
    cdsCaixaID: TStringField;
    cdsCaixaNUMERO_DOC: TStringField;
    cdsCaixaDESCRICAO: TStringField;
    cdsCaixaVALOR: TFMTBCDField;
    cdsCaixaTIPO: TStringField;
    cdsCaixaDATA_CADASTRO: TDateField;
  private
    { Private declarations }
    function GetSaldoAnteriorCaixa(Data : TDate) : Currency;
    function GetTotalEntradasCaixa(DataInicial,DataFinal : TDate) : Currency;
    function GetTotalSaidasCaixa(DataInicial,DataFinal : TDate)   : Currency;
  public
    { Public declarations }
    function ResumoCaixa(DataInicial,DataFinal : TDate) : TModelResumoCaixa;
  end;

var
  dmCaixa: TdmCaixa;

implementation


{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmCaixa }

function TdmCaixa.GetSaldoAnteriorCaixa(Data: TDate): Currency;
var
  SQLCOnsulta   : TFDQuery;
  TotalEntradas : Currency;
  TotalSaidas   : Currency;
begin
  Result := 0;
  SQLConsulta := TFDQuery.Create(nil);
  try
    SQLCOnsulta.Connection := dmConexao.SQLConexao;
    SQLCOnsulta.SQL.Clear;
    SQLCOnsulta.SQL.Add('SELECT IFNULL(SUM(VALOR),0) AS VALOR FROM CAIXA WHERE TIPO = ''R'' ' );
    SQLCOnsulta.SQL.Add(' AND DATA_CADASTRO < :DATA ');
    SQLCOnsulta.ParamByName('DATA').AsDate := Data;
    SQLCOnsulta.Open;
    TotalEntradas := SQLCOnsulta.FieldByName('VALOR').AsCurrency;
    SQLCOnsulta.SQL.Clear;
    SQLCOnsulta.SQL.Add('SELECT IFNULL(SUM(VALOR),0) AS VALOR FROM CAIXA WHERE TIPO = ''D'' ' );
    SQLCOnsulta.SQL.Add(' AND DATA_CADASTRO < :DATA ');
    SQLCOnsulta.ParamByName('DATA').AsDate := Data;
    SQLCOnsulta.Open;
    TotalSaidas := SQLCOnsulta.FieldByName('VALOR').AsCurrency;
  finally
    SQLCOnsulta.Free;
  end;
  Result := TotalEntradas - TotalSaidas;
end;

function TdmCaixa.GetTotalEntradasCaixa(DataInicial, DataFinal: TDate): Currency;
var
  SQLCOnsulta   : TFDQuery;
begin
  Result := 0;
  SQLConsulta := TFDQuery.Create(nil);
  try
    SQLCOnsulta.Connection := dmConexao.SQLConexao;
    SQLCOnsulta.SQL.Clear;
    SQLCOnsulta.SQL.Add('SELECT IFNULL(SUM(VALOR),0) AS VALOR FROM CAIXA WHERE TIPO = ''R'' ' );
    SQLCOnsulta.SQL.Add(' AND DATA_CADASTRO BETWEEN :DATAINICIAL AND :DATAFINAL');
    SQLCOnsulta.ParamByName('DATAINICIAL').AsDate := DataInicial;
    SQLCOnsulta.ParamByName('DATAFINAL').AsDate   := DataFinal;
    SQLCOnsulta.Open;
    Result := SQLCOnsulta.FieldByName('VALOR').AsCurrency;
  finally
    SQLCOnsulta.Free;
  end;
end;

function TdmCaixa.GetTotalSaidasCaixa(DataInicial, DataFinal: TDate): Currency;
var
  SQLCOnsulta   : TFDQuery;
begin
  Result := 0;
  SQLConsulta := TFDQuery.Create(nil);
  try
    SQLCOnsulta.Connection := dmConexao.SQLConexao;
    SQLCOnsulta.SQL.Clear;
    SQLCOnsulta.SQL.Add('SELECT IFNULL(SUM(VALOR),0) AS VALOR FROM CAIXA WHERE TIPO = ''D'' ' );
    SQLCOnsulta.SQL.Add(' AND DATA_CADASTRO BETWEEN :DATAINICIAL AND :DATAFINAL');
    SQLCOnsulta.ParamByName('DATAINICIAL').AsDate := DataInicial;
    SQLCOnsulta.ParamByName('DATAFINAL').AsDate   := DataFinal;
    SQLCOnsulta.Open;
    Result := SQLCOnsulta.FieldByName('VALOR').AsCurrency;
  finally
    SQLCOnsulta.Free;
  end;
end;

function TdmCaixa.ResumoCaixa(DataInicial, DataFinal: TDate): TModelResumoCaixa;
begin
  if DataInicial > DataFinal then
    raise Exception.Create('Período Invalido!');

  Result := TModelResumoCaixa.Create;
  try
    Result.SaldoInicial  := GetSaldoAnteriorCaixa(DataInicial);
    Result.TotalEntradas := GetTotalEntradasCaixa(DataInicial, DataFinal);
    Result.TotalSaidas   := GetTotalSaidasCaixa(DataInicial, DataFinal);
  except
    Result.Free;
    raise;
  end;

end;

end.
