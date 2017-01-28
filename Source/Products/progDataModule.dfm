object DM: TDM
  OldCreateOrder = False
  Left = 288
  Top = 229
  Height = 402
  Width = 656
  object Products: TClientDataSet
    Tag = 100
    Aggregates = <>
    IndexFieldNames = 'sort_order'
    Params = <>
    ProviderName = 'products'
    Left = 30
    Top = 15
  end
  object dsProducts: TDataSource
    DataSet = Products
    Left = 30
    Top = 75
  end
  object Prices: TClientDataSet
    Tag = 100
    Aggregates = <>
    Params = <>
    ProviderName = 'prices'
    Left = 100
    Top = 15
  end
  object dsPrices: TDataSource
    DataSet = Prices
    Left = 95
    Top = 75
  end
  object Units: TClientDataSet
    Tag = 100
    Aggregates = <>
    Params = <>
    ProviderName = 'units'
    Left = 165
    Top = 15
  end
  object dsUnits: TDataSource
    DataSet = Units
    Left = 165
    Top = 75
  end
  object UnitNames: TClientDataSet
    Tag = 100
    Aggregates = <>
    Params = <>
    ProviderName = 'unit_names'
    Left = 230
    Top = 15
  end
  object dsUnitNames: TDataSource
    DataSet = UnitNames
    Left = 230
    Top = 75
  end
  object PriceTypes: TClientDataSet
    Tag = 100
    Aggregates = <>
    Params = <>
    ProviderName = 'price_types'
    Left = 305
    Top = 15
  end
  object dsPriceTypes: TDataSource
    DataSet = PriceTypes
    Left = 310
    Top = 75
  end
  object Types: TClientDataSet
    Tag = 100
    Aggregates = <>
    IndexFieldNames = 'type_title'
    Params = <>
    ProviderName = 'types'
    Left = 380
    Top = 15
  end
  object dsTypes: TDataSource
    DataSet = Types
    Left = 380
    Top = 75
  end
  object Properties: TClientDataSet
    Tag = 100
    Aggregates = <>
    IndexFieldNames = 'property_title'
    Params = <>
    ProviderName = 'properties'
    Left = 450
    Top = 15
  end
  object dsProperties: TDataSource
    DataSet = Properties
    Left = 450
    Top = 75
  end
  object Values: TClientDataSet
    Tag = 100
    Aggregates = <>
    Params = <>
    ProviderName = 'property_values'
    Left = 30
    Top = 135
  end
  object dsValues: TDataSource
    DataSet = Values
    Left = 30
    Top = 185
  end
end
