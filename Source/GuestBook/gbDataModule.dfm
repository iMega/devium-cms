object DM: TDM
  OldCreateOrder = False
  Left = 689
  Top = 177
  Height = 272
  Width = 297
  object Guestbook: TClientDataSet
    Tag = 100
    Aggregates = <>
    Params = <>
    ProviderName = 'guestbook'
    Left = 25
    Top = 15
    object Guestbookid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object Guestbookdate: TDateTimeField
      FieldName = 'date'
    end
    object Guestbookquestion: TBlobField
      FieldName = 'question'
    end
    object Guestbookanswer: TBlobField
      FieldName = 'answer'
    end
    object Guestbookauthor: TStringField
      FieldName = 'author'
      Size = 100
    end
    object Guestbookemail: TStringField
      FieldName = 'email'
      Size = 100
    end
    object Guestbookcity: TStringField
      FieldName = 'city'
      Size = 100
    end
    object Guestbookhomepage: TStringField
      FieldName = 'homepage'
      Size = 255
    end
    object Guestbookip: TStringField
      FieldName = 'ip'
      Size = 100
    end
  end
  object dsGuestbook: TDataSource
    DataSet = Guestbook
    Left = 25
    Top = 70
  end
end
