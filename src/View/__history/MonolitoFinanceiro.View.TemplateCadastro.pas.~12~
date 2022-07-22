unit MonolitoFinanceiro.View.TemplateCadastro;

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
  Data.DB,
  Vcl.StdCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ExtCtrls,
  Vcl.WinXPanels,
  System.ImageList,
  Vcl.ImgList;

type
  TfrmCadastroPadrao = class(TForm)
    cpnlPrincipal: TCardPanel;
    CardCadastro: TCard;
    CardPesquisa: TCard;
    pnlPesquisa: TPanel;
    PnlPesquisaBotoes: TPanel;
    pnlPesquisaGrid: TPanel;
    DBGrid1: TDBGrid;
    edtPesquisa: TEdit;
    Label1: TLabel;
    btnPesquisar: TButton;
    ImageList1: TImageList;
    btnFechar: TButton;
    btnImprimir: TButton;
    btnIncluir: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    Panel1: TPanel;
    btnCancelar: TButton;
    btnSalvar: TButton;
    DataSource1: TDataSource;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    procedure HabilitarBotoes;
    procedure LimparCampos;
  public
    { Public declarations }
  protected
    { Protected declaration}
    procedure Pesquisar; virtual;

  end;

var
  frmCadastroPadrao: TfrmCadastroPadrao;

implementation

uses
  Datasnap.DBClient, Vcl.WinXCtrls;

{$R *.dfm}

procedure TfrmCadastroPadrao.btnAlterarClick(Sender: TObject);
begin
  TClientDataSet(DataSource1.DataSet).Edit;
  cpnlPrincipal.ActiveCard := cardCadastro;
end;

procedure TfrmCadastroPadrao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadastroPadrao.btnIncluirClick(Sender: TObject);
begin
  LimparCampos;
  cpnlPrincipal.ActiveCard := cardCadastro;
  TClientDataSet(DataSource1.DataSet).Insert;
end;

procedure TfrmCadastroPadrao.btnPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmCadastroPadrao.btnSalvarClick(Sender: TObject);
var
  Mensagem : String;
begin
  Mensagem := 'Registro Alterado com Sucesso';

  if DataSource1.State in [dsInsert] then
    Mensagem := 'Registro Incluído com Sucesso';

  TClientDataSet(DataSource1.DataSet).Post;
  TClientDataSet(DataSource1.DataSet).ApplyUpdates(0);
  Application.MessageBox(PWideChar(Mensagem), 'Aviso',MB_OK + MB_ICONINFORMATION);

  Pesquisar;

  cpnlPrincipal.ActiveCard := CardPesquisa;
end;

procedure TfrmCadastroPadrao.btnCancelarClick(Sender: TObject);
begin
  TClientDataSet(DataSource1.DataSet).Cancel;
  cpnlPrincipal.ActiveCard := CardPesquisa;
end;

procedure TfrmCadastroPadrao.btnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja realmente excluir o registro????', 'Pergunta', MB_YESNO + MB_ICONQUESTION) <> mrYes then
  exit;
  try
    TClientDataSet(DataSource1.DataSet).Delete;
    TClientDataSet(DataSource1.DataSet).ApplyUpdates(0);
    Application.MessageBox('Registro Excluido com Sucesso!!!', 'Aviso',MB_OK + MB_ICONINFORMATION);
  except on E : Exception do
    Application.MessageBox(PWideChar(E.Message),'Erro ao Excluir o Registro',MB_OK + MB_ICONERROR);
  end;
end;

procedure TfrmCadastroPadrao.FormShow(Sender: TObject);
begin
  cpnlPrincipal.ActiveCard := CardPesquisa;
  Pesquisar;
end;

procedure TfrmCadastroPadrao.HabilitarBotoes;
begin
  btnExcluir.Enabled := not DataSource1.DataSet.IsEmpty;
  btnAlterar.Enabled := not DataSource1.DataSet.IsEmpty;
end;

procedure TfrmCadastroPadrao.LimparCampos;
var
  Contador : Integer;
begin
  for Contador := 0 to Pred(ComponentCount) do
    begin
      if Components[Contador] is TCustomEdit then
        TCustomEdit(Components[Contador]).Clear
      else if Components[Contador] is TToggleSwitch then
        TToggleSwitch(Components[Contador]).State := tssOn
    end;
end;

procedure TfrmCadastroPadrao.Pesquisar;
begin
  HabilitarBotoes;
end;

end.
