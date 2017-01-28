object AlbumListForm: TAlbumListForm
  Left = 382
  Top = 215
  Width = 500
  Height = 300
  Caption = #1057#1087#1080#1089#1086#1082' '#1072#1083#1100#1073#1086#1084#1086#1074
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
        object TBItem7: TTBItem
          Action = AlbumAdd
        end
        object TBItem6: TTBItem
          Action = AlbumEdit
        end
        object TBItem5: TTBItem
          Action = AlbumDel
        end
        object TBSeparatorItem2: TTBSeparatorItem
        end
        object TBItem4: TTBItem
          Action = SortUp
        end
        object TBItem10: TTBItem
          Action = SortDown
        end
      end
      object TBSeparatorItem1: TTBSeparatorItem
      end
      object TBItem3: TTBItem
        Action = AlbumAdd
      end
      object TBItem2: TTBItem
        Action = AlbumEdit
      end
      object TBItem1: TTBItem
        Action = AlbumDel
      end
      object TBSeparatorItem3: TTBSeparatorItem
      end
      object TBItem9: TTBItem
        Action = SortUp
      end
      object TBItem8: TTBItem
        Action = SortDown
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
    TabOrder = 2
    object cxGrid1DBTableView1: TcxGridDBTableView
      OnDblClick = cxGrid1DBTableView1DblClick
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Filtering.CustomizeDialog = False
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
        Width = 89
        DataBinding.FieldName = 'is_visible'
      end
      object title: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        Options.Filtering = False
        Width = 283
        DataBinding.FieldName = 'title'
      end
      object last_update: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103
        Width = 118
        DataBinding.FieldName = 'last_update'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object TBPopupMenu1: TTBPopupMenu
    Images = MainForm.ImageList20
    Left = 15
    Top = 65
  end
  object ActionList: TActionList
    Images = MainForm.ImageList20
    Left = 45
    Top = 65
    object AlbumAdd: TAction
      Caption = 'AlbumAdd'
      ImageIndex = 30
      ShortCut = 118
      OnExecute = AlbumAddExecute
    end
    object AlbumEdit: TAction
      Caption = 'AlbumEdit'
      ImageIndex = 32
      ShortCut = 115
      OnExecute = AlbumEditExecute
      OnUpdate = AlbumEditUpdate
    end
    object AlbumDel: TAction
      Caption = 'AlbumDel'
      ImageIndex = 33
      ShortCut = 46
      OnExecute = AlbumDelExecute
      OnUpdate = AlbumEditUpdate
    end
    object SortUp: TAction
      Caption = 'SortUp'
      ImageIndex = 35
      ShortCut = 16422
      OnExecute = SortUpExecute
      OnUpdate = SortUpUpdate
    end
    object SortDown: TAction
      Caption = 'SortDown'
      ImageIndex = 34
      ShortCut = 16424
      OnExecute = SortDownExecute
      OnUpdate = SortUpUpdate
    end
  end
end
