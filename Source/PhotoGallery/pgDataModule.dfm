object DM: TDM
  OldCreateOrder = False
  Left = 576
  Top = 76
  Height = 265
  Width = 351
  object Albums: TClientDataSet
    Tag = 100
    Aggregates = <>
    IndexFieldNames = 'sort_order'
    Params = <>
    ProviderName = 'gallery_albums'
    Left = 45
    Top = 25
  end
  object Photos: TClientDataSet
    Tag = 100
    Aggregates = <>
    IndexFieldNames = 'sort_order'
    Params = <>
    ProviderName = 'gallery_photos'
    Left = 130
    Top = 25
  end
  object Comments: TClientDataSet
    Tag = 100
    Aggregates = <>
    Params = <>
    ProviderName = 'gallery_comments'
    Left = 215
    Top = 25
  end
  object List: TClientDataSet
    Tag = 100
    Aggregates = <>
    Params = <>
    ProviderName = 'gallery_list'
    Left = 45
    Top = 123
  end
  object dsList: TDataSource
    DataSet = List
    Left = 48
    Top = 168
  end
  object dsAlbums: TDataSource
    DataSet = Albums
    Left = 48
    Top = 72
  end
  object dsPhotos: TDataSource
    DataSet = Photos
    Left = 130
    Top = 80
  end
end
