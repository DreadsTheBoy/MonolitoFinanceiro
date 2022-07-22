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
  Vcl.WinXPanels;

type
  TfrmCaixa = class(TfrmCadastroPadrao)
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

{$R *.dfm}

{ TfrmCadastroPadrao1 }

procedure TfrmCaixa.Pesquisar;
var
  FiltroPesquisa : String;
begin
  dmCaixa.cdsCaixa.close;
  dmCaixa.cdsCaixa.CommandText := 'SELECT * FROM CAIXA' + FiltroPesquisa;
  dmCaixa.cdsCaixa.open;
  inherited;
end;

//Parei na Aula#09 - Minuto 1:24:03


end.
