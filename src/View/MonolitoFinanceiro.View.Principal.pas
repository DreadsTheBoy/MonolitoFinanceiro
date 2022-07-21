unit MonolitoFinanceiro.View.Principal;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  MonolitoFinanceiro.View.TemplateCadastro,
  MonolitoFinanceiro.View.Splash,
  MonolitoFinanceiro.View.Usuarios,
  MonolitoFinanceiro.View.Login,
  MonolitoFinanceiro.View.Caixa,
  Vcl.ComCtrls,
  MonolitoFinanceiro.Model.Usuarios,
  MonolitoFinanceiro.View.RedefinirSenha,
  Vcl.ExtCtrls,
  System.SysUtils;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    mnuCadastro: TMenuItem;
    mnuRelatorios: TMenuItem;
    mnuAjuda: TMenuItem;
    mnuUsuarios: TMenuItem;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    mnuFinanceiro: TMenuItem;
    mnuCaixa: TMenuItem;
    procedure mnuUsuariosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure mnuCaixaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation



{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin

  frmSplash := TFrmSplash.Create(nil);
  try
    frmSplash.ShowModal;
  finally
    freeAndNil(frmSplash);
  end;

  frmLogin := TFrmlogin.Create(nil);
  try
    frmLogin.ShowModal;
    if frmLogin.ModalResult <> mrOk then
      Application.Terminate;
  finally
    freeAndNil(frmLogin);
  end;

  if dmUsuarios.GetUsuarioLogado.SenhaTemporaria then
  begin
    frmRedefinirSenha := TfrmRedefinirSenha.Create(nil);
    try
      frmRedefinirSenha.Usuario := dmUsuarios.GetUsuarioLogado;
      frmRedefinirSenha.ShowModal;
      if frmRedefinirSenha.ModalResult <> mrOk then
        Application.Terminate;
    finally
      FreeAndNil(frmRedefinirSenha);
    end;
  end;
  StatusBar1.Panels.Items[1].Text := 'Usuário: ' + dmUsuarios.GetUsuarioLogado.Nome;
end;

procedure TfrmPrincipal.mnuCaixaClick(Sender: TObject);
begin
  frmCaixa.show;
end;

procedure TfrmPrincipal.mnuUsuariosClick(Sender: TObject);
begin
  frmUsuarios.show;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels.Items[0].Text := DateTimeToStr(now);
end;

end.
