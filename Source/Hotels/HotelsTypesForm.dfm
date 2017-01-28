object TypesForm: TTypesForm
  Left = 386
  Top = 182
  Width = 443
  Height = 327
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1090#1080#1087#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 30
    Width = 435
    Height = 251
    Align = alClient
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = DM.dsServices
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.Selection = MainForm.cxStyle1
      object cxGrid1DBTableView1name: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        Width = 227
        DataBinding.FieldName = 'name'
      end
      object cxGrid1DBTableView1type_id: TcxGridDBColumn
        Caption = #1058#1080#1087
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownListStyle = lsFixedList
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            FieldName = 'name'
          end>
        Properties.ListOptions.CaseInsensitive = True
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = DM.dsServicesTypes
        Width = 118
        DataBinding.FieldName = 'type_id'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 435
    Height = 30
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
        object TBItem8: TTBItem
          Action = Ins
        end
        object TBItem7: TTBItem
          Action = Copy
        end
        object TBItem6: TTBItem
          Action = Del
        end
        object TBItem5: TTBItem
          Action = Edit
        end
        object TBSeparatorItem2: TTBSeparatorItem
        end
        object TBItem9: TTBItem
          Action = ReFrash
        end
      end
      object TBSeparatorItem1: TTBSeparatorItem
      end
      object TBItem4: TTBItem
        Action = Ins
      end
      object TBItem3: TTBItem
        Action = Copy
      end
      object TBItem2: TTBItem
        Action = Del
      end
      object TBItem1: TTBItem
        Action = Edit
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 281
    Width = 435
    Height = 19
    Panels = <>
  end
  object ActionList: TActionList
    Images = MainForm.ImageList20
    Left = 360
    Top = 70
    object Ins: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1099#1081' '#1101#1083#1077#1084#1077#1085#1090
      ImageIndex = 20
      ShortCut = 45
    end
    object Copy: TAction
      Caption = #1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077#1084
      ImageIndex = 21
      ShortCut = 120
    end
    object Edit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1090#1077#1082#1091#1097#1080#1081' '#1101#1083#1077#1084#1077#1085#1090
      ImageIndex = 22
      ShortCut = 113
    end
    object Del: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1090#1077#1082#1091#1097#1080#1081' '#1101#1083#1077#1084#1077#1085#1090
      ImageIndex = 23
      ShortCut = 46
    end
    object ReFrash: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1090#1077#1082#1091#1097#1080#1081' '#1089#1087#1080#1089#1086#1082
      ImageIndex = 2
      ShortCut = 24658
    end
  end
end
