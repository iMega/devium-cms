object DM: TDM
  OldCreateOrder = False
  Left = 834
  Top = 127
  Height = 154
  Width = 123
  object dsPortfolio: TDataSource
    DataSet = Portfolio
    Left = 40
    Top = 65
  end
  object Portfolio: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'portfolio'
    Left = 40
    Top = 10
  end
end
