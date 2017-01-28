object DM: TDM
  OldCreateOrder = False
  Left = 687
  Top = 211
  Height = 171
  Width = 200
  object Articles: TClientDataSet
    Tag = 100
    Aggregates = <>
    Params = <>
    ProviderName = 'articles'
    Left = 20
    Top = 9
  end
  object dsArticles: TDataSource
    DataSet = Articles
    Left = 20
    Top = 60
  end
  object Category: TClientDataSet
    Tag = 100
    Aggregates = <>
    IndexFieldNames = 'sort_order'
    Params = <>
    ProviderName = 'articles_category'
    Left = 75
    Top = 8
  end
  object dsCategory: TDataSource
    DataSet = Category
    Left = 75
    Top = 66
  end
  object Pages: TClientDataSet
    Tag = 100
    Aggregates = <>
    IndexFieldNames = 'article_id;sort_order'
    MasterFields = 'id'
    MasterSource = dsArticles
    PacketRecords = 0
    Params = <>
    ProviderName = 'articles_pages'
    Left = 130
    Top = 10
  end
  object dsPages: TDataSource
    DataSet = Pages
    Left = 130
    Top = 67
  end
end
