inherited frmUsuarios: TfrmUsuarios
  Caption = 'Cadastro de Usu'#225'rios'
  ClientHeight = 738
  ClientWidth = 1109
  ExplicitWidth = 1115
  ExplicitHeight = 767
  PixelsPerInch = 96
  TextHeight = 13
  inherited cpnlPrincipal: TCardPanel
    Width = 1109
    Height = 738
    inherited CardCadastro: TCard
      Width = 1107
      Height = 736
      ExplicitLeft = 1
      inherited Panel1: TPanel
        Top = 671
        Width = 1107
        inherited Button1: TButton
          Left = 1032
        end
        inherited Button2: TButton
          Left = 957
        end
      end
    end
    inherited CardPesquisa: TCard
      Width = 1107
      Height = 736
      inherited pnlPesquisa: TPanel
        Width = 1107
        inherited btnPesquisar: TButton
          Left = 1032
          OnClick = btnPesquisarClick
        end
      end
      inherited PnlPesquisaBotoes: TPanel
        Top = 671
        Width = 1107
        inherited btnFechar: TButton
          Left = 1032
        end
      end
      inherited pnlPesquisaGrid: TPanel
        Width = 1107
        Height = 606
        inherited DBGrid1: TDBGrid
          Width = 1105
          Height = 604
          DataSource = DataSource1
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = dmConexao.FDQuery1
    Left = 793
    Top = 482
  end
end
