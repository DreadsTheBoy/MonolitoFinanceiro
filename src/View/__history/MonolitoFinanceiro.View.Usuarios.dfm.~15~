inherited frmUsuarios: TfrmUsuarios
  Caption = 'Cadastro de Usu'#225'rios'
  ClientHeight = 406
  ClientWidth = 605
  ExplicitWidth = 611
  ExplicitHeight = 435
  PixelsPerInch = 96
  TextHeight = 13
  inherited cpnlPrincipal: TCardPanel
    Width = 605
    Height = 406
    ExplicitWidth = 515
    ExplicitHeight = 349
    inherited CardCadastro: TCard
      Width = 603
      Height = 404
      Caption = 'S'
      ExplicitWidth = 603
      ExplicitHeight = 404
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
      object Label4: TLabel [2]
        Left = 32
        Top = 89
        Width = 34
        Height = 13
        Caption = 'Senha:'
      end
      object Label5: TLabel [3]
        Left = 32
        Top = 116
        Width = 35
        Height = 13
        Caption = 'Status:'
      end
      inherited Panel1: TPanel
        Top = 339
        Width = 603
        ExplicitTop = 339
        ExplicitWidth = 603
        inherited btnCancelar: TButton
          Left = 528
          ExplicitLeft = 528
        end
        inherited btnSalvar: TButton
          Left = 453
          OnClick = btnSalvarClick
          ExplicitLeft = 453
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
      object edtSenha: TEdit
        Left = 80
        Top = 86
        Width = 249
        Height = 21
        TabOrder = 3
      end
      object ToggleStatus: TToggleSwitch
        Left = 80
        Top = 115
        Width = 106
        Height = 20
        StateCaptions.CaptionOn = 'Ativo'
        StateCaptions.CaptionOff = 'Bloqueado'
        TabOrder = 4
      end
    end
    inherited CardPesquisa: TCard
      Width = 603
      Height = 404
      ExplicitWidth = 513
      ExplicitHeight = 347
      inherited pnlPesquisa: TPanel
        Width = 603
        ExplicitWidth = 513
        inherited btnPesquisar: TButton
          Left = 528
          ExplicitLeft = 438
        end
      end
      inherited PnlPesquisaBotoes: TPanel
        Top = 339
        Width = 603
        ExplicitTop = 282
        ExplicitWidth = 513
        inherited btnFechar: TButton
          Left = 528
          ExplicitLeft = 438
        end
      end
      inherited pnlPesquisaGrid: TPanel
        Width = 603
        Height = 274
        ExplicitWidth = 513
        ExplicitHeight = 217
        inherited DBGrid1: TDBGrid
          Width = 601
          Height = 272
          DataSource = DataSource1
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
  object DataSource1: TDataSource
    DataSet = dmUsuarios.cdsUsuarios
    Left = 761
    Top = 410
  end
end
