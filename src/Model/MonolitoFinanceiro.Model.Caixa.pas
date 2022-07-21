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
  MonolitoFinanceiro.Model.Conexao;

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
  public
    { Public declarations }
  end;

var
  dmCaixa: TdmCaixa;

implementation


{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.