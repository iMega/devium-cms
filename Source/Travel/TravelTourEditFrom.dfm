object TourEditFrom: TTourEditFrom
  Left = 393
  Top = 149
  BorderStyle = bsDialog
  BorderWidth = 5
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1090#1091#1088#1072
  ClientHeight = 394
  ClientWidth = 450
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    450
    394)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 20
    Width = 53
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
  end
  object Label4: TLabel
    Left = 0
    Top = 100
    Width = 71
    Height = 13
    Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077':'
  end
  object Label5: TLabel
    Left = 0
    Top = 195
    Width = 53
    Height = 13
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077':'
  end
  object Label6: TLabel
    Left = 150
    Top = 100
    Width = 29
    Height = 13
    Caption = #1062#1077#1085#1072':'
  end
  object Label7: TLabel
    Left = 0
    Top = 150
    Width = 57
    Height = 13
    Caption = #1055#1088#1080#1086#1088#1080#1090#1077#1090':'
  end
  object Label2: TLabel
    Left = 235
    Top = 100
    Width = 41
    Height = 13
    Caption = #1042#1072#1083#1102#1090#1072':'
  end
  object Label3: TLabel
    Left = 295
    Top = 20
    Width = 76
    Height = 13
    Caption = #1044#1072#1090#1099' '#1079#1072#1077#1079#1076#1086#1074':'
  end
  object Label9: TLabel
    Left = 0
    Top = 60
    Width = 106
    Height = 13
    Caption = #1051#1072#1090#1080#1085#1089#1082#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
  end
  object Label10: TLabel
    Left = 60
    Top = 150
    Width = 19
    Height = 13
    Caption = #1058#1080#1087
  end
  object Label11: TLabel
    Left = 215
    Top = 190
    Width = 58
    Height = 13
    Caption = #1076#1085#1077#1081'/'#1085#1086#1095#1077#1081
  end
  object Label8: TLabel
    Left = 300
    Top = 195
    Width = 75
    Height = 13
    Caption = #1055#1077#1088#1086#1076#1080#1095#1085#1086#1089#1090#1100':'
  end
  object btnOK: TcxButton
    Left = 295
    Top = 369
    Width = 75
    Height = 25
    Action = ActionOK
    Anchors = [akRight, akBottom]
    TabOrder = 15
  end
  object Cancel: TcxButton
    Left = 375
    Top = 369
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 16
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 450
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
    TabOrder = 17
  end
  object Panel1: TPanel
    Left = 0
    Top = 345
    Width = 450
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
    TabOrder = 18
  end
  object description: TcxDBMemo
    Left = 0
    Top = 210
    Width = 291
    Height = 101
    DataBinding.DataSource = DM.dsTours
    DataBinding.DataField = 'description'
    TabOrder = 10
  end
  object EditDescr: TcxButton
    Left = 0
    Top = 315
    Width = 75
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 11
    OnClick = EditDescrClick
  end
  object special_offer: TcxDBCheckBox
    Left = 80
    Top = 315
    Width = 146
    Height = 21
    DataBinding.DataSource = DM.dsTours
    DataBinding.DataField = 'special_offer'
    Properties.Alignment = taLeftJustify
    Properties.DisplayUnchecked = 'False'
    Properties.NullStyle = nssUnchecked
    Properties.ValueChecked = '1'
    Properties.ValueUnchecked = '0'
    Properties.Caption = #1043#1086#1088#1103#1095#1077#1077' '#1087#1088#1077#1076#1083#1086#1078#1077#1085#1080#1077
    TabOrder = 12
  end
  object cxGrid1: TcxGrid
    Left = 295
    Top = 60
    Width = 156
    Height = 131
    TabOrder = 14
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = DM.dsToursDates
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
      object cxGrid1DBTableView1date_begin: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1079#1072#1077#1079#1076#1072
        SortOrder = soDescending
        Width = 102
        DataBinding.FieldName = 'date_begin'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object TBToolbar1: TTBToolbar
    Left = 395
    Top = 30
    Width = 54
    Height = 26
    Caption = 'TBToolbar1'
    Images = MainForm.ImageList20
    TabOrder = 19
    DockTextAlign = taLeftJustify
    object TBItem2: TTBItem
      Action = Ins
    end
    object TBItem1: TTBItem
      Action = Del
    end
  end
  object direction_id: TcxDBLookupComboBox
    Left = 0
    Top = 115
    Width = 145
    Height = 21
    DataBinding.DataSource = DM.dsTours
    DataBinding.DataField = 'direction_id'
    Properties.DropDownListStyle = lsFixedList
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        FieldName = 'name'
      end>
    Properties.ListOptions.GridLines = glNone
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DM.dsDirections
    TabOrder = 2
  end
  object currency_id: TcxDBLookupComboBox
    Left = 235
    Top = 115
    Width = 51
    Height = 21
    DataBinding.DataSource = DM.dsTours
    DataBinding.DataField = 'currency_id'
    Properties.DropDownListStyle = lsFixedList
    Properties.KeyFieldNames = 'currency_id'
    Properties.ListColumns = <
      item
        FieldName = 'currency_name'
      end>
    Properties.ListOptions.GridLines = glNone
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DM.dsCurrency
    TabOrder = 4
  end
  object date_begin: TcxDBDateEdit
    Left = 295
    Top = 35
    Width = 96
    Height = 21
    DataBinding.DataSource = DM.dsToursDates
    DataBinding.DataField = 'date_begin'
    TabOrder = 13
  end
  object priority: TcxDBComboBox
    Left = 0
    Top = 165
    Width = 56
    Height = 21
    DataBinding.DataSource = DM.dsTours
    DataBinding.DataField = 'priority'
    Properties.DropDownListStyle = lsFixedList
    Properties.Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5')
    TabOrder = 6
  end
  object low_price: TcxDBSpinEdit
    Left = 150
    Top = 115
    Width = 81
    Height = 21
    DataBinding.DataSource = DM.dsTours
    DataBinding.DataField = 'low_price'
    Properties.MaxValue = 99999999.000000000000000000
    Properties.ValueType = vtFloat
    TabOrder = 3
  end
  object title: TcxDBTextEdit
    Left = 0
    Top = 35
    Width = 286
    Height = 21
    DataBinding.DataSource = DM.dsTours
    DataBinding.DataField = 'title'
    Properties.OnEditValueChanged = titlePropertiesEditValueChanged
    TabOrder = 0
  end
  object name: TcxDBMaskEdit
    Left = 0
    Top = 75
    Width = 266
    Height = 21
    DataBinding.DataSource = DM.dsTours
    DataBinding.DataField = 'name'
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '[a-z_0-9-]+'
    Properties.MaxLength = 0
    TabOrder = 1
  end
  object tourtype_id: TcxDBLookupComboBox
    Left = 60
    Top = 165
    Width = 136
    Height = 21
    DataBinding.DataSource = DM.dsTours
    DataBinding.DataField = 'tourtype_id'
    Properties.DropDownListStyle = lsFixedList
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        FieldName = 'title'
      end>
    Properties.ListOptions.GridLines = glNone
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DM.dsTourTypes
    TabOrder = 7
  end
  object Attach: TcxButton
    Left = 0
    Top = 365
    Width = 75
    Height = 25
    Caption = #1060#1072#1081#1083
    TabOrder = 20
    OnClick = AttachClick
  end
  object plus_avia: TcxDBCheckBox
    Left = 150
    Top = 135
    Width = 51
    Height = 21
    DataBinding.DataSource = DM.dsTours
    DataBinding.DataField = 'plus_avia'
    Properties.Alignment = taLeftJustify
    Properties.DisplayUnchecked = 'False'
    Properties.NullStyle = nssUnchecked
    Properties.ValueChecked = '1'
    Properties.ValueUnchecked = '0'
    Properties.Caption = '+ '#1072'/'#1073
    TabOrder = 5
  end
  object length_day: TcxDBSpinEdit
    Left = 200
    Top = 165
    Width = 41
    Height = 21
    DataBinding.DataSource = DM.dsTours
    DataBinding.DataField = 'length_day'
    Properties.MaxValue = 1000.000000000000000000
    TabOrder = 8
  end
  object length_night: TcxDBSpinEdit
    Left = 245
    Top = 165
    Width = 41
    Height = 21
    DataBinding.DataSource = DM.dsTours
    DataBinding.DataField = 'length_night'
    Properties.MaxValue = 1000.000000000000000000
    TabOrder = 9
  end
  object Monday: TcxCheckBox
    Tag = 1
    Left = 295
    Top = 210
    Width = 121
    Height = 21
    ParentBackground = True
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1055#1086#1085#1077#1076#1077#1083#1100#1085#1080#1082
    TabOrder = 21
  end
  object Tuesday: TcxCheckBox
    Tag = 2
    Left = 295
    Top = 225
    Width = 121
    Height = 21
    ParentBackground = True
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1042#1090#1086#1088#1085#1080#1082
    TabOrder = 22
  end
  object Wednesday: TcxCheckBox
    Tag = 3
    Left = 295
    Top = 240
    Width = 121
    Height = 21
    ParentBackground = True
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1057#1088#1077#1076#1072
    TabOrder = 23
  end
  object Thursday: TcxCheckBox
    Tag = 4
    Left = 295
    Top = 255
    Width = 121
    Height = 21
    ParentBackground = True
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1063#1077#1090#1074#1077#1088#1075
    TabOrder = 24
  end
  object Friday: TcxCheckBox
    Tag = 5
    Left = 295
    Top = 270
    Width = 121
    Height = 21
    ParentBackground = True
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1055#1103#1090#1085#1080#1094#1072
    TabOrder = 25
  end
  object Saturday: TcxCheckBox
    Tag = 6
    Left = 295
    Top = 285
    Width = 121
    Height = 21
    ParentBackground = True
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1057#1091#1073#1073#1086#1090#1072
    TabOrder = 26
  end
  object Sunday: TcxCheckBox
    Tag = 7
    Left = 295
    Top = 300
    Width = 121
    Height = 21
    ParentBackground = True
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1042#1086#1089#1082#1088#1077#1089#1077#1085#1100#1077
    TabOrder = 27
  end
  object EveryDay: TcxCheckBox
    Left = 295
    Top = 320
    Width = 121
    Height = 21
    ParentBackground = True
    Properties.DisplayUnchecked = 'False'
    Properties.OnChange = EveryDayPropertiesChange
    Properties.Caption = #1050#1072#1078#1076#1099#1081' '#1076#1077#1085#1100
    TabOrder = 28
  end
  object plus_train: TcxDBCheckBox
    Left = 215
    Top = 135
    Width = 66
    Height = 21
    DataBinding.DataSource = DM.dsTours
    DataBinding.DataField = 'plus_train'
    Properties.Alignment = taLeftJustify
    Properties.DisplayUnchecked = 'False'
    Properties.NullStyle = nssUnchecked
    Properties.ValueChecked = '1'
    Properties.ValueUnchecked = '0'
    Properties.Caption = '+ '#1078#1076'/'#1073
    TabOrder = 29
  end
  object cxButton1: TcxButton
    Left = 270
    Top = 75
    Width = 16
    Height = 21
    Hint = #1087#1077#1088#1077#1089#1086#1079#1076#1072#1090#1100' "'#1051#1072#1090#1080#1085#1089#1082#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077'"'
    Caption = '<'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 30
    OnClick = cxButton1Click
  end
  object ActionList: TActionList
    Images = MainForm.ImageList20
    Left = 190
    Top = 245
    object ActionOK: TAction
      Caption = 'OK'
      ShortCut = 16397
      OnExecute = ActionOKExecute
    end
    object Ins: TAction
      Caption = 'Ins'
      ImageIndex = 21
      OnExecute = InsExecute
    end
    object Post: TAction
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      OnExecute = PostExecute
      OnUpdate = PostUpdate
    end
    object Del: TAction
      Caption = 'Del'
      ImageIndex = 23
      OnExecute = DelExecute
      OnUpdate = DelUpdate
    end
  end
  object OpenDialog: TOpenDialog
    OptionsEx = [ofExNoPlacesBar]
    Left = 80
    Top = 365
  end
end
