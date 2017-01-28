object CategoriesForm: TCategoriesForm
  Left = 407
  Top = 276
  Width = 376
  Height = 271
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
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 368
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
        object TBItem7: TTBItem
          Action = ItemNew
        end
        object TBItem8: TTBItem
          Action = ItemCopy
        end
        object TBItem9: TTBItem
          Action = ItemEdit
        end
        object TBItem10: TTBItem
          Action = ItemDelete
        end
        object TBSeparatorItem3: TTBSeparatorItem
        end
        object TBItem11: TTBItem
          Action = ItemUp
        end
        object TBItem12: TTBItem
          Action = ItemDown
        end
      end
      object TBSeparatorItem2: TTBSeparatorItem
      end
      object TBItem4: TTBItem
        Action = ItemNew
      end
      object TBItem3: TTBItem
        Action = ItemCopy
      end
      object TBItem2: TTBItem
        Action = ItemEdit
      end
      object TBItem1: TTBItem
        Action = ItemDelete
      end
      object TBSeparatorItem1: TTBSeparatorItem
      end
      object TBItem6: TTBItem
        Action = ItemUp
      end
      object TBItem5: TTBItem
        Action = ItemDown
      end
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 218
    Width = 368
    Height = 19
    Panels = <>
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 30
    Width = 368
    Height = 188
    Align = alClient
    TabOrder = 2
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = DM.dsCategory
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object title: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        Width = 210
        DataBinding.FieldName = 'title'
      end
      object name: TcxGridDBColumn
        Caption = #1040#1085#1075#1083#1080#1081#1089#1082#1086#1077' '#1080#1084#1103
        Width = 156
        DataBinding.FieldName = 'name'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object ActionList1: TActionList
    Images = MainForm.ImageList20
    Left = 15
    Top = 60
    object ItemNew: TAction
      Caption = 'ItemNew'
      ImageIndex = 20
    end
    object ItemCopy: TAction
      Caption = 'ItemCopy'
      ImageIndex = 21
    end
    object ItemEdit: TAction
      Caption = 'ItemEdit'
      ImageIndex = 22
    end
    object ItemDelete: TAction
      Caption = 'ItemDelete'
      ImageIndex = 23
    end
    object ItemUp: TAction
      Caption = 'ItemUp'
      ImageIndex = 35
    end
    object ItemDown: TAction
      Caption = 'ItemDown'
      ImageIndex = 34
    end
  end
end
