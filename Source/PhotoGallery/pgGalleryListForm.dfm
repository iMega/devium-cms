object GalleryListForm: TGalleryListForm
  Left = 312
  Top = 210
  Width = 500
  Height = 300
  Caption = #1057#1087#1080#1089#1086#1082' '#1075#1072#1083#1077#1088#1077#1081
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
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 492
    Height = 30
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      Images = MainForm.ImageList20
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      DockTextAlign = taLeftJustify
      object TBSubmenuItem1: TTBSubmenuItem
        Caption = #1044#1077#1081#1089#1090#1074#1080#1103
        Options = [tboDropdownArrow]
        object TBItem10: TTBItem
          Action = GalNew
        end
        object TBItem9: TTBItem
          Action = GalEdit
        end
        object TBItem8: TTBItem
          Action = GalDel
        end
        object TBSeparatorItem3: TTBSeparatorItem
        end
        object TBItem2: TTBItem
          Action = MoveUp
        end
        object TBItem1: TTBItem
          Action = MoveDown
        end
      end
      object TBSeparatorItem2: TTBSeparatorItem
      end
      object TBItem6: TTBItem
        Action = GalNew
      end
      object TBItem5: TTBItem
        Action = GalEdit
      end
      object TBItem4: TTBItem
        Action = GalDel
      end
      object TBSeparatorItem1: TTBSeparatorItem
      end
      object TBItem3: TTBItem
        Action = MoveUp
      end
      object TBItem7: TTBItem
        Action = MoveDown
      end
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 247
    Width = 492
    Height = 19
    Panels = <>
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 30
    Width = 492
    Height = 217
    Align = alClient
    PopupMenu = TBPopupMenu1
    TabOrder = 2
    object cxGrid1DBTableView1: TcxGridDBTableView
      OnDblClick = cxGrid1DBTableView1DblClick
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Filtering.CustomizeDialog = False
      OptionsBehavior.IncSearch = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object is_visible: TcxGridDBColumn
        Caption = #1055#1091#1073#1083#1080#1082#1086#1074#1072#1090#1100
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayUnchecked = 'False'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        Width = 94
        DataBinding.FieldName = 'is_visible'
      end
      object title: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        Options.Filtering = False
        Width = 378
        DataBinding.FieldName = 'title'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object TBPopupMenu1: TTBPopupMenu
    Images = MainForm.ImageList20
    Left = 30
    Top = 70
    object TBItem15: TTBItem
      Action = GalEdit
      Options = [tboDefault]
    end
    object TBSeparatorItem5: TTBSeparatorItem
    end
    object TBItem14: TTBItem
      Action = GalNew
    end
    object TBItem13: TTBItem
      Action = GalDel
    end
    object TBSeparatorItem4: TTBSeparatorItem
    end
    object TBItem12: TTBItem
      Action = MoveUp
    end
    object TBItem11: TTBItem
      Action = MoveDown
    end
  end
  object ActionList1: TActionList
    Images = MainForm.ImageList20
    Left = 65
    Top = 70
    object GalNew: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1091#1102' '#1075#1072#1083#1077#1088#1077#1102
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1091#1102' '#1075#1072#1083#1077#1088#1077#1102
      ImageIndex = 30
      ShortCut = 118
      OnExecute = GalNewExecute
    end
    object GalEdit: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1088#1086#1074#1072#1090#1100
      Hint = #1056#1077#1076#1072#1082#1090#1088#1086#1074#1072#1090#1100
      ImageIndex = 32
      ShortCut = 115
      OnExecute = GalEditExecute
      OnUpdate = GalEditUpdate
    end
    object GalDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 33
      ShortCut = 46
      OnExecute = GalDelExecute
      OnUpdate = GalEditUpdate
    end
    object MoveUp: TAction
      Caption = 'MoveUp'
      ImageIndex = 35
      OnExecute = MoveUpExecute
      OnUpdate = MoveUpUpdate
    end
    object MoveDown: TAction
      Caption = 'MoveDown'
      ImageIndex = 34
      OnExecute = MoveDownExecute
      OnUpdate = MoveUpUpdate
    end
  end
end
