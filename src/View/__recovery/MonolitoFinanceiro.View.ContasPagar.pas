unit MonolitoFinanceiro.View.ContasPagar;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  MonolitoFinanceiro.View.TemplateCadastro,
  Data.DB,
  System.ImageList,
  Vcl.ImgList, Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.WinXPanels,
  MonolitoFinanceiro.Utilitarios,
  MonolitoFinanceiro.Model.ContasPagar, Vcl.ComCtrls;

type
  TfrmContasPagar = class(TfrmCadastroPadrao)
    Label2: TLabel;
    edtValorCompra: TEdit;
    Label3: TLabel;
    edtDescricao: TEdit;
    Label4: TLabel;
    edtParcela: TEdit;
    Label5: TLabel;
    dateVencimento: TDateTimePicker;
    dateCompra: TDateTimePicker;
    Label6: TLabel;
    edtDocumento: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    edtValorParcela: TEdit;
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    protected
      procedure Pesquisar; override;
  end;

var
  frmContasPagar: TfrmContasPagar;

implementation

{$R *.dfm}

{ TfrmContasPagar }

procedure TfrmContasPagar.btnSalvarClick(Sender: TObject);
var
  Parcela      : Integer;
  ValorCompra  : Currency;
  ValorParcela : Currency;
begin
  if edtDocumento.Text = '' then
  begin
    edtDocumento.SetFocus;
    Application.MessageBox('O Campo Documento não pode estar vazio!!!', 'Atenção', MB_OK + MB_ICONINFORMATION);
    Abort;
  end;

  if not tryStrToCurr(edtValorCompra.Text, ValorCompra) then
  begin
    edtValorCompra.SetFocus;
    Application.MessageBox('Valor da Compra inválido!!!', 'Atenção', MB_OK + MB_ICONINFORMATION);
    Abort;
  end;

  if not tryStrToInt(edtParcela.Text, Parcela) then
  begin
    edtParcela.SetFocus;
    Application.MessageBox('Número de Parcelas inválido!!!', 'Atenção', MB_OK + MB_ICONINFORMATION);
    Abort;
  end;

  if not tryStrToCurr(edtValorParcela.Text, ValorParcela) then
  begin
    edtValorCompra.SetFocus;
    Application.MessageBox('Valor da Parcela inválido!!!', 'Atenção', MB_OK + MB_ICONINFORMATION);
    Abort;
  end;

  if dateVencimento.date < dateCompra.Date then
  begin
    dateVencimento.SetFocus;
    Application.MessageBox('A data de Vencimento não pode ser inferior a data da Compra!!!', 'Atenção', MB_OK + MB_ICONINFORMATION);
    Abort;
  end;

  if DataSource1.State in [dsInsert] then
  begin
    dmContasPagar.cdsContasPagarid.AsString              := TUtilitarios.GetID;
    dmContasPagar.cdsContasPagarDATA_CADASTRO.AsDateTime := Now;
    dmContasPagar.cdsContasPagarSTATUS.AsString          := 'A';
    dmContasPagar.cdsContasPagarVALOR_ABATIDO.AsCurrency := 0;
  end;

  dmContasPagar.cdsContasPagarNUMERO_DOC.AsString        := edtDocumento.Text;
  dmContasPagar.cdsContasPagarDESCRICAO.AsString         := edtDescricao.Text;
  dmContasPagar.cdsContasPagarVALOR_COMPRA.AsCurrency    := ValorCompra;
  dmContasPagar.cdsContasPagarPARCELA.AsInteger          := Parcela;
  dmContasPagar.cdsContasPagarVALOR_PARCELA.AsCurrency   := ValorParcela;
  dmContasPagar.cdsContasPagarDATA_VENCIMENTO.AsDateTime := dateVencimento.Date;




  inherited;

end;

procedure TfrmContasPagar.Pesquisar;
begin
  var
  FiltroPesquisa : String;
  begin
    FiltroPesquisa := TUtilitarios.LikeFind(edtPesquisa.Text, DBGrid1);
    dmContasPagar.cdsContasPagar.close;
    dmContasPagar.cdsContasPagar.CommandText := 'SELECT * FROM CONTAS_PAGAR WHERE 1 = 1' + FiltroPesquisa;
    dmContasPagar.cdsContasPagar.open;
  end;
  inherited;
end;

end.
