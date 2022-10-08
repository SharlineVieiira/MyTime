object DM: TDM
  OldCreateOrder = False
  Height = 262
  Width = 363
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\Users\MAX\Downloads\V.1.4\MyTime\BD\BD.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    AfterConnect = FDConnection1AfterConnect
    BeforeConnect = FDConnection1BeforeConnect
    Left = 48
    Top = 24
  end
  object FDQPessoa: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from pessoa'
      'where email=:pNome')
    Left = 136
    Top = 32
    ParamData = <
      item
        Name = 'PNOME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object FDQPessoaid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQPessoaemail: TStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 300
    end
    object FDQPessoasenha: TStringField
      FieldName = 'senha'
      Origin = 'senha'
      Size = 300
    end
  end
  object qry_categoria: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM TAB_CATEGORIA')
    Left = 72
    Top = 104
    object qry_categoriaID_CATEGORIA: TIntegerField
      FieldName = 'ID_CATEGORIA'
      Origin = 'ID_CATEGORIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qry_categoriaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 50
    end
  end
  object qry_lancamento: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM TAB_LANCAMENTO')
    Left = 72
    Top = 168
  end
end
