object PageNameEditForm: TPageNameEditForm
  Left = 385
  Top = 241
  BorderStyle = bsDialog
  BorderWidth = 5
  Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1076#1083#1103' '#1089#1090#1088#1072#1085#1080#1094#1099
  ClientHeight = 130
  ClientWidth = 320
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
    Top = 0
    Width = 54
    Height = 13
    Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082
  end
  object Label7: TLabel
    Left = 0
    Top = 40
    Width = 163
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1083#1072#1090#1080#1085#1089#1082#1080#1084#1080' '#1073#1091#1082#1074#1072#1084#1080':'
  end
  object Panel2: TPanel
    Left = 0
    Top = 81
    Width = 320
    Height = 16
    Hint = '"'#1053#1072#1078#1084#1080' '#1085#1072' '#1082#1085#1086#1087#1082#1091' '#1080' '#1087#1086#1083#1091#1095#1080#1096#1100' '#1088#1077#1079#1091#1083#1100#1090#1072#1090'"'#13#1042#1048#1040' '#1058#1077#1093#1085#1072#1083#1086#1075#1080#1103
    Alignment = taLeftJustify
    BevelOuter = bvNone
    BorderWidth = 2
    Color = 10857647
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object Cancel: TcxButton
    Left = 245
    Top = 105
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 1
  end
  object OK: TcxButton
    Left = 165
    Top = 105
    Width = 75
    Height = 25
    Action = ActionOK
    TabOrder = 2
  end
  object name: TcxDBMaskEdit
    Left = 0
    Top = 55
    Width = 301
    Height = 21
    DataBinding.DataSource = DM.dsPages
    DataBinding.DataField = 'name'
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '[a-z_0-9-]+'
    Properties.MaxLength = 0
    TabOrder = 3
  end
  object ReSetName: TcxButton
    Left = 304
    Top = 55
    Width = 16
    Height = 21
    Caption = '<'
    TabOrder = 4
    OnClick = ReSetNameClick
  end
  object title: TcxDBTextEdit
    Left = 0
    Top = 15
    Width = 320
    Height = 21
    DataBinding.DataSource = DM.dsPages
    DataBinding.DataField = 'title'
    Properties.OnEditValueChanged = titlePropertiesEditValueChanged
    TabOrder = 5
  end
  object is_visible: TcxDBCheckBox
    Left = 5
    Top = 105
    Width = 156
    Height = 21
    DataBinding.DataSource = DM.dsPages
    DataBinding.DataField = 'is_visible'
    Properties.Alignment = taLeftJustify
    Properties.DisplayUnchecked = 'False'
    Properties.NullStyle = nssInactive
    Properties.ValueChecked = '0'
    Properties.ValueUnchecked = '1'
    Properties.Caption = #1053#1077' '#1087#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1085#1072' '#1089#1072#1081#1090#1077
    TabOrder = 6
  end
  object ActionList: TActionList
    Left = 260
    Top = 5
    object ActionOK: TAction
      Caption = 'OK'
      ShortCut = 16397
      OnExecute = ActionOKExecute
    end
  end
end
