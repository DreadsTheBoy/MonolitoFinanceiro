object dmUsuarios: TdmUsuarios
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 368
  Width = 513
  object SQLUsuarios: TFDQuery
    Connection = dmConexao.SQLConexao
    Left = 32
    Top = 24
  end
  object dspUsuarios: TDataSetProvider
    DataSet = SQLUsuarios
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 104
    Top = 24
  end
  object cdsUsuarios: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsuarios'
    Left = 176
    Top = 24
    object cdsUsuariosID: TStringField
      FieldName = 'ID'
      Size = 36
    end
    object cdsUsuariosNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object cdsUsuariosLOGIN: TStringField
      FieldName = 'LOGIN'
    end
    object cdsUsuariosSENHA: TStringField
      FieldName = 'SENHA'
    end
    object cdsUsuariosSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object cdsUsuariosDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
    end
  end
end
