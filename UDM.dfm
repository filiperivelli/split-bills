object frmDM: TfrmDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 187
  Width = 273
  object con: TFDConnection
    Params.Strings = (
      'Database=C:\sqlite\dbSplitBills.db'
      'OpenMode=ReadWrite'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 32
    Top = 32
  end
  object dsHouse: TDataSource
    DataSet = qryHouse
    Left = 103
    Top = 32
  end
  object qryHouse: TFDQuery
    Connection = con
    SQL.Strings = (
      'select *'
      'from house')
    Left = 159
    Top = 32
    object fdtncfldHousecod_house: TFDAutoIncField
      FieldName = 'cod_house'
      Origin = 'cod_house'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object strngfldHouseadress: TStringField
      FieldName = 'adress'
      Origin = 'adress'
      Required = True
      Size = 32767
    end
    object strngfldHousenick_name: TStringField
      FieldName = 'nick_name'
      Origin = 'nick_name'
      Size = 32767
    end
  end
  object dlgOpen: TOpenDialog
    Left = 136
    Top = 104
  end
  object idftp2: TIdFTP
    IPVersion = Id_IPv4
    ConnectTimeout = 0
    TransferType = ftBinary
    NATKeepAlive.UseKeepAlive = False
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 80
    Top = 104
  end
end
