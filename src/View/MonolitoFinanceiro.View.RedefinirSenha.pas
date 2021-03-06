unit MonolitoFinanceiro.View.RedefinirSenha;

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
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  MonolitoFinanceiro.Model.Entidades.Usuarios,
  MonolitoFinanceiro.Model.Usuarios;

type
  TfrmRedefinirSenha = class(TForm)
    pnlPrincipal: TPanel;
    Panel1: TPanel;
    lblUsuario: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    Panel5: TPanel;
    Label4: TLabel;
    Label3: TLabel;
    edtConfirmacaoSenha: TEdit;
    edtSenha: TEdit;
    Panel4: TPanel;
    Panel6: TPanel;
    btnEntrar: TButton;
    Panel7: TPanel;
    Button1: TButton;
    Panel8: TPanel;
    procedure btnEntrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FUsuario: TModelEntidadeUsuario;
    procedure SetUsuario(const Value: TModelEntidadeUsuario);
    { Private declarations }
  public
    { Public declarations }
    property Usuario : TModelEntidadeUsuario read FUsuario write SetUsuario;
  end;

var
  frmRedefinirSenha: TfrmRedefinirSenha;

implementation

{$R *.dfm}

procedure TfrmRedefinirSenha.btnEntrarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmRedefinirSenha.Button1Click(Sender: TObject);
begin
  edtSenha.Text := Trim(edtSenha.Text);
  edtConfirmacaoSenha.Text := Trim(edtConfirmacaoSenha.Text);

  if edtSenha.Text = '' then
  begin
    edtSenha.SetFocus;
    Application.MessageBox('Nova Senha n?o pode ser Vazio','Aten??o',MB_OK + MB_ICONWARNING);
    abort;
  end;

  if edtConfirmacaoSenha.Text = '' then
  begin
    edtSenha.SetFocus;
    Application.MessageBox('Confirma??o de Senha n?o pode ser Vazio','Aten??o',MB_OK + MB_ICONWARNING);
    abort;
  end;

  if edtSenha.Text <> edtConfirmacaoSenha.Text then
  begin
    edtSenha.Clear;
    edtConfirmacaoSenha.Clear;
    edtSenha.SetFocus;
    Application.MessageBox('A senha e a confirma??o de senha precis?o ser iguais','Aten??o',MB_OK + MB_ICONWARNING);
    abort;
  end;

  Usuario.Senha := edtSenha.Text;
  dmUsuarios.RedefinirSenha(Usuario);
  Application.MessageBox('Sua Senha foi redefinida com sucesso!!!!','Sucesso',MB_OK + MB_ICONINFORMATION);
  ModalResult := mrOK;

end;

procedure TfrmRedefinirSenha.FormShow(Sender: TObject);
begin
  lblUsuario.Caption := FUsuario.Nome;
end;

procedure TfrmRedefinirSenha.SetUsuario(const Value: TModelEntidadeUsuario);
begin
  FUsuario := Value;
end;

end.
