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
  BCrypt,
  MonolitoFinanceiro.Model.Conexao,
  MonolitoFinanceiro.Utilitarios, Vcl.Menus;

type
  TfrmUsuarios = class(TfrmCadastroPadrao)
    edtNome: TEdit;
    edtLogin: TEdit;
    ToggleStatus: TToggleSwitch;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    PopupMenu1: TPopupMenu;
    mnuLimparSenha: TMenuItem;

    procedure btnPesquisarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure mnuLimparSenhaClick(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }

  protected
    procedure Pesquisar; override;

  end;

var
  frmUsuarios: TfrmUsuarios;

implementation

{$R *.dfm}


procedure TfrmUsuarios.btnAlterarClick(Sender: TObject);
begin
  inherited;
  edtNome.Text  := dmUsuarios.cdsUsuariosNOME.AsString;
  edtLogin.Text := dmUsuarios.cdsUsuariosLOGIN.AsString;

  ToggleStatus.State := tssOn;
  if dmUsuarios.cdsUsuariosSTATUS.AsString = 'B' then
    ToggleStatus.State := TssOff;
end;

procedure TfrmUsuarios.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  Pesquisar;
end;

procedure TfrmUsuarios.btnSalvarClick(Sender: TObject);
var
  LStatus  : String;
  LHash    : String;
begin
  if Trim(edtNome.Text) = '' then
  begin
    edtNome.SetFocus;
    Application.MessageBox('O campo nome não pode ser Vazio','Atenção',MB_OK + MB_ICONWARNING);
    abort;
  end;

  if Trim(edtLogin.Text) = '' then
  begin
    edtLogin.SetFocus;
    Application.MessageBox('O campo Login não pode ser Vazio','Atenção',MB_OK + MB_ICONWARNING);
    abort;
  end;

  if dmUsuarios.TemLoginCadastrado(Trim(edtLogin.Text), dmUsuarios.cdsUsuarios.FieldByName('ID').AsString) then
  begin
    edtLogin.SetFocus;
    Application.MessageBox(PWideChar(Format('O Login %s ja se encontra cadastrado.', [edtLogin.Text])),'Atenção',MB_OK + MB_ICONWARNING);
    abort;
  end;

  LStatus := 'A';

  if ToggleStatus.State = tssOff then
    LStatus := 'B';

  if dmUsuarios.cdsUsuarios.State in [dsInsert] then
  begin
    dmUsuarios.cdsUsuariosSENHA.AsString := TBCrypt.GenerateHash(dmUsuarios.TEMP_PASSWORD);
    dmUsuarios.cdsUsuariosID.AsString := TUtilitarios.GetID;
    dmUsuarios.cdsUsuariosDATA_CADASTRO.AsDateTime := Now;
    dmUsuarios.cdsUsuariosSENHA_TEMPORARIA.AsString := 'S';
  end;

  dmUsuarios.cdsUsuariosNOME.AsString    := Trim(edtNome.Text);
  dmUsuarios.cdsUsuariosLOGIN.AsString   := Trim(edtLogin.Text);
  dmUsuarios.cdsUsuariosSTATUS.AsString  := LStatus;

  inherited;
end;

procedure TfrmUsuarios.mnuLimparSenhaClick(Sender: TObject);
begin
  inherited;
  if not DataSource1.DataSet.IsEmpty then
  begin
      dmUsuarios.LimparSenha(DataSource1.DataSet.FieldByName('ID').AsString);
      Application.MessageBox(PWideChar(format('Foi Atribuida a Senha padrão para o usuário "%s".', [DataSource1.DataSet.FieldByName('NOME').AsString])), 'Aviso',MB_OK + MB_ICONINFORMATION);
  end;

end;

procedure TfrmUsuarios.Pesquisar;
var
  FiltroPesquisa : String;
begin
  FiltroPesquisa := TUtilitarios.LikeFind(edtPesquisa.Text, DBGrid1);
  dmUsuarios.cdsUsuarios.close;
  dmUsuarios.cdsUsuarios.CommandText := 'SELECT * FROM USUARIOS' + FiltroPesquisa;
  dmUsuarios.cdsUsuarios.open;
  inherited;
end;

end.
