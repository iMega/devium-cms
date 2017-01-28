object ProductForm: TProductForm
  Left = 315
  Top = 186
  ActiveControl = product_article
  BorderStyle = bsDialog
  BorderWidth = 5
  Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1090#1086#1074#1072#1088#1072
  ClientHeight = 382
  ClientWidth = 500
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
  object Label1: TLabel
    Left = 0
    Top = 40
    Width = 96
    Height = 13
    Caption = #1050#1088#1072#1090#1082#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077':'
  end
  object Label2: TLabel
    Left = 1
    Top = 80
    Width = 92
    Height = 13
    Caption = #1055#1086#1083#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077':'
  end
  object Label4: TLabel
    Left = 0
    Top = 0
    Width = 44
    Height = 13
    Caption = #1040#1088#1090#1080#1082#1091#1083':'
  end
  object Label5: TLabel
    Left = 255
    Top = 0
    Width = 82
    Height = 13
    Caption = #1043#1088#1091#1087#1087#1072' '#1089#1074#1086#1081#1089#1090#1074':'
  end
  object Label6: TLabel
    Left = 3
    Top = 140
    Width = 163
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1083#1072#1090#1080#1085#1089#1082#1080#1084#1080' '#1073#1091#1082#1074#1072#1084#1080':'
  end
  object Label7: TLabel
    Left = 1
    Top = 190
    Width = 53
    Height = 13
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077':'
  end
  object Label3: TLabel
    Left = 255
    Top = 40
    Width = 51
    Height = 13
    Caption = #1057#1074#1086#1081#1089#1090#1074#1072':'
  end
  object Panel4: TPanel
    Left = -5
    Top = 339
    Width = 500
    Height = 12
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Color = 10857647
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 13
  end
  object OK: TcxButton
    Left = 340
    Top = 355
    Width = 75
    Height = 25
    Action = ActionOK
    TabOrder = 11
  end
  object Cancel: TcxButton
    Left = 420
    Top = 355
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 12
  end
  object title: TcxDBTextEdit
    Left = 0
    Top = 55
    Width = 250
    Height = 21
    DataBinding.DataSource = DM.dsProducts
    DataBinding.DataField = 'title'
    Properties.OnEditValueChanged = titlePropertiesEditValueChanged
    TabOrder = 1
  end
  object product_article: TcxDBTextEdit
    Left = 0
    Top = 15
    Width = 250
    Height = 21
    DataBinding.DataSource = DM.dsProducts
    DataBinding.DataField = 'product_article'
    TabOrder = 0
  end
  object full_title: TcxDBMemo
    Left = 1
    Top = 95
    Width = 250
    Height = 41
    DataBinding.DataSource = DM.dsProducts
    DataBinding.DataField = 'full_title'
    TabOrder = 2
  end
  object name: TcxDBMaskEdit
    Left = 0
    Top = 155
    Width = 231
    Height = 21
    DataBinding.DataSource = DM.dsProducts
    DataBinding.DataField = 'name'
    Properties.MaskKind = emkRegExpr
    TabOrder = 3
  end
  object Go: TcxButton
    Left = 245
    Top = 355
    Width = 90
    Height = 25
    Caption = #1055#1077#1088#1077#1081#1090#1080
    TabOrder = 10
    DropDownMenu = TBPopupMenu1
    Kind = cxbkDropDownButton
  end
  object description: TcxDBMemo
    Left = 1
    Top = 205
    Width = 250
    Height = 76
    DataBinding.DataSource = DM.dsProducts
    DataBinding.DataField = 'description'
    TabOrder = 4
  end
  object EditDescription: TcxButton
    Left = 170
    Top = 285
    Width = 75
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 5
    OnClick = EditDescriptionClick
  end
  object InspPanel: TPanel
    Left = 255
    Top = 55
    Width = 240
    Height = 271
    BevelOuter = bvNone
    BorderWidth = 1
    Color = clBtnShadow
    TabOrder = 9
    object Inspector: TdxInspector
      Left = 1
      Top = 1
      Width = 238
      Height = 269
      Align = alClient
      BorderStyle = bsNone
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      OnEnter = InspectorEnter
      OnExit = InspectorExit
      DividerPos = 117
      GridColor = clBtnFace
      Flat = True
      Options = [ioAutoWidth, ioBandSizing, ioColumnSizing, ioDrawEndEllipsis, ioDynamicColumnSizing, ioEditing, ioEnterThrough, ioTabThrough, ioTabs]
      PaintStyle = ipsNET
      OnDrawValue = InspectorDrawValue
      OnEdited = InspectorEdited
      OnGetEditFont = InspectorGetEditFont
      Data = {
        210000000100000008000000000000000D000000496E73706563746F72526F77
        3100000000}
      object InspectorRow1: TdxInspectorTextButtonRow
        Buttons = <
          item
            Default = True
          end>
      end
    end
  end
  object type_id: TcxDBLookupComboBox
    Left = 255
    Top = 15
    Width = 240
    Height = 21
    DataBinding.DataSource = DM.dsProducts
    DataBinding.DataField = 'type_id'
    Properties.DropDownListStyle = lsFixedList
    Properties.KeyFieldNames = 'type_id'
    Properties.ListColumns = <
      item
        FieldName = 'type_title'
      end>
    Properties.ListOptions.GridLines = glNone
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DM.dsTypes
    TabOrder = 8
  end
  object is_visible: TcxDBCheckBox
    Left = 0
    Top = 285
    Width = 151
    Height = 21
    DataBinding.DataSource = DM.dsProducts
    DataBinding.DataField = 'is_visible'
    Properties.Alignment = taLeftJustify
    Properties.DisplayUnchecked = 'False'
    Properties.NullStyle = nssUnchecked
    Properties.ValueChecked = '0'
    Properties.ValueUnchecked = '1'
    Properties.Caption = #1053#1077' '#1074#1099#1074#1086#1076#1080#1090#1100' '#1085#1072' '#1089#1072#1081#1090#1077
    TabOrder = 6
  end
  object is_printable: TcxDBCheckBox
    Left = 0
    Top = 305
    Width = 166
    Height = 21
    DataBinding.DataSource = DM.dsProducts
    DataBinding.DataField = 'is_printable'
    Properties.Alignment = taLeftJustify
    Properties.DisplayUnchecked = 'False'
    Properties.NullStyle = nssUnchecked
    Properties.ValueChecked = '0'
    Properties.ValueUnchecked = '1'
    Properties.Caption = #1053#1077' '#1074#1082#1083#1102#1095#1072#1090#1100' '#1074' '#1087#1088#1072#1081#1089'-'#1083#1080#1089#1090
    TabOrder = 7
  end
  object cxButton1: TcxButton
    Left = 235
    Top = 155
    Width = 16
    Height = 20
    Hint = #1055#1077#1088#1077#1089#1086#1079#1076#1072#1090#1100' "'#1053#1072#1079#1074#1072#1085#1080#1077' '#1083#1072#1090#1080#1085#1089#1082#1080#1084#1080' '#1073#1091#1082#1074#1072#1084#1080'"'
    Caption = '<'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
    TabStop = False
    OnClick = cxButton1Click
  end
  object ActionList: TActionList
    Left = 135
    Top = 350
    object ActionOK: TAction
      Caption = 'OK'
      ShortCut = 16397
      OnExecute = ActionOKExecute
    end
    object PricesList: TAction
      Caption = #1062#1077#1085#1099
    end
    object UnitsList: TAction
      Caption = #1045#1076#1077#1085#1080#1094#1099' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
      OnExecute = UnitsListExecute
    end
    object Action1: TAction
      Caption = 'Action1'
    end
  end
  object TBPopupMenu1: TTBPopupMenu
    Left = 165
    Top = 350
    object TBItem2: TTBItem
      Action = PricesList
    end
    object TBItem1: TTBItem
      Action = UnitsList
    end
  end
  object OpenDialog: TOpenDialog
    Filter = #1042#1089#1077'(*.*)|*.*'
    OptionsEx = [ofExNoPlacesBar]
    Left = 105
    Top = 350
  end
  object OpenPictureDialog: TOpenPictureDialog
    OptionsEx = [ofExNoPlacesBar]
    Left = 75
    Top = 349
  end
end
