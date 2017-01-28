object CategoryEditForm: TCategoryEditForm
  Left = 363
  Top = 221
  Width = 447
  Height = 384
  Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1080
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
  object cxGrid: TcxGrid
    Left = 0
    Top = 30
    Width = 439
    Height = 301
    Align = alClient
    TabOrder = 0
    object cxGridDBTableView1: TcxGridDBTableView
      DataController.DataSource = DM.dsCategories
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object title: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        Width = 247
        DataBinding.FieldName = 'title'
      end
      object name: TcxGridDBColumn
        Caption = #1051#1072#1090#1080#1085#1089#1082#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
        Width = 190
        DataBinding.FieldName = 'name'
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxGridDBTableView1
    end
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 439
    Height = 30
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      Images = MainForm.ImageList20
      TabOrder = 0
      DockTextAlign = taLeftJustify
      Skin = MainForm.TBSkin
      object TBItem4: TTBItem
        Action = Ins
      end
      object TBItem3: TTBItem
        Action = Edit
      end
      object TBItem2: TTBItem
        Action = Del
      end
      object TBSeparatorItem1: TTBSeparatorItem
      end
      object TBItem5: TTBItem
        Action = MoveUp
      end
      object TBItem1: TTBItem
        Action = MoveDown
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 331
    Width = 439
    Height = 19
    Panels = <>
  end
  object ActionList: TActionList
    Images = MainForm.ImageList20
    Left = 400
    Top = 50
    object Ins: TAction
      Caption = 'Ins'
      ImageIndex = 20
      OnExecute = InsExecute
    end
    object Edit: TAction
      Caption = 'Edit'
      ImageIndex = 22
      OnExecute = EditExecute
    end
    object Del: TAction
      Caption = 'Del'
      ImageIndex = 23
      OnExecute = DelExecute
    end
    object MoveUp: TAction
      Caption = 'MoveUp'
      ImageIndex = 35
    end
    object MoveDown: TAction
      Caption = 'MoveDown'
      ImageIndex = 34
    end
  end
end
