inherited frmUsuarios: TfrmUsuarios
  Caption = 'Cadastro de Usu'#225'rios'
  ClientHeight = 482
  ClientWidth = 610
  ExplicitWidth = 616
  ExplicitHeight = 511
  PixelsPerInch = 96
  TextHeight = 13
  inherited cpnlPrincipal: TCardPanel
    Width = 610
    Height = 482
    ActiveCard = CardCadastro
    ExplicitWidth = 610
    ExplicitHeight = 482
    inherited CardCadastro: TCard
      Width = 608
      Height = 480
      ExplicitWidth = 608
      ExplicitHeight = 480
      object Label2: TLabel [0]
        Left = 32
        Top = 35
        Width = 31
        Height = 13
        Caption = 'Nome:'
      end
      object Label3: TLabel [1]
        Left = 32
        Top = 62
        Width = 29
        Height = 13
        Caption = 'Login:'
      end
      object Label5: TLabel [2]
        Left = 39
        Top = 86
        Width = 35
        Height = 13
        Caption = 'Status:'
      end
      inherited Panel1: TPanel
        Top = 415
        Width = 608
        ExplicitTop = 415
        ExplicitWidth = 608
        inherited btnCancelar: TButton
          Left = 533
          ExplicitLeft = 533
        end
        inherited btnSalvar: TButton
          Left = 458
          ExplicitLeft = 458
        end
      end
      object edtNome: TEdit
        Left = 80
        Top = 32
        Width = 249
        Height = 21
        TabOrder = 1
      end
      object edtLogin: TEdit
        Left = 80
        Top = 59
        Width = 249
        Height = 21
        TabOrder = 2
      end
      object ToggleStatus: TToggleSwitch
        Left = 80
        Top = 86
        Width = 106
        Height = 20
        StateCaptions.CaptionOn = 'Ativo'
        StateCaptions.CaptionOff = 'Bloqueado'
        TabOrder = 3
      end
    end
    inherited CardPesquisa: TCard
      Width = 608
      Height = 480
      ExplicitWidth = 608
      ExplicitHeight = 480
      inherited pnlPesquisa: TPanel
        Width = 608
        ExplicitWidth = 608
        inherited btnPesquisar: TButton
          Left = 533
          ExplicitLeft = 533
        end
      end
      inherited PnlPesquisaBotoes: TPanel
        Top = 415
        Width = 608
        ExplicitTop = 415
        ExplicitWidth = 608
        inherited btnFechar: TButton
          Left = 533
          ExplicitLeft = 533
        end
      end
      inherited pnlPesquisaGrid: TPanel
        Width = 608
        Height = 350
        ExplicitWidth = 608
        ExplicitHeight = 350
        inherited DBGrid1: TDBGrid
          Width = 606
          Height = 348
          PopupMenu = PopupMenu1
          Columns = <
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Nome'
              Width = 286
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LOGIN'
              Title.Caption = 'Login'
              Width = 207
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STATUS'
              Title.Caption = 'Status'
              Width = 91
              Visible = True
            end>
        end
      end
    end
  end
  object PopupMenu1: TPopupMenu [2]
    Left = 505
    Top = 122
    object mnuLimparSenha: TMenuItem
      Caption = 'Limpar Senha'
      OnClick = mnuLimparSenhaClick
    end
  end
end
