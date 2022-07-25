object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Monolito Financeiro'
  ClientHeight = 611
  ClientWidth = 1110
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 592
    Width = 1110
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 300
      end>
  end
  object MainMenu1: TMainMenu
    Left = 16
    Top = 16
    object mnuCadastro: TMenuItem
      Caption = 'Cadastros'
      object mnuUsuarios: TMenuItem
        Caption = 'Usu'#225'rios'
        OnClick = mnuUsuariosClick
      end
    end
    object mnuFinanceiro: TMenuItem
      Caption = 'Financeiro'
      object mnuCaixa: TMenuItem
        Caption = 'Caixa'
        OnClick = mnuCaixaClick
      end
      object ContasaPagar1: TMenuItem
        Caption = 'Contas a Pagar'
        OnClick = ContasaPagar1Click
      end
    end
    object mnuRelatorios: TMenuItem
      Caption = 'Relat'#243'rios'
      object mnuResumoCaixa: TMenuItem
        Caption = 'Resumo do Caixa'
        OnClick = mnuResumoCaixaClick
      end
    end
    object mnuAjuda: TMenuItem
      Caption = 'Ajuda'
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 16
    Top = 544
  end
end
