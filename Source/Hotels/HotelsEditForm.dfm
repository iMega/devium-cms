object HotelsForm: THotelsForm
  Left = 390
  Top = 167
  ActiveControl = name
  BorderStyle = bsDialog
  BorderWidth = 5
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1085#1072#1080#1077' '#1086#1090#1077#1083#1103
  ClientHeight = 450
  ClientWidth = 434
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    434
    450)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 20
    Width = 53
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
  end
  object Label2: TLabel
    Left = 0
    Top = 100
    Width = 73
    Height = 13
    Caption = #1043#1086#1088#1086#1076'/'#1050#1091#1088#1086#1088#1090':'
  end
  object Label5: TLabel
    Left = 0
    Top = 170
    Width = 53
    Height = 13
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077':'
  end
  object Label7: TLabel
    Left = 215
    Top = 20
    Width = 71
    Height = 13
    Caption = #1059#1089#1083#1091#1075#1080' '#1086#1090#1077#1083#1103':'
  end
  object Label6: TLabel
    Left = 0
    Top = 60
    Width = 39
    Height = 13
    Caption = #1057#1090#1088#1072#1085#1072':'
  end
  object Label3: TLabel
    Left = 0
    Top = 143
    Width = 54
    Height = 13
    Caption = #1058#1080#1087' '#1086#1090#1077#1083#1103':'
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 434
    Height = 16
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Color = 10857647
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
  end
  object Cancel: TcxButton
    Left = 359
    Top = 425
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 13
  end
  object Panel1: TPanel
    Left = 0
    Top = 401
    Width = 434
    Height = 16
    Alignment = taLeftJustify
    Anchors = [akLeft, akRight, akBottom]
    BevelOuter = bvNone
    Color = 10857647
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 14
  end
  object btnOK: TcxButton
    Left = 279
    Top = 425
    Width = 75
    Height = 25
    Action = ActionOK
    Anchors = [akRight, akBottom]
    TabOrder = 12
  end
  object Groups: TcxComboBox
    Left = 215
    Top = 35
    Width = 216
    Height = 21
    Properties.DropDownListStyle = lsFixedList
    Properties.OnChange = GroupsPropertiesChange
    TabOrder = 9
  end
  object Panel3: TPanel
    Left = 215
    Top = 90
    Width = 217
    Height = 301
    BevelOuter = bvNone
    BorderWidth = 1
    Color = clActiveCaption
    TabOrder = 15
    object ServicesList: TCheckListBox
      Left = 1
      Top = 1
      Width = 215
      Height = 299
      Align = alClient
      BorderStyle = bsNone
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object Panel4: TPanel
    Left = 205
    Top = 20
    Width = 3
    Height = 371
    BevelOuter = bvNone
    Color = 10857647
    TabOrder = 16
  end
  object name: TcxDBTextEdit
    Left = 0
    Top = 35
    Width = 201
    Height = 21
    DataBinding.DataSource = DM.dsHotels
    DataBinding.DataField = 'name'
    TabOrder = 0
  end
  object description: TcxDBMemo
    Left = 0
    Top = 185
    Width = 201
    Height = 89
    DataBinding.DataSource = DM.dsHotels
    DataBinding.DataField = 'description'
    TabOrder = 5
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 305
    Width = 201
    Height = 86
    TabOrder = 7
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = DM.dsHotelsImages
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
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.Selection = MainForm.cxStyle1
      object cxGrid1DBTableView1id: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'id'
      end
      object cxGrid1DBTableView1hotel_id: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'hotel_id'
      end
      object cxGrid1DBTableView1image: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'image'
      end
      object cxGrid1DBTableView1name: TcxGridDBColumn
        Caption = #1048#1084#1103
        DataBinding.FieldName = 'name'
      end
      object cxGrid1DBTableView1description: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'description'
      end
      object cxGrid1DBTableView1sort_order: TcxGridDBColumn
        SortOrder = soAscending
        DataBinding.FieldName = 'sort_order'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object TBToolbar1: TTBToolbar
    Left = 0
    Top = 275
    Width = 174
    Height = 26
    Caption = 'TBToolbar1'
    Images = MainForm.ImageList20
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    DockTextAlign = taLeftJustify
    Skin = MainForm.TBSkin
    object TBItem1: TTBItem
      Action = DescEdit
    end
    object TBSeparatorItem1: TTBSeparatorItem
    end
    object TBItem4: TTBItem
      Action = Ins
    end
    object TBItem3: TTBItem
      Action = Edit
    end
    object TBItem2: TTBItem
      Action = Del
    end
    object TBSeparatorItem2: TTBSeparatorItem
    end
    object TBItem7: TTBItem
      Action = ImageUp
    end
    object TBItem6: TTBItem
      Action = ImageDown
    end
  end
  object Types: TcxComboBox
    Left = 215
    Top = 60
    Width = 186
    Height = 21
    Properties.DropDownListStyle = lsFixedList
    Properties.OnChange = TypesPropertiesChange
    TabOrder = 10
  end
  object TBToolbar2: TTBToolbar
    Left = 405
    Top = 58
    Width = 27
    Height = 26
    Caption = 'TBToolbar2'
    Images = MainForm.ImageList20
    TabOrder = 11
    DockTextAlign = taLeftJustify
    Skin = MainForm.TBSkin
    object TBItem5: TTBItem
      Action = TypeEdit
    end
  end
  object place_id: TcxDBLookupComboBox
    Left = 0
    Top = 115
    Width = 201
    Height = 21
    DataBinding.DataSource = DM.dsHotels
    DataBinding.DataField = 'place_id'
    Properties.ClearKey = 8307
    Properties.DropDownListStyle = lsFixedList
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        FieldName = 'name'
      end>
    Properties.ListOptions.GridLines = glNone
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DM.dsPlaces
    TabOrder = 2
  end
  object starts: TcxDBComboBox
    Left = 60
    Top = 140
    Width = 46
    Height = 21
    DataBinding.DataSource = DM.dsHotels
    DataBinding.DataField = 'starts'
    Properties.DropDownListStyle = lsEditFixedList
    Properties.Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5')
    TabOrder = 3
  end
  object super: TcxDBCheckBox
    Left = 110
    Top = 140
    Width = 56
    Height = 21
    DataBinding.DataSource = DM.dsHotels
    DataBinding.DataField = 'super'
    Properties.DisplayUnchecked = 'False'
    Properties.NullStyle = nssUnchecked
    Properties.ValueChecked = '1'
    Properties.ValueUnchecked = '0'
    Properties.Caption = 'Super'
    TabOrder = 4
  end
  object country_id: TcxDBLookupComboBox
    Left = 0
    Top = 75
    Width = 201
    Height = 21
    DataBinding.DataSource = DM.dsHotels
    DataBinding.DataField = 'country_id'
    Properties.ClearKey = 8307
    Properties.DropDownListStyle = lsFixedList
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        FieldName = 'name'
      end>
    Properties.ListOptions.GridLines = glNone
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DM.dsCountries
    TabOrder = 1
  end
  object ActionList: TActionList
    Images = MainForm.ImageList20
    Left = 130
    Top = 210
    object ActionOK: TAction
      Caption = 'OK'
      ShortCut = 16397
      OnExecute = ActionOKExecute
    end
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
    object DescEdit: TAction
      Caption = 'DescEdit'
      ImageIndex = 12
      OnExecute = DescEditExecute
    end
    object TypeEdit: TAction
      Caption = 'TypeEdit'
      ImageIndex = 32
      OnExecute = TypeEditExecute
    end
    object ImageUp: TAction
      Caption = 'ImageUp'
      ImageIndex = 35
    end
    object ImageDown: TAction
      Caption = 'ImageDown'
      ImageIndex = 34
    end
  end
end
