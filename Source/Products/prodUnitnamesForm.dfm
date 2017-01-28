object UnitnamesForm: TUnitnamesForm
  Left = 358
  Top = 291
  Width = 408
  Height = 284
  Caption = #1050#1083#1072#1089#1089#1080#1092#1080#1082#1072#1090#1086#1088' '#1077#1076#1080#1085#1080#1094' '#1080#1079#1084#1077#1088#1077#1085#1080#1081
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
  object StatusBar: TStatusBar
    Left = 0
    Top = 231
    Width = 400
    Height = 19
    Panels = <>
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 400
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
  object cxGrid1: TcxGrid
    Left = 0
    Top = 26
    Width = 400
    Height = 205
    Align = alClient
    TabOrder = 2
    object UnitNames: TcxGridDBTableView
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object unit_title: TcxGridDBColumn
        Width = 134
        DataBinding.FieldName = 'unit_title'
      end
      object unit_full_title: TcxGridDBColumn
        Width = 264
        DataBinding.FieldName = 'unit_full_title'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = UnitNames
    end
  end
  object TBPopupMenu1: TTBPopupMenu
    Left = 15
    Top = 35
  end
end
