object dmCaixa: TdmCaixa
  OldCreateOrder = False
  Height = 549
  Width = 674
  object SQLCaixa: TFDQuery
    Connection = dmConexao.SQLConexao
    Left = 32
    Top = 24
  end
  object dspCaixa: TDataSetProvider
    DataSet = SQLCaixa
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 104
    Top = 24
  end
  object cdsCaixa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCaixa'
    Left = 168
    Top = 24
    object cdsCaixaID: TStringField
      FieldName = 'ID'
      Size = 36
    end
    object cdsCaixaNUMERO_DOC: TStringField
      FieldName = 'NUMERO_DOC'
    end
    object cdsCaixaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object cdsCaixaVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Size = 18
    end
    object cdsCaixaTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object cdsCaixaDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
    end
  end
end
