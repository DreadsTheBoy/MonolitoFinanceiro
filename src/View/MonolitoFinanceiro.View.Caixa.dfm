inherited frmCaixa: TfrmCaixa
  Caption = 'Caixa'
  ClientHeight = 408
  ClientWidth = 560
  ExplicitWidth = 566
  ExplicitHeight = 437
  PixelsPerInch = 96
  TextHeight = 13
  inherited cpnlPrincipal: TCardPanel
    Width = 560
    Height = 408
    ExplicitWidth = 560
    ExplicitHeight = 408
    inherited CardCadastro: TCard
      Width = 558
      Height = 406
      ExplicitWidth = 558
      ExplicitHeight = 406
      object Label2: TLabel [0]
        Left = 8
        Top = 35
        Width = 86
        Height = 13
        Caption = 'Num. Documento:'
      end
      object Label3: TLabel [1]
        Left = 8
        Top = 62
        Width = 50
        Height = 13
        Caption = 'Descri'#231#227'o:'
      end
      object Label4: TLabel [2]
        Left = 8
        Top = 89
        Width = 28
        Height = 13
        Caption = 'Valor:'
      end
      inherited Panel1: TPanel
        Top = 341
        Width = 558
        ExplicitTop = 341
        ExplicitWidth = 558
        inherited btnCancelar: TButton
          Left = 483
          ExplicitLeft = 483
        end
        inherited btnSalvar: TButton
          Left = 408
          ExplicitLeft = 408
        end
      end
      object edtNumeroDocumento: TEdit
        Left = 100
        Top = 32
        Width = 249
        Height = 21
        TabOrder = 1
      end
      object edtDescricao: TEdit
        Left = 100
        Top = 59
        Width = 249
        Height = 21
        TabOrder = 2
      end
      object rgpTipo: TRadioGroup
        Left = 8
        Top = 113
        Width = 341
        Height = 56
        Caption = 'Tipo'
        Columns = 2
        Items.Strings = (
          'Receita'
          'Despesa')
        TabOrder = 3
      end
      object edtValor: TEdit
        Left = 100
        Top = 86
        Width = 249
        Height = 21
        TabOrder = 4
      end
    end
    inherited CardPesquisa: TCard
      Width = 558
      Height = 406
      ExplicitWidth = 558
      ExplicitHeight = 406
      inherited pnlPesquisa: TPanel
        Width = 558
        ExplicitLeft = 1
        ExplicitTop = -5
        ExplicitWidth = 558
        object Label5: TLabel [1]
          Left = 311
          Top = 12
          Width = 20
          Height = 13
          Caption = 'Tipo'
        end
        inherited btnPesquisar: TButton
          Left = 483
          ExplicitLeft = 483
        end
        object cbTipo: TComboBox
          Left = 311
          Top = 31
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 2
          Text = 'TODOS'
          Items.Strings = (
            'TODOS'
            'RECEITA'
            'DESPESA')
        end
      end
      inherited PnlPesquisaBotoes: TPanel
        Top = 341
        Width = 558
        ExplicitTop = 341
        ExplicitWidth = 558
        inherited btnFechar: TButton
          Left = 483
          ExplicitLeft = 483
        end
      end
      inherited pnlPesquisaGrid: TPanel
        Width = 558
        Height = 276
        ExplicitWidth = 558
        ExplicitHeight = 276
        inherited DBGrid1: TDBGrid
          Width = 556
          Height = 274
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DATA_CADASTRO'
              Title.Alignment = taCenter
              Title.Caption = 'Data'
              Width = 99
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'NUMERO_DOC'
              Title.Alignment = taCenter
              Title.Caption = 'Numero'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Alignment = taCenter
              Title.Caption = 'Descri'#231#227'o'
              Width = 189
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'TIPO'
              Title.Alignment = taCenter
              Title.Caption = 'Tipo'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR'
              Title.Alignment = taCenter
              Title.Caption = 'Valor (R$)'
              Width = 100
              Visible = True
            end>
        end
      end
    end
  end
  inherited ImageList1: TImageList
    Left = 164
    Top = 195
  end
  inherited DataSource1: TDataSource
    DataSet = dmCaixa.cdsCaixa
    Left = 100
    Top = 195
  end
  object PopupMenu1: TPopupMenu
    Left = 33
    Top = 195
  end
end
