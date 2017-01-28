object ArticleForm: TArticleForm
  Left = 318
  Top = 155
  BorderStyle = bsDialog
  BorderWidth = 5
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1089#1090#1072#1090#1100#1080
  ClientHeight = 341
  ClientWidth = 500
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  DesignSize = (
    500
    341)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 20
    Width = 54
    Height = 13
    Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082
  end
  object Label2: TLabel
    Left = 0
    Top = 100
    Width = 53
    Height = 13
    Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
  end
  object Label3: TLabel
    Left = 0
    Top = 140
    Width = 31
    Height = 13
    Caption = #1040#1085#1086#1085#1089
  end
  object Label4: TLabel
    Left = 0
    Top = 250
    Width = 26
    Height = 13
    Caption = #1044#1072#1090#1072
  end
  object Label6: TLabel
    Left = 330
    Top = 20
    Width = 53
    Height = 13
    Caption = #1057#1090#1088#1072#1085#1080#1094#1099':'
  end
  object Label7: TLabel
    Left = 0
    Top = 60
    Width = 163
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1083#1072#1090#1080#1085#1089#1082#1080#1084#1080' '#1073#1091#1082#1074#1072#1084#1080':'
  end
  object Label5: TLabel
    Left = 125
    Top = 250
    Width = 30
    Height = 13
    Caption = #1040#1074#1090#1086#1088
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 500
    Height = 16
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    BorderWidth = 2
    Caption = #1057#1090#1072#1090#1100#1103
    Color = 10857647
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object OK: TcxButton
    Left = 345
    Top = 316
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 1
    OnClick = OKClick
  end
  object Cancel: TcxButton
    Left = 425
    Top = 316
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 2
  end
  object title: TcxDBTextEdit
    Left = 0
    Top = 35
    Width = 321
    Height = 21
    DataBinding.DataSource = DM.dsArticles
    DataBinding.DataField = 'title'
    Properties.OnEditValueChanged = titlePropertiesEditValueChanged
    TabOrder = 3
  end
  object category_id: TcxDBLookupComboBox
    Left = 0
    Top = 115
    Width = 326
    Height = 21
    DataBinding.DataSource = DM.dsArticles
    DataBinding.DataField = 'category_id'
    Properties.DropDownListStyle = lsFixedList
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        FieldName = 'title'
      end>
    Properties.ListOptions.GridLines = glNone
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DM.dsCategory
    TabOrder = 4
  end
  object announcement: TcxDBMemo
    Left = 0
    Top = 155
    Width = 321
    Height = 89
    DataBinding.DataSource = DM.dsArticles
    DataBinding.DataField = 'announcement'
    TabOrder = 5
  end
  object date: TcxDBDateEdit
    Left = 0
    Top = 265
    Width = 121
    Height = 21
    DataBinding.DataSource = DM.dsArticles
    DataBinding.DataField = 'date'
    TabOrder = 6
  end
  object is_visible: TcxDBCheckBox
    Left = 0
    Top = 314
    Width = 201
    Height = 21
    Anchors = [akRight, akBottom]
    DataBinding.DataSource = DM.dsArticles
    DataBinding.DataField = 'is_visible'
    Properties.Alignment = taLeftJustify
    Properties.DisplayUnchecked = 'False'
    Properties.NullStyle = nssUnchecked
    Properties.ValueChecked = '0'
    Properties.ValueUnchecked = '1'
    Properties.Caption = #1053#1077' '#1087#1091#1073#1083#1080#1082#1086#1074#1072#1090#1100' '#1085#1072' '#1089#1072#1081#1090#1077
    TabOrder = 7
  end
  object Panel2: TPanel
    Left = 0
    Top = 292
    Width = 500
    Height = 16
    Alignment = taLeftJustify
    Anchors = [akRight, akBottom]
    BevelOuter = bvNone
    BorderWidth = 2
    Color = 10857647
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
  end
  object TBToolbar1: TTBToolbar
    Left = 330
    Top = 36
    Width = 168
    Height = 26
    Caption = 'TBToolbar1'
    Images = MainForm.ImageList20
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    DockTextAlign = taLeftJustify
    Skin = MainForm.TBSkin
    object TBItem7: TTBItem
      Action = ItemNew
    end
    object TBItem6: TTBItem
      Action = ItemCopy
    end
    object TBItem5: TTBItem
      Action = ItemEdit
    end
    object TBItem4: TTBItem
      Action = ItemDelete
    end
    object TBSeparatorItem1: TTBSeparatorItem
    end
    object TBItem3: TTBItem
      Action = ItemUp
    end
    object TBItem2: TTBItem
      Action = ItemDown
    end
  end
  object Grid: TcxGrid
    Left = 330
    Top = 65
    Width = 168
    Height = 221
    PopupMenu = TBPopupMenu
    TabOrder = 10
    object GridT1: TcxGridDBTableView
      OnDblClick = GridT1DblClick
      DataController.DataSource = DM.dsPages
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      object GridT1is_visible: TcxGridDBColumn
        Caption = #1055
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayUnchecked = 'False'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = '1'
        Properties.ValueUnchecked = '0'
        DataBinding.FieldName = 'is_visible'
      end
      object GridT1title: TcxGridDBColumn
        DataBinding.FieldName = 'title'
      end
    end
    object GridL1: TcxGridLevel
      GridView = GridT1
    end
  end
  object name: TcxDBMaskEdit
    Left = 0
    Top = 75
    Width = 301
    Height = 21
    DataBinding.DataSource = DM.dsArticles
    DataBinding.DataField = 'name'
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '[a-z_0-9-]+'
    Properties.MaxLength = 0
    TabOrder = 11
  end
  object ReSetName: TcxButton
    Left = 305
    Top = 75
    Width = 16
    Height = 21
    Caption = '<'
    TabOrder = 12
    OnClick = ReSetNameClick
  end
  object author: TcxDBTextEdit
    Left = 125
    Top = 265
    Width = 196
    Height = 21
    DataBinding.DataSource = DM.dsArticles
    DataBinding.DataField = 'author'
    TabOrder = 13
  end
  object ActionList: TActionList
    Images = MainForm.ImageList20
    Left = 385
    Top = 145
    object ItemNew: TAction
      Category = 'Pages'
      Caption = #1053#1086#1074#1072#1103' '#1089#1090#1088#1072#1085#1080#1094#1072
      Hint = #1053#1086#1074#1072#1103' '#1089#1090#1088#1072#1085#1080#1094#1072
      ImageIndex = 10
      OnExecute = ItemNewExecute
    end
    object ItemCopy: TAction
      Category = 'Pages'
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      Hint = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 11
      OnExecute = ItemCopyExecute
      OnUpdate = ItemCopyUpdate
    end
    object ItemEdit: TAction
      Category = 'Pages'
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 12
      OnExecute = ItemEditExecute
      OnUpdate = ItemCopyUpdate
    end
    object ItemDelete: TAction
      Category = 'Pages'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 13
      OnExecute = ItemDeleteExecute
      OnUpdate = ItemCopyUpdate
    end
    object ItemUp: TAction
      Category = 'Pages'
      Caption = #1055#1077#1088#1077#1084#1077#1089#1090#1080#1090#1100' '#1074#1099#1096#1077
      Hint = #1055#1077#1088#1077#1084#1077#1089#1090#1080#1090#1100' '#1074#1099#1096#1077
      ImageIndex = 35
      OnExecute = ItemUpExecute
      OnUpdate = ItemCopyUpdate
    end
    object ItemDown: TAction
      Category = 'Pages'
      Caption = #1055#1077#1088#1077#1084#1077#1089#1090#1080#1090#1100' '#1085#1080#1078#1077
      Hint = #1055#1077#1088#1077#1084#1077#1089#1090#1080#1090#1100' '#1085#1080#1078#1077
      ImageIndex = 34
      OnExecute = ItemDownExecute
      OnUpdate = ItemCopyUpdate
    end
    object ImgLoad: TAction
      Category = 'Image'
      Caption = 'ImgLoad'
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077
      ImageIndex = 9
    end
    object ImgClear: TAction
      Category = 'Image'
      Caption = 'ImgClear'
      Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077
      ImageIndex = 63
    end
    object AutoAnons: TAction
      Category = 'Image'
      Caption = #1040#1074#1090#1086' '#1072#1085#1086#1085#1089
      Hint = 
        #1042' '#1082#1072#1095#1077#1089#1090#1074#1077' '#1090#1077#1082#1089#1090#1072' '#1073#1077#1088#1077#1084' '#1089' '#1087#1077#1088#1074#1086#1081' '#1089#1090#1088#1072#1085#1080#1094#1077' '#1090#1077#1082#1089#1090' '#1055#1077#1088#1074#1099#1081' '#1072#1073#1079#1072#1094', '#1089#1095 +
        #1080#1090#1072#1077#1084' '#1082#1086#1083'-'#1074#1086' '#1089#1080#1084#1074#1086#1083#1086#1074', '#1077#1089#1083#1080' '#1086#1085#1086' '#1073#1086#1083#1100#1096#1077' 100 ('#1084#1086#1078#1077#1090' '#1085#1072#1089#1090#1088#1072#1080#1074#1072#1090#1100#1089#1103')' +
        ', '#1090#1086' '#1086#1090#1089#1095#1080#1090#1099#1074#1072#1077#1084' '#1086#1090' '#1085#1072#1095#1072#1083#1072' 100 '#1089#1080#1084#1074#1086#1083#1086#1074', '#1087#1077#1088#1077#1084#1077#1097#1072#1077#1084#1089#1103' '#1085#1072' '#1082#1086#1085#1077#1094' '#1089 +
        #1083#1086#1074#1072' ('#1077#1089#1083#1080' '#1087#1086#1087#1072#1083#1086' '#1074' '#1089#1077#1088#1077#1076#1080#1085#1091') '#1080' '#1076#1086#1073#1072#1074#1083#1103#1077#1084' "'#8230'".'
    end
    object ItemRename: TAction
      Category = 'Pages'
      Caption = #1055#1077#1088#1077#1080#1084#1077#1085#1086#1074#1072#1090#1100
      OnExecute = ItemRenameExecute
    end
  end
  object OpenPicture: TOpenPictureDialog
    Left = 420
    Top = 145
  end
  object TBPopupMenu: TTBPopupMenu
    Images = MainForm.ImageList20
    Left = 420
    Top = 120
    object TBItem10: TTBItem
      Action = ItemNew
    end
    object TBItem9: TTBItem
      Action = ItemCopy
    end
    object TBItem8: TTBItem
      Action = ItemEdit
    end
    object TBItem1: TTBItem
      Action = ItemDelete
    end
    object TBSeparatorItem4: TTBSeparatorItem
    end
    object TBItem16: TTBItem
      Action = ItemUp
      Enabled = False
    end
    object TBItem15: TTBItem
      Action = ItemDown
      Enabled = False
    end
    object TBSeparatorItem3: TTBSeparatorItem
    end
    object TBItem14: TTBItem
      Action = ItemRename
      Caption = #1057#1074#1086#1081#1089#1090#1074#1072
    end
  end
end
