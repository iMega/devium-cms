object DM: TDM
  OldCreateOrder = False
  Left = 479
  Top = 210
  Height = 307
  Width = 430
  object Tours: TClientDataSet
    Tag = 100
    Aggregates = <>
    Params = <>
    ProviderName = 'tours'
    Left = 35
    Top = 110
  end
  object dsTours: TDataSource
    DataSet = Tours
    Left = 35
    Top = 155
  end
  object Directions: TClientDataSet
    Tag = 100
    Aggregates = <>
    Params = <>
    ProviderName = 'directions'
    Left = 185
    Top = 5
  end
  object dsDirections: TDataSource
    DataSet = Directions
    Left = 185
    Top = 50
  end
  object Currency: TClientDataSet
    Tag = 100
    Aggregates = <>
    Params = <>
    ProviderName = 'currency'
    Left = 320
    Top = 5
  end
  object dsCurrency: TDataSource
    DataSet = Currency
    Left = 320
    Top = 50
  end
  object ToursDates: TClientDataSet
    Tag = 100
    Aggregates = <>
    IndexFieldNames = 'tour_id'
    MasterFields = 'id'
    MasterSource = dsTours
    PacketRecords = 0
    Params = <>
    ProviderName = 'tours_dates'
    Left = 100
    Top = 110
  end
  object dsToursDates: TDataSource
    DataSet = ToursDates
    Left = 100
    Top = 155
  end
  object TourTypes: TClientDataSet
    Tag = 100
    Aggregates = <>
    Params = <>
    ProviderName = 'tour_types'
    Left = 185
    Top = 110
  end
  object dsTourTypes: TDataSource
    DataSet = TourTypes
    Left = 185
    Top = 155
  end
end
