object TypesForm: TTypesForm
  Left = 254
  Top = 233
  Width = 706
  Height = 390
  Caption = #1044#1077#1088#1077#1074#1086' '#1090#1080#1087#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 186
    Top = 26
    Height = 311
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 698
    Height = 26
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      Images = MainForm.ImageList20
      TabOrder = 0
      DockTextAlign = taLeftJustify
      Skin = MainForm.TBSkin
      object TBSubmenuItem1: TTBSubmenuItem
        Caption = #1044#1077#1081#1089#1090#1074#1080#1103
        Options = [tboDropdownArrow]
      end
      object TBSeparatorItem1: TTBSeparatorItem
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 26
    Width = 186
    Height = 311
    Align = alLeft
    BevelOuter = bvNone
    BorderWidth = 1
    Color = clActiveCaption
    TabOrder = 1
    object cxGrid2: TcxGrid
      Left = 1
      Top = 1
      Width = 184
      Height = 309
      Align = alClient
      TabOrder = 0
      object cxGrid2DBTableView1: TcxGridDBTableView
        DataController.DataSource = DM.dsTypes
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object _type_id: TcxGridDBColumn
          DataBinding.FieldName = 'type_id'
        end
        object type_title: TcxGridDBColumn
          DataBinding.FieldName = 'type_title'
        end
        object parent_id: TcxGridDBColumn
          DataBinding.FieldName = 'parent_id'
        end
      end
      object cxGrid2Level1: TcxGridLevel
        GridView = cxGrid2DBTableView1
      end
    end
  end
  object Panel2: TPanel
    Left = 189
    Top = 26
    Width = 509
    Height = 311
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 1
    Color = clActiveCaption
    TabOrder = 2
    object cxGrid1: TcxGrid
      Left = 1
      Top = 1
      Width = 507
      Height = 309
      Align = alClient
      TabOrder = 0
      object Types: TcxGridDBTableView
        DataController.DataSource = DM.dsProperties
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object type_id: TcxGridDBColumn
          Width = 63
          DataBinding.FieldName = 'type_id'
        end
        object name: TcxGridDBColumn
          Width = 63
          DataBinding.FieldName = 'name'
        end
        object property_title: TcxGridDBColumn
          Width = 63
          DataBinding.FieldName = 'property_title'
        end
        object datatype: TcxGridDBColumn
          PropertiesClassName = 'TcxComboBoxProperties'
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            'INT'
            'DATE'
            'TEXT'
            'ENUM'
            'SET'
            'VARCHAR'
            'PICTURE')
          DataBinding.FieldName = 'datatype'
        end
        object length_set: TcxGridDBColumn
          PropertiesClassName = 'TcxBlobEditProperties'
          Properties.BlobEditKind = bekMemo
          Width = 63
          DataBinding.FieldName = 'length_set'
        end
        object default_value: TcxGridDBColumn
          PropertiesClassName = 'TcxBlobEditProperties'
          Properties.BlobEditKind = bekMemo
          Width = 70
          DataBinding.FieldName = 'default_value'
        end
        object is_required: TcxGridDBColumn
          Caption = 'R'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.DisplayUnchecked = 'False'
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = '1'
          Properties.ValueUnchecked = '0'
          Width = 60
          DataBinding.FieldName = 'is_required'
        end
        object is_public: TcxGridDBColumn
          Caption = 'P'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.DisplayUnchecked = 'False'
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = '1'
          Properties.ValueUnchecked = '0'
          Width = 59
          DataBinding.FieldName = 'is_public'
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = Types
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 337
    Width = 698
    Height = 19
    Panels = <>
  end
end
