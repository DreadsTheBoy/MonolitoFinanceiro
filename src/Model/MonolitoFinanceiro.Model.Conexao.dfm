object dmConexao: TdmConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 502
  Width = 686
  object FDQuery1: TFDQuery
    Connection = SQLConexao
    SQL.Strings = (
      'SELECT * FROM USUARIOS')
    Left = 32
    Top = 96
  end
  object SQLConexao: TFDConnection
    Params.Strings = (
      
        'Database=D:\Dev\Project Delphi\MonolitoFinanceiro\db\SistemaFina' +
        'nceiro.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 32
    Top = 24
  end
end