object FolderForm: TFolderForm
  Left = 270
  Top = 164
  ActiveControl = Title
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsDialog
  BorderWidth = 5
  Caption = #1057#1074#1086#1081#1089#1090#1074#1072' '#1087#1072#1087#1082#1080
  ClientHeight = 335
  ClientWidth = 430
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
  object Label1: TLabel
    Left = 0
    Top = 20
    Width = 53
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
  end
  object Label2: TLabel
    Left = 215
    Top = 20
    Width = 163
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1083#1072#1090#1080#1085#1089#1082#1080#1084#1080' '#1073#1091#1082#1074#1072#1084#1080':'
  end
  object Label3: TLabel
    Left = 0
    Top = 80
    Width = 53
    Height = 13
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077':'
  end
  object Label4: TLabel
    Left = 215
    Top = 80
    Width = 88
    Height = 13
    Caption = #1050#1083#1102#1095#1077#1074#1099#1077' '#1089#1083#1086#1074#1072':'
  end
  object Label5: TLabel
    Left = 215
    Top = 225
    Width = 42
    Height = 13
    Caption = #1064#1072#1073#1083#1086#1085':'
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 430
    Height = 16
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = #1054#1073#1097#1080#1077
    Color = 10857647
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 206
    Width = 430
    Height = 16
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = #1060#1083#1072#1075#1080'/'#1064#1072#1073#1083#1086#1085
    Color = 10857647
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object OK: TcxButton
    Left = 275
    Top = 310
    Width = 75
    Height = 25
    Action = ActionOK
    TabOrder = 2
  end
  object Cancel: TcxButton
    Left = 355
    Top = 310
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 3
  end
  object Title: TcxTextEdit
    Left = 0
    Top = 35
    Width = 215
    Height = 21
    Properties.OnEditValueChanged = TitlePropertiesEditValueChanged
    TabOrder = 4
    Text = 'Title'
  end
  object Panel3: TPanel
    Left = 0
    Top = 61
    Width = 430
    Height = 16
    Hint = 
      #1052#1077#1090#1072' '#1076#1072#1085#1085#1099#1077' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1099' '#1076#1083#1103' '#1088#1072#1073#1086#1090#1099' '#1087#1086#1080#1089#1082#1086#1074#1099#1093' '#13#1089#1080#1089#1090#1077#1084'. '#1055#1088#1080' '#1078#1077#1083#1072#1085#1080#1080 +
      ' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1080#1093' '#1089#1072#1084#1086#1089#1090#1086#1103#1090#1077#1083#1100#1085#1086','#13#1087#1088#1086#1082#1086#1085#1089#1091#1083#1100#1090#1080#1088#1091#1081#1090#1077#1089#1100' '#1089' '#1088#1072#1079#1088#1072#1073#1086#1090 +
      #1095#1080#1082#1072#1084#1080
    Alignment = taLeftJustify
    BevelOuter = bvNone
    BorderWidth = 2
    Caption = #1052#1045#1058#1040' '#1076#1072#1085#1085#1099#1077
    Color = 10857647
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  object Description: TcxMemo
    Left = -1
    Top = 95
    Width = 215
    Height = 90
    Lines.Strings = (
      'description')
    TabOrder = 6
  end
  object KeyWords: TcxMemo
    Left = 215
    Top = 95
    Width = 215
    Height = 90
    Lines.Strings = (
      'KeyWords')
    TabOrder = 7
  end
  object Panel4: TPanel
    Left = 0
    Top = 291
    Width = 430
    Height = 16
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
  object dont_visible: TcxCheckBox
    Left = 0
    Top = 225
    Width = 211
    Height = 21
    ParentBackground = True
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1053#1077' '#1087#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1085#1072' '#1089#1072#1081#1090#1077
    TabOrder = 9
  end
  object Template: TcxComboBox
    Left = 215
    Top = 240
    Width = 216
    Height = 21
    Properties.DropDownListStyle = lsFixedList
    TabOrder = 10
  end
  object parent_data: TcxCheckBox
    Left = 0
    Top = 185
    Width = 436
    Height = 21
    ParentBackground = True
    Properties.DisplayUnchecked = 'False'
    Properties.OnChange = parent_dataPropertiesChange
    Properties.Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1052#1045#1058#1040' '#1076#1072#1085#1085#1099#1077' '#1088#1086#1076#1080#1090#1077#1083#1103
    TabOrder = 11
  end
  object dont_click: TcxCheckBox
    Left = 0
    Top = 240
    Width = 211
    Height = 21
    ParentBackground = True
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1041#1077#1079' '#1089#1089#1099#1083#1082#1080
    TabOrder = 12
  end
  object is_default: TcxCheckBox
    Left = 0
    Top = 255
    Width = 211
    Height = 21
    ParentBackground = True
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    TabOrder = 13
  end
  object is_dynamic: TcxCheckBox
    Left = 0
    Top = 270
    Width = 211
    Height = 21
    ParentBackground = True
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1044#1080#1085#1072#1084#1080#1095#1077#1089#1082#1080#1081
    TabOrder = 14
  end
  object UseParentTemplate: TcxCheckBox
    Left = 215
    Top = 260
    Width = 196
    Height = 21
    ParentBackground = True
    Properties.DisplayUnchecked = 'False'
    Properties.OnChange = UseParentTemplatePropertiesChange
    Properties.Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1096#1072#1073#1083#1086#1085' '#1088#1086#1076#1080#1090#1077#1083#1103
    TabOrder = 15
  end
  object name: TcxMaskEdit
    Left = 215
    Top = 35
    Width = 196
    Height = 21
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '[a-z_0-9-]+'
    Properties.MaxLength = 0
    TabOrder = 16
    Text = 'name'
  end
  object cxButton1: TcxButton
    Left = 414
    Top = 35
    Width = 16
    Height = 21
    Hint = #1055#1077#1088#1077#1089#1086#1079#1076#1072#1090#1100' "'#1053#1072#1079#1074#1072#1085#1080#1077' '#1083#1072#1090#1080#1085#1089#1082#1080#1084#1080' '#1073#1091#1082#1074#1072#1084#1080'"'
    Caption = '<'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 17
    TabStop = False
    OnClick = cxButton1Click
  end
  object ActionList: TActionList
    Left = 365
    Top = 120
    object ActionOK: TAction
      Caption = 'OK'
      ShortCut = 16397
      OnExecute = ActionOKExecute
    end
  end
end
