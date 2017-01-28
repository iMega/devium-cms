object DM: TDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 444
  Top = 157
  Height = 465
  Width = 556
  object stsummary: TClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    ProviderName = 's_stsummary'
    RemoteServer = SoapConnection
    Left = 45
    Top = 63
    object stsummaryname: TStringField
      DisplayLabel = ' '
      FieldName = 'name'
      Size = 10
    end
    object stsummarytod: TIntegerField
      DisplayLabel = #1057#1077#1075#1086#1076#1085#1103
      FieldName = 'tod'
    end
    object stsummaryyes: TIntegerField
      DisplayLabel = #1042#1095#1077#1088#1072
      FieldName = 'yes'
    end
    object stsummaryweek: TIntegerField
      DisplayLabel = #1047#1072' '#1085#1077#1076#1077#1083#1102
      FieldName = 'week'
    end
    object stsummarymonth: TIntegerField
      DisplayLabel = #1047#1072' '#1084#1077#1089#1103#1094
      FieldName = 'month'
    end
    object stsummaryyear: TIntegerField
      DisplayLabel = #1047#1072' '#1075#1086#1076
      FieldName = 'year'
    end
    object stsummarytotal: TIntegerField
      DisplayLabel = #1042#1089#1077#1075#1086
      FieldName = 'total'
    end
  end
  object ds_stsummary: TDataSource
    DataSet = stsummary
    Left = 45
    Top = 113
  end
  object SoapConnection: TSoapConnection
    Agent = 'Borland SOAP 1.2'
    Connected = True
    URL = 'http://dankoru/soap_server.php'
    SOAPServerIID = 'IAppServerSOAP - {C99F4735-D6D2-495C-8CA2-E53E5A439E61}'
    UseSOAPAdapter = False
    OnAfterExecute = SoapConnectionAfterExecute
    Left = 45
    Top = 5
  end
  object HTTP: TIdHTTP
    Intercept = HTTPLogFile
    MaxLineAction = maException
    ReadTimeout = 0
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 179
    Top = 4
  end
  object HTTPLogFile: TIdLogFile
    Filename = 'c:\http_roma'
    Left = 250
    Top = 4
  end
  object stvisits: TClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    ProviderName = 's_stvisits'
    RemoteServer = SoapConnection
    Left = 184
    Top = 63
    object stvisitshour: TIntegerField
      FieldName = 'hour'
    end
    object stvisitsvisits: TIntegerField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      FieldName = 'visits'
    end
  end
  object ds_stvisits: TDataSource
    DataSet = stvisits
    Left = 181
    Top = 113
  end
  object stpages: TClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    ProviderName = 's_stpages'
    RemoteServer = SoapConnection
    Left = 45
    Top = 175
    object stpagesname: TStringField
      DisplayWidth = 255
      FieldName = 'name'
      Size = 255
    end
    object stpagestitle: TStringField
      FieldName = 'title'
      Size = 255
    end
    object stpagesquant: TIntegerField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'quant'
    end
    object stpagesper: TFloatField
      DisplayLabel = '%'
      FieldName = 'per'
    end
  end
  object ds_stpages: TDataSource
    DataSet = stpages
    Left = 45
    Top = 225
  end
  object stnav: TClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    ProviderName = 's_stnav'
    RemoteServer = SoapConnection
    Left = 181
    Top = 175
    object stnavname: TStringField
      DisplayLabel = #1057#1089#1099#1083#1082#1072
      FieldName = 'name'
      Size = 255
    end
    object stnavtitle: TStringField
      DisplayLabel = #1057#1090#1088#1072#1085#1080#1094#1072
      FieldName = 'title'
      Size = 255
    end
    object stnavquant: TStringField
      DisplayLabel = #1052#1080#1085#1091#1090
      FieldName = 'quant'
    end
  end
  object ds_stnav: TDataSource
    DataSet = stnav
    Left = 181
    Top = 225
  end
  object XMLDocument: TXMLDocument
    Options = [doAttrNull, doAutoPrefix, doNamespaceDecl]
    Left = 340
    Top = 4
    DOMVendorDesc = 'MSXML'
  end
end
