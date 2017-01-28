object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 534
  Top = 325
  Height = 347
  Width = 449
  object Pages: TClientDataSet
    Tag = 100
    Aggregates = <>
    IndexFieldNames = 'sort_order'
    Params = <>
    ProviderName = 'pages'
    Left = 24
    Top = 20
  end
  object dsPages: TDataSource
    DataSet = Pages
    Left = 24
    Top = 70
  end
  object Languages: TClientDataSet
    Tag = 100
    Aggregates = <>
    Params = <>
    ProviderName = 'languages'
    Left = 84
    Top = 20
  end
  object dsLanguages: TDataSource
    DataSet = Languages
    Left = 84
    Top = 70
  end
  object Templates: TClientDataSet
    Tag = 100
    Aggregates = <>
    Params = <>
    ProviderName = 'templates'
    Left = 154
    Top = 20
  end
  object dsTemplates: TDataSource
    DataSet = Templates
    Left = 154
    Top = 70
  end
end
