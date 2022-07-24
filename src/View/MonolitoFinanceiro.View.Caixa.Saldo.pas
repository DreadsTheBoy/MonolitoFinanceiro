unit MonolitoFinanceiro.View.Caixa.Saldo;

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
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  System.ImageList,
  Vcl.ImgList,
  MonolitoFinanceiro.Model.Entidades.Caixa.Resumo,
  MonolitoFinanceiro.Model.Caixa,
  MonolitoFinanceiro.Utilitarios,
  System.DateUtils,
  Vcl.WinXPanels,
  Vcl.ComCtrls,
  System.SysUtils;

type
  TfrmCaixaSaldo = class(TForm)
    pnlPrincipal: TPanel;
    pnlPesquisar: TPanel;
    pnlContent: TPanel;
    btnPesquisar: TButton;
    ImageList1: TImageList;
    dateInicial: TDateTimePicker;
    dateFinal: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    StackPanel1: TStackPanel;
    Panel1: TPanel;
    Label3: TLabel;
    lblSaldoInicial: TLabel;
    Panel2: TPanel;
    Label5: TLabel;
    lblTotalEntradas: TLabel;
    Panel3: TPanel;
    Label7: TLabel;
    lblTotalSaidas: TLabel;
    Panel4: TPanel;
    Label9: TLabel;
    lblSaldoParcial: TLabel;
    Panel5: TPanel;
    Label11: TLabel;
    lblSaldoFinal: TLabel;
    pnlLineHeader: TPanel;
    pnlLineRodape: TPanel;
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Pesquisar;
  public
    { Public declarations }
  end;

var
  frmCaixaSaldo: TfrmCaixaSaldo;

implementation

{$R *.dfm}

{ TfrmCaixaSaldo }

procedure TfrmCaixaSaldo.btnPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmCaixaSaldo.FormShow(Sender: TObject);
begin
  dateInicial.date := IncDay(Now, -7);
  Pesquisar;
end;

procedure TfrmCaixaSaldo.Pesquisar;
var
  ResumoCaixa : TmodelResumoCaixa;
begin

  lblSaldoInicial.Caption  := '';
  lblTotalEntradas.Caption := '';
  lblTotalSaidas.Caption   := '';
  lblSaldoInicial.Caption  := '';
  lblSaldoFinal.Caption    := '';

  ResumoCaixa := dmCaixa.ResumoCaixa(dateInicial.Date, dateFinal.Date);
  try
    lblSaldoInicial.Caption  := TUtilitarios.FormatoMoeda(ResumoCaixa.SaldoInicial);
    lblTotalEntradas.Caption := TUtilitarios.FormatoMoeda(ResumoCaixa.TotalEntradas);
    lblTotalSaidas.Caption   := TUtilitarios.FormatoMoeda(ResumoCaixa.TotalSaidas);
    lblSaldoParcial.Caption  := TUtilitarios.FormatoMoeda(ResumoCaixa.SaldoParcial);
    lblSaldoFinal.Caption    := TUtilitarios.FormatoMoeda(ResumoCaixa.SaldoFinal);
  finally
    ResumoCaixa.Free;
  end;



end;

end.
