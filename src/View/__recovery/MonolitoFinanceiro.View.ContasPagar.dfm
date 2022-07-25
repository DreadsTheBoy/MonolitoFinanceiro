inherited frmContasPagar: TfrmContasPagar
  Caption = 'Cadastro de Contas a Pagar'
  ClientHeight = 356
  ClientWidth = 572
  ExplicitWidth = 578
  ExplicitHeight = 385
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel [0]
    Left = 369
    Top = 42
    Width = 82
    Height = 13
    Caption = 'Data da Compra:'
  end
  inherited cpnlPrincipal: TCardPanel
    Width = 572
    Height = 356
    ActiveCard = CardCadastro
    ExplicitWidth = 967
    ExplicitHeight = 590
    inherited CardCadastro: TCard
      Width = 570
      Height = 354
      ExplicitLeft = 0
      ExplicitWidth = 938
      ExplicitHeight = 588
      object Label2: TLabel [0]
        Left = 11
        Top = 41
        Width = 83
        Height = 13
        Caption = 'Valor da Compra:'
      end
      object Label3: TLabel [1]
        Left = 44
        Top = 14
        Width = 50
        Height = 13
        Caption = 'Descri'#231#227'o:'
      end
      object Label4: TLabel [2]
        Left = 391
        Top = 68
        Width = 59
        Height = 13
        Caption = 'Vencimento:'
      end
      object Label5: TLabel [3]
        Left = 55
        Top = 68
        Width = 39
        Height = 13
        Caption = 'Parcela:'
      end
      object Label7: TLabel [4]
        Left = 382
        Top = 14
        Width = 68
        Height = 13
        Caption = 'N Documento:'
      end
      object Label8: TLabel [5]
        Left = 13
        Top = 95
        Width = 81
        Height = 13
        Caption = 'Valor da Parcela:'
      end
      inherited Panel1: TPanel
        Top = 289
        Width = 570
        ExplicitTop = 523
        ExplicitWidth = 965
        inherited btnCancelar: TButton
          Left = 495
          ExplicitLeft = 890
        end
        inherited btnSalvar: TButton
          Left = 420
          ExplicitLeft = 815
        end
      end
      object edtValorCompra: TEdit
        Left = 100
        Top = 38
        Width = 249
        Height = 21
        TabOrder = 1
      end
      object edtDescricao: TEdit
        Left = 100
        Top = 11
        Width = 249
        Height = 21
        TabOrder = 2
      end
      object edtParcela: TEdit
        Left = 100
        Top = 65
        Width = 249
        Height = 21
        TabOrder = 3
      end
      object dateVencimento: TDateTimePicker
        Left = 456
        Top = 65
        Width = 96
        Height = 21
        Date = 44766.000000000000000000
        Time = 0.971236990742909300
        TabOrder = 4
      end
      object edtDocumento: TEdit
        Left = 456
        Top = 11
        Width = 96
        Height = 21
        TabOrder = 5
      end
      object edtValorParcela: TEdit
        Left = 100
        Top = 92
        Width = 249
        Height = 21
        TabOrder = 6
      end
    end
    inherited CardPesquisa: TCard
      Width = 570
      Height = 354
      ExplicitWidth = 965
      ExplicitHeight = 588
      inherited pnlPesquisa: TPanel
        Width = 570
        ExplicitWidth = 965
        inherited btnPesquisar: TButton
          Left = 495
          ExplicitLeft = 890
        end
      end
      inherited PnlPesquisaBotoes: TPanel
        Top = 289
        Width = 570
        ExplicitLeft = 0
        ExplicitTop = 523
        ExplicitWidth = 965
        inherited btnFechar: TButton
          Left = 495
          ExplicitLeft = 890
        end
      end
      inherited pnlPesquisaGrid: TPanel
        Width = 570
        Height = 224
        ExplicitWidth = 965
        ExplicitHeight = 458
        inherited DBGrid1: TDBGrid
          Width = 568
          Height = 222
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'NUMERO_DOC'
              Title.Alignment = taCenter
              Title.Caption = 'Documento'
              Width = 80
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DATA_CADASTRO'
              Title.Alignment = taCenter
              Title.Caption = 'Data Lan'#231'amento'
              Width = 90
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'STATUS'
              Title.Alignment = taCenter
              Title.Caption = 'Status'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Alignment = taCenter
              Title.Caption = 'Descri'#231#227'o'
              Width = 150
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PARCELA'
              Title.Alignment = taCenter
              Title.Caption = 'Parcela'
              Width = 60
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'VALOR_PARCELA'
              Title.Alignment = taCenter
              Title.Caption = 'Valor Parcelas'
              Width = 79
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'VALOR_COMPRA'
              Title.Alignment = taCenter
              Title.Caption = 'Valor Compra'
              Width = 74
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'VALOR_ABATIDO'
              Title.Alignment = taCenter
              Title.Caption = 'Valor Abatido'
              Width = 81
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DATA_COMPRA'
              Title.Alignment = taCenter
              Title.Caption = 'Data da Compra'
              Width = 85
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DATA_PAGAMENTO'
              Title.Alignment = taCenter
              Title.Caption = 'Data Pagamento'
              Width = 87
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DATA_VENCIMENTO'
              Title.Alignment = taCenter
              Title.Caption = 'Data Vencimento'
              Width = 87
              Visible = True
            end>
        end
      end
    end
  end
  object dateCompra: TDateTimePicker [2]
    Left = 457
    Top = 39
    Width = 96
    Height = 21
    Date = 44766.000000000000000000
    Time = 0.971236990742909300
    TabOrder = 1
  end
  inherited ImageList1: TImageList
    Left = 841
    Top = 369
  end
  inherited DataSource1: TDataSource
    DataSet = dmContasPagar.cdsContasPagar
    Left = 841
    Top = 426
  end
end
