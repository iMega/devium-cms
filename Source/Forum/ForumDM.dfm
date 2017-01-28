object DM: TDM
  OldCreateOrder = False
  Left = 602
  Top = 350
  Height = 325
  Width = 375
  object Topics: TClientDataSet
    Tag = 100
    Aggregates = <>
    Params = <>
    ProviderName = 'topics'
    Left = 41
    Top = 88
  end
  object dsTopics: TDataSource
    DataSet = Topics
    Left = 40
    Top = 144
  end
  object dsCategories: TDataSource
    DataSet = Categories
    Left = 103
    Top = 144
  end
  object Categories: TClientDataSet
    Tag = 100
    Aggregates = <>
    Params = <>
    ProviderName = 'categories'
    Left = 105
    Top = 88
  end
  object dsPosts: TDataSource
    DataSet = Posts
    Left = 168
    Top = 144
  end
  object Posts: TClientDataSet
    Tag = 100
    Aggregates = <>
    Params = <>
    ProviderName = 'posts'
    Left = 169
    Top = 88
  end
  object Forums: TClientDataSet
    Tag = 100
    Aggregates = <>
    MasterSource = dsCategories
    PacketRecords = 0
    Params = <>
    ProviderName = 'forums'
    Left = 233
    Top = 88
  end
  object dsForums: TDataSource
    DataSet = Forums
    Left = 230
    Top = 145
  end
end
