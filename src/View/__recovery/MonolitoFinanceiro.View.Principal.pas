unit MonolitoFinanceiro.View.Principal;

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
  Vcl.Menus,
  MonolitoFinanceiro.View.TemplateCadastro,
  MonolitoFinanceiro.View.Splash;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    mnuCadastro: TMenuItem;
    mnuRelatorios: TMenuItem;
    mnuAjuda: TMenuItem;
    mnuCadastroPadrao: TMenuItem;
    procedure mnuCadastroPadraoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
end;

procedure TfrmPrincipal.mnuCadastroPadraoClick(Sender: TObject);
begin
  frmCadastroPadrao.show;
end;

end.