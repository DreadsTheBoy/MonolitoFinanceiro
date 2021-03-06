object dmContasPagar: TdmContasPagar
  OldCreateOrder = False
  Height = 75
  Width = 276
  object dsContasPagar: TDataSetProvider
    DataSet = sqlContasPagar
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 120
    Top = 16
  end
  object cdsContasPagar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsContasPagar'
    Left = 208
    Top = 16
    object cdsContasPagarID: TStringField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 36
    end
    object cdsContasPagarNUMERO_DOC: TStringField
      FieldName = 'NUMERO_DOC'
      Origin = 'NUMERO_DOC'
      Required = True
    end
    object cdsContasPagarDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 200
    end
    object cdsContasPagarPARCELA: TIntegerField
      FieldName = 'PARCELA'
      Origin = 'PARCELA'
      Required = True
    end
    object cdsContasPagarVALOR_PARCELA: TFMTBCDField
      FieldName = 'VALOR_PARCELA'
      Origin = 'VALOR_PARCELA'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsContasPagarVALOR_COMPRA: TFMTBCDField
      FieldName = 'VALOR_COMPRA'
      Origin = 'VALOR_COMPRA'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsContasPagarVALOR_ABATIDO: TFMTBCDField
      FieldName = 'VALOR_ABATIDO'
      Origin = 'VALOR_ABATIDO'
      Precision = 18
      Size = 2
    end
    object cdsContasPagarDATA_COMPRA: TDateField
      FieldName = 'DATA_COMPRA'
      Origin = 'DATA_COMPRA'
      Required = True
    end
    object cdsContasPagarDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
      Required = True
    end
    object cdsContasPagarDATA_VENCIMENTO: TDateField
      FieldName = 'DATA_VENCIMENTO'
      Origin = 'DATA_VENCIMENTO'
      Required = True
    end
    object cdsContasPagarDATA_PAGAMENTO: TDateField
      FieldName = 'DATA_PAGAMENTO'
      Origin = 'DATA_PAGAMENTO'
    end
    object cdsContasPagarSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object sqlContasPagar: TFDQuery
    Connection = dmConexao.SQLConexao
    SQL.Strings = (
      'SELECT * from Contas_Pagar')
    Left = 32
    Top = 16
    object sqlContasPagarID: TStringField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 36
    end
    object sqlContasPagarNUMERO_DOC: TStringField
      FieldName = 'NUMERO_DOC'
      Origin = 'NUMERO_DOC'
      Required = True
    end
    object sqlContasPagarDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 200
    end
    object sqlContasPagarPARCELA: TIntegerField
      FieldName = 'PARCELA'
      Origin = 'PARCELA'
      Required = True
    end
    object sqlContasPagarVALOR_PARCELA: TFMTBCDField
      FieldName = 'VALOR_PARCELA'
      Origin = 'VALOR_PARCELA'
      Required = True
      Precision = 18
      Size = 2
    end
    object sqlContasPagarVALOR_COMPRA: TFMTBCDField
      FieldName = 'VALOR_COMPRA'
      Origin = 'VALOR_COMPRA'
      Required = True
      Precision = 18
      Size = 2
    end
    object sqlContasPagarVALOR_ABATIDO: TFMTBCDField
      FieldName = 'VALOR_ABATIDO'
      Origin = 'VALOR_ABATIDO'
      Precision = 18
      Size = 2
    end
    object sqlContasPagarDATA_COMPRA: TDateField
      FieldName = 'DATA_COMPRA'
      Origin = 'DATA_COMPRA'
      Required = True
    end
    object sqlContasPagarDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
      Required = True
    end
    object sqlContasPagarDATA_VENCIMENTO: TDateField
      FieldName = 'DATA_VENCIMENTO'
      Origin = 'DATA_VENCIMENTO'
      Required = True
    end
    object sqlContasPagarDATA_PAGAMENTO: TDateField
      FieldName = 'DATA_PAGAMENTO'
      Origin = 'DATA_PAGAMENTO'
    end
    object sqlContasPagarSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
end
