object DM: TDM
  OldCreateOrder = False
  Left = 438
  Top = 127
  Height = 325
  Width = 375
  object News: TClientDataSet
    Tag = 100
    Aggregates = <>
    Params = <>
    ProviderName = 'news'
    Left = 25
    Top = 15
  end
  object dsNews: TDataSource
    DataSet = News
    Left = 25
    Top = 65
  end
  object Categories: TClientDataSet
    Tag = 100
    Aggregates = <>
    Params = <>
    ProviderName = 'news_category'
    Left = 100
    Top = 15
  end
  object dsCategories: TDataSource
    DataSet = Categories
    Left = 100
    Top = 65
  end
end
