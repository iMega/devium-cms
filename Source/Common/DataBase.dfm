object DB: TDB
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 511
  Top = 216
  Height = 310
  Width = 371
  object SoapConnection: TSoapConnection
    SOAPServerIID = 'IAppServerSOAP - {C99F4735-D6D2-495C-8CA2-E53E5A439E61}'
    UseSOAPAdapter = False
    OnAfterExecute = SoapConnectionAfterExecute
    Left = 40
    Top = 15
  end
  object XMLDocument: TXMLDocument
    Left = 195
    Top = 34
    DOMVendorDesc = 'MSXML'
  end
  object RemoteTasks: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'filename'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'action'
        DataType = ftInteger
      end
      item
        Name = 'dataset'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'key'
        DataType = ftInteger
      end
      item
        Name = 'new_filename'
        DataType = ftString
        Size = 255
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 300
    Top = 10
  end
end
