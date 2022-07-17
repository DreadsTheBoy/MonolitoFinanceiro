unit MonolitoFinanceiro.View.Usuarios;

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
  MonolitoFinanceiro.Model.Usuarios,
  Data.DB,
  System.ImageList,
  Vcl.ImgList,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.WinXPanels,
  Vcl.WinXCtrls,
  MonolitoFinanceiro.Model.Conexao,
  MonolitoFinanceiro.Utilitarios;

type
  TfrmUsuarios = class(TfrmCadastroPadrao)
    DataSource1: TDataSource;
    edtNome: TEdit;
    edtLogin: TEdit;
    edtSenha: TEdit;
    ToggleStatus: TToggleSwitch;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;

    procedure btnPesquisarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);

  private
    { Private declarations }
    procedure LimparCampos;

  public
    { Public declarations }

  end;

var
  frmUsuarios: TfrmUsuarios;

implementation

{$R *.dfm}


procedure TfrmUsuarios.btnAlterarClick(Sender: TObject);
begin
  inherited;

  dmUsuarios.cdsUsuarios.Edit;

  edtNome.Text  := dmUsuarios.cdsUsuariosNOME.AsString;
  edtLogin.Text := dmUsuarios.cdsUsuariosLOGIN.AsString;
  edtSenha.Text := dmUsuarios.cdsUsuariosSenha.AsString;

  ToggleStatus.State := tssOn;
  if dmUsuarios.cdsUsuariosSTATUS.AsString = 'B' then
    ToggleStatus.State := TssOff;
end;

procedure TfrmUsuarios.btnCancelarClick(Sender: TObject);
begin
  inherited;
  dmUsuarios.cdsUsuarios.Cancel;

end;

procedure TfrmUsuarios.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Deseja realmente excluir o registro????', 'Pergunta', MB_YESNO + MB_ICONQUESTION) <> mrYes then
  exit;
  try
    dmUsuarios.cdsUsuarios.Delete;
    dmUsuarios.cdsUsuarios.ApplyUpdates(0);
    Application.MessageBox('Registro Excluido com Sucesso!!!', 'Aviso',MB_OK + MB_ICONINFORMATION);
  except on E : Exception do
    Application.MessageBox(PWideChar(E.Message),'Erro ao Excluir o Registro',MB_OK + MB_ICONERROR);
  end;

end;

procedure TfrmUsuarios.btnIncluirClick(Sender: TObject);
begin
  inherited;
  LimparCampos;
  dmUsuarios.cdsUsuarios.Insert;
end;

procedure TfrmUsuarios.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  dmUsuarios.cdsUsuarios.close;
  dmUsuarios.cdsUsuarios.CommandText := 'SELECT * FROM USUARIOS';
  dmUsuarios.cdsUsuarios.open;
  //dmUsuarios.FDQuery1.SQL.Clear;
  //dmUsuarios.FDQuery1.SQL.Add('SELECT * FROM USUARIOS');
  //dmUsuarios.FDQuery1.Open;
end;

procedure TfrmUsuarios.btnSalvarClick(Sender: TObject);
var
  LStatus  : String;
  Mensagem : String;
begin
  if Trim(edtNome.Text) = '' then
  begin
    edtNome.SetFocus;
    Application.MessageBox('O campo nome n�o pode ser Vazio','Aten��o',MB_OK + MB_ICONWARNING);
    abort;
  end;

  if Trim(edtLogin.Text) = '' then
  begin
    edtLogin.SetFocus;
    Application.MessageBox('O campo Login n�o pode ser Vazio','Aten��o',MB_OK + MB_ICONWARNING);
    abort;
  end;

  if Trim(edtSenha.Text) = '' then
  begin
    edtSenha.SetFocus;
    Application.MessageBox('O campo Senha n�o pode ser Vazio','Aten��o',MB_OK + MB_ICONWARNING);
    abort;
  end;

  if dmUsuarios.TemLoginCadastrado(Trim(edtLogin.Text), dmUsuarios.cdsUsuarios.FieldByName('ID').AsString) then
  begin
    edtLogin.SetFocus;
    Application.MessageBox(PWideChar(Format('O Login %s ja se encontra cadastrado.', [edtLogin.Text])),'Aten��o',MB_OK + MB_ICONWARNING);
    abort;
  end;

  LStatus := 'A';

  if ToggleStatus.State = tssOff then
    LStatus := 'B';

  Mensagem := 'Registro Alterado com Sucesso!';

  if dmUsuarios.cdsUsuarios.State in [dsInsert] then
  begin
    dmUsuarios.cdsUsuariosID.AsString := TUtilitarios.GetID;
    dmUsuarios.cdsUsuariosDATA_CADASTRO.AsDateTime := Now;
    Mensagem := 'Registro Incluido com Sucesso!';
  end;

  dmUsuarios.cdsUsuariosNOME.AsString   := Trim(edtNome.Text);
  dmUsuarios.cdsUsuariosLOGIN.AsString  := Trim(edtLogin.Text);
  dmUsuarios.cdsUsuariosSENHA.AsString  := Trim(edtSenha.Text);
  dmUsuarios.cdsUsuariosSTATUS.AsString  := LStatus;

  dmUsuarios.cdsUsuarios.Post;
  dmUsuarios.cdsUsuarios.ApplyUpdates(0);
  Application.MessageBox(PWideChar(Mensagem), 'Aviso',MB_OK + MB_ICONINFORMATION);
  cpnlPrincipal.ActiveCard := CardPesquisa;
  inherited;

end;

procedure TfrmUsuarios.LimparCampos;
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

end.
