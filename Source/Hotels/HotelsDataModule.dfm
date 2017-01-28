object DM: TDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 404
  Top = 178
  Height = 386
  Width = 391
  object SoapConnection: TSoapConnection
    Agent = 'Borland SOAP 1.2'
    Connected = True
    URL = 'http://192.168.2.3/danko-company.ru/soap_server.php'
    SOAPServerIID = 'IAppServerSOAP - {C99F4735-D6D2-495C-8CA2-E53E5A439E61}'
    UseSOAPAdapter = False
    Left = 30
    Top = 5
  end
  object Hotels: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'hotels'
    RemoteServer = SoapConnection
    BeforeDelete = HotelsBeforeDelete
    Left = 30
    Top = 55
    object Hotelsid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object Hotelsplace_id: TIntegerField
      FieldName = 'place_id'
    end
    object Hotelsname: TStringField
      FieldName = 'name'
      Size = 100
    end
    object Hotelsenglish_name: TStringField
      FieldName = 'english_name'
      Size = 100
    end
    object Hotelsdescription: TBlobField
      FieldName = 'description'
    end
    object Hotelsmap_x: TIntegerField
      FieldName = 'map_x'
    end
    object Hotelsmap_y: TIntegerField
      FieldName = 'map_y'
    end
    object Hotelsmod_rewrite_name: TStringField
      FieldName = 'mod_rewrite_name'
      Size = 50
    end
    object Hotelsstarts: TIntegerField
      FieldName = 'starts'
    end
    object Hotelssuper: TIntegerField
      FieldName = 'super'
    end
    object Hotelscountry_id: TIntegerField
      FieldName = 'country_id'
    end
    object Hotelsimages2: TBlobField
      FieldName = 'images'
    end
  end
  object dsHotels: TDataSource
    DataSet = Hotels
    Left = 30
    Top = 100
  end
  object HotelsImages: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'hotel_id'
    MasterFields = 'id'
    MasterSource = dsHotels
    PacketRecords = 0
    Params = <>
    ProviderName = 'hotels_images'
    RemoteServer = SoapConnection
    BeforeDelete = HotelsImagesBeforeDelete
    Left = 110
    Top = 55
    object HotelsImagesid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object HotelsImageshotel_id: TIntegerField
      FieldName = 'hotel_id'
    end
    object HotelsImagesimage: TStringField
      FieldName = 'image'
      Size = 50
    end
    object HotelsImagesdescription: TStringField
      FieldName = 'description'
      Size = 255
    end
    object HotelsImagessort_order: TIntegerField
      FieldName = 'sort_order'
    end
    object HotelsImagesname: TStringField
      FieldName = 'name'
      Size = 100
    end
  end
  object dsHotelsImages: TDataSource
    DataSet = HotelsImages
    Left = 110
    Top = 100
  end
  object Services: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'name'
    Params = <>
    ProviderName = 'services'
    RemoteServer = SoapConnection
    BeforeDelete = ServicesBeforeDelete
    Left = 195
    Top = 55
    object Servicesid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object Servicesname: TStringField
      FieldName = 'name'
      Size = 100
    end
    object Servicestype_id: TIntegerField
      FieldName = 'type_id'
    end
  end
  object HotelsServices: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'hotel_id'
    MasterFields = 'id'
    MasterSource = dsHotels
    PacketRecords = 0
    Params = <>
    ProviderName = 'hotels_services'
    RemoteServer = SoapConnection
    Left = 280
    Top = 55
    object HotelsServicesid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object HotelsServiceshotel_id: TIntegerField
      FieldName = 'hotel_id'
    end
    object HotelsServicesservice_id: TIntegerField
      FieldName = 'service_id'
    end
    object HotelsServicesgroup_id: TIntegerField
      FieldName = 'group_id'
    end
  end
  object dsServices: TDataSource
    DataSet = Services
    Left = 195
    Top = 100
  end
  object dsHotelsServices: TDataSource
    DataSet = HotelsServices
    Left = 280
    Top = 100
  end
  object ServicesGroups: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'sort_order'
    Params = <>
    ProviderName = 'services_groups'
    RemoteServer = SoapConnection
    BeforeDelete = ServicesGroupsBeforeDelete
    Left = 110
    Top = 150
    object ServicesGroupsid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object ServicesGroupsname: TStringField
      FieldName = 'name'
      Size = 100
    end
    object ServicesGroupssort_order: TIntegerField
      FieldName = 'sort_order'
    end
  end
  object dsServicesGroups: TDataSource
    DataSet = ServicesGroups
    Left = 110
    Top = 200
  end
  object ServicesTypes: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'sort_order'
    Params = <>
    ProviderName = 'services_types'
    RemoteServer = SoapConnection
    Left = 30
    Top = 150
    object ServicesTypesid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object ServicesTypesname: TStringField
      FieldName = 'name'
      Size = 50
    end
    object ServicesTypessort_order: TIntegerField
      FieldName = 'sort_order'
    end
  end
  object dsServicesTypes: TDataSource
    DataSet = ServicesTypes
    Left = 30
    Top = 200
  end
  object Places: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'name'
    Params = <>
    ProviderName = 'places'
    RemoteServer = SoapConnection
    Left = 195
    Top = 250
    object Placesid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object Placescountry_id: TIntegerField
      FieldName = 'country_id'
    end
    object Placesplace_type_id: TIntegerField
      FieldName = 'place_type_id'
    end
    object Placesname: TStringField
      FieldName = 'name'
      Size = 100
    end
    object Placesmap_x: TIntegerField
      FieldName = 'map_x'
    end
    object Placesmap_y: TIntegerField
      FieldName = 'map_y'
    end
    object Placesdescription: TBlobField
      FieldName = 'description'
    end
    object Placesenglish_name: TStringField
      FieldName = 'english_name'
      Size = 100
    end
    object Placesmod_rewrite_name: TStringField
      FieldName = 'mod_rewrite_name'
      Size = 50
    end
    object Placesimages: TBlobField
      FieldName = 'images'
    end
  end
  object dsPlaces: TDataSource
    DataSet = Places
    Left = 195
    Top = 300
  end
  object PlacesTypes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'places_types'
    RemoteServer = SoapConnection
    Left = 280
    Top = 250
    object PlacesTypesid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object PlacesTypesname: TStringField
      FieldName = 'name'
      Size = 100
    end
  end
  object dsPlacesTypes: TDataSource
    DataSet = PlacesTypes
    Left = 280
    Top = 300
  end
  object Countries: TClientDataSet
    Aggregates = <>
    Filter = 'direction_id<>0'
    Filtered = True
    Params = <>
    ProviderName = 'countries'
    RemoteServer = SoapConnection
    Left = 110
    Top = 250
    object Countriesid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object Countriesdirection_id: TIntegerField
      FieldName = 'direction_id'
    end
    object Countriesname: TStringField
      FieldName = 'name'
      Size = 100
    end
  end
  object dsCountries: TDataSource
    DataSet = Countries
    Left = 110
    Top = 295
  end
  object Directions: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'directions'
    RemoteServer = SoapConnection
    Left = 25
    Top = 250
  end
  object dsDirections: TDataSource
    DataSet = Directions
    Left = 25
    Top = 295
  end
  object Images: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 270
    Top = 165
  end
  object HTTP: TIdHTTP
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
    Left = 195
    Top = 165
  end
  object dsImages: TDataSource
    DataSet = Images
    Left = 320
    Top = 165
  end
end
