unit MonolitoFinanceiro.View.Caixa;

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
  MonolitoFinanceiro.Model.Caixa,
  Data.DB,
  System.ImageList,
  Vcl.ImgList,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.WinXPanels, Vcl.Menus;

type
  TfrmCaixa = class(TfrmCadastroPadrao)
    Label2: TLabel;
    edtNumeroDocumento: TEdit;
    Label3: TLabel;
    edtDescricao: TEdit;
    Label4: TLabel;
    rgpTipo: TRadioGroup;
    PopupMenu1: TPopupMenu;
    edtValor: TEdit;
    cbTipo: TComboBox;
    Label5: TLabel;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure Pesquisar; override;
  end;

var
  frmCaixa: TfrmCaixa;

implementation

uses
  MonolitoFinanceiro.Utilitarios;

{$R *.dfm}

{ TfrmCadastroPadrao1 }

procedure TfrmCaixa.btnAlterarClick(Sender: TObject);
begin
  inherited;
  edtNumeroDocumento.Text := dmCaixa.cdsCaixaNUMERO_DOC.AsString;
  edtDescricao.Text := dmCaixa.cdsCaixaDESCRICAO.AsString;
  edtValor.Text := InttoStr(dmCaixa.cdsCaixaVALOR.AsInteger);
  if dmCaixa.cdsCaixaTIPO.AsString = 'R' then
    rgpTipo.ItemIndex := 0
  else
    rgpTipo.ItemIndex := 1;
end;

procedure TfrmCaixa.btnSalvarClick(Sender: TObject);
var
  LTipo : String;
begin

  if Trim(edtNumeroDocumento.Text) = '' then
  begin
    edtNumeroDocumento.SetFocus;
    Application.MessageBox('O Campo Numero Documento não pode estar vazio!!!','ATENÇÃO', MB_OK + MB_ICONINFORMATION);
    Abort;
  end;

  if Trim(edtDescricao.Text) = '' then
  begin
    edtDescricao.SetFocus;
    Application.MessageBox('O Campo Descrição não pode estar vazio!!!','ATENÇÃO', MB_OK + MB_ICONINFORMATION);
    Abort;
  end;

  if Trim(edtValor.Text) = '' then
  begin
    edtValor.SetFocus;
    Application.MessageBox('O Campo Valor não pode estar vazio!!!','ATENÇÃO', MB_OK + MB_ICONINFORMATION);
    Abort;
  end;

  if rgpTipo.ItemIndex = -1 then
  begin
    Application.MessageBox('Defina se o lançamento é Receita ou Despesa!!!','ATENÇÃO', MB_OK + MB_ICONINFORMATION);
    Abort;
  end;

  LTipo := 'R';

  if rgpTipo.ItemIndex = 1 then
  LTipo := 'D';

  if DataSource1.State in [dsInsert] then
  begin
    dmCaixa.cdsCaixaID.AsString               := TUtilitarios.GetID;
    dmCaixa.cdsCaixaDATA_CADASTRO.AsDateTime  := Now;
  end;

  dmCaixa.cdsCaixaNUMERO_DOC.AsString := Trim(edtNumeroDocumento.Text);
  dmCaixa.cdsCaixaDESCRICAO.AsString  := Trim(edtDescricao.Text);
  dmCaixa.cdsCaixaVALOR.AsCurrency    := StrToFloat(edtValor.Text);
  dmCaixa.cdsCaixaTIPO.AsString       := LTipo;
  inherited;
end;

procedure TfrmCaixa.Pesquisar;
var
  FiltroPesquisa : String;
  FiltroTipo     : String;
begin
  case cbTipo.ItemIndex of
    1: FiltroTipo := ' AND TIPO = ''R''';
    2: FiltroTipo := ' AND TIPO = ''D''';
  end;
  FiltroPesquisa := TUtilitarios.LikeFind(edtPesquisa.Text, DBGrid1);
  dmCaixa.cdsCaixa.close;
  dmCaixa.cdsCaixa.CommandText := 'SELECT * FROM CAIXA WHERE 1 = 1' + FiltroPesquisa + FiltroTipo;
  dmCaixa.cdsCaixa.open;
  inherited;
end;

end.
