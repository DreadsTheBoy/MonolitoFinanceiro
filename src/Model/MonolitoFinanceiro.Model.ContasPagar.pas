unit MonolitoFinanceiro.Model.ContasPagar;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.FMTBcd,
  Datasnap.DBClient,
  Datasnap.Provider,
  Data.DB, Data.SqlExpr,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  MonolitoFinanceiro.Model.Conexao,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TdmContasPagar = class(TDataModule)
    dsContasPagar: TDataSetProvider;
    cdsContasPagar: TClientDataSet;
    sqlContasPagar: TFDQuery;
    sqlContasPagarID: TStringField;
    sqlContasPagarNUMERO_DOC: TStringField;
    sqlContasPagarDESCRICAO: TStringField;
    sqlContasPagarPARCELA: TIntegerField;
    sqlContasPagarVALOR_PARCELA: TFMTBCDField;
    sqlContasPagarVALOR_COMPRA: TFMTBCDField;
    sqlContasPagarVALOR_ABATIDO: TFMTBCDField;
    sqlContasPagarDATA_COMPRA: TDateField;
    sqlContasPagarDATA_CADASTRO: TDateField;
    sqlContasPagarDATA_VENCIMENTO: TDateField;
    sqlContasPagarDATA_PAGAMENTO: TDateField;
    sqlContasPagarSTATUS: TStringField;
    cdsContasPagarID: TStringField;
    cdsContasPagarNUMERO_DOC: TStringField;
    cdsContasPagarDESCRICAO: TStringField;
    cdsContasPagarPARCELA: TIntegerField;
    cdsContasPagarVALOR_PARCELA: TFMTBCDField;
    cdsContasPagarVALOR_COMPRA: TFMTBCDField;
    cdsContasPagarVALOR_ABATIDO: TFMTBCDField;
    cdsContasPagarDATA_COMPRA: TDateField;
    cdsContasPagarDATA_CADASTRO: TDateField;
    cdsContasPagarDATA_VENCIMENTO: TDateField;
    cdsContasPagarDATA_PAGAMENTO: TDateField;
    cdsContasPagarSTATUS: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmContasPagar: TdmContasPagar;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
