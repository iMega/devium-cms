object PlacesForm: TPlacesForm
  Left = 377
  Top = 210
  Width = 493
  Height = 338
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1084#1077#1089#1090
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 292
    Width = 485
    Height = 19
    Panels = <>
  end
  object Grid: TcxGrid
    Left = 0
    Top = 30
    Width = 485
    Height = 262
    Align = alClient
    TabOrder = 1
    object GridDBTableView1: TcxGridDBTableView
      OnDblClick = GridDBTableView1DblClick
      DataController.DataSource = DM.dsPlaces
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnFiltering = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.Selection = MainForm.cxStyle1
      object GridDBTableView1country_id: TcxGridDBColumn
        Caption = #1057#1090#1088#1072#1085#1072
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            FieldName = 'name'
          end>
        Properties.ListSource = DM.dsCountries
        Width = 121
        DataBinding.FieldName = 'country_id'
      end
      object GridDBTableView1place_type: TcxGridDBColumn
        Caption = #1058#1080#1087
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            FieldName = 'name'
          end>
        Properties.ListSource = DM.dsPlacesTypes
        Width = 81
        DataBinding.FieldName = 'place_type_id'
      end
      object GridDBTableView1name: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        Width = 140
        DataBinding.FieldName = 'name'
      end
      object GridDBTableView1english_name: TcxGridDBColumn
        Caption = #1054#1088#1080#1075#1080#1085#1072#1083#1100#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
        Width = 141
        DataBinding.FieldName = 'english_name'
      end
    end
    object GridLevel1: TcxGridLevel
      GridView = GridDBTableView1
    end
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 485
    Height = 30
    object TBToolbar2: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      Images = MainForm.ImageList20
      ParentShowHint = False
      ShowHint = True
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
  object ActionList: TActionList
    Images = MainForm.ImageList20
    Left = 360
    Top = 70
    object Ins: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1099#1081' '#1101#1083#1077#1084#1077#1085#1090
      ImageIndex = 20
      ShortCut = 45
      OnExecute = InsExecute
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
      OnExecute = EditExecute
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
