unit MonolitoFinanceiro.View.Login;

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
  Vcl.ExtCtrls,
  Vcl.Imaging.pngimage,
  Vcl.StdCtrls,
  MonolitoFinanceiro.Model.Usuarios,
  MonolitoFinanceiro.Model.Sistema;

type
  TfrmLogin = class(TForm)
    pnlEsquerda: TPanel;
    pnlPrincipal: TPanel;
    imgLogo: TImage;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    Label2: TLabel;
    Panel5: TPanel;
    Label4: TLabel;
    Panel6: TPanel;
    btnEntrar: TButton;
    edtLogin: TEdit;
    Label3: TLabel;
    edtSenha: TEdit;
    Panel4: TPanel;
    procedure btnEntrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.btnEntrarClick(Sender: TObject);
begin

  if Trim(edtLogin.Text) = '' then
  begin
    edtLogin.SetFocus;
    Application.MessageBox('Informe o seu usuário.', 'Atenção', MB_Ok + MB_ICONWARNING);
    Abort;
  end;

  if Trim(edtSenha.Text) = '' then
  begin
    edtSenha.SetFocus;
    Application.MessageBox('Informe a sua senha.', 'Atenção', MB_Ok + MB_ICONWARNING);
    Abort;
  end;

  try
    dmUsuarios.EfetuarLogin(Trim(edtLogin.Text), Trim(edtSenha.Text));
    ModalResult := mrOk;
    dmSistema.DataUltimoAcesso(Now);
    dmSistema.UsuarioUltimoAcesso(dmUsuarios.GetUsuarioLogado.Login);
  Except
    on Erro: Exception do
    begin
      Application.MessageBox(PWideChar(Erro.Message),'Atenção',MB_OK + MB_ICONWARNING);
      edtLogin.SetFocus;
    end;
  end;

end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  edtLogin.Text := dmSistema.UsuarioUltimoAcesso;
end;

end.
