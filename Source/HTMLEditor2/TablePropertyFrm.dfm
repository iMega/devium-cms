object TablePropertyForm: TTablePropertyForm
  Left = 503
  Top = 199
  BorderStyle = bsDialog
  Caption = #1057#1074#1086#1081#1089#1090#1074#1072' '#1090#1072#1073#1083#1080#1094#1099
  ClientHeight = 307
  ClientWidth = 340
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
  object Label3: TLabel
    Left = 10
    Top = 30
    Width = 78
    Height = 13
    Caption = #1042#1099#1088#1072#1074#1085#1080#1074#1072#1085#1080#1077':'
  end
  object Label4: TLabel
    Left = 10
    Top = 55
    Width = 95
    Height = 13
    Caption = #1058#1086#1083#1097#1080#1085#1072' '#1075#1088#1072#1085#1080#1094#1099':'
  end
  object Label5: TLabel
    Left = 10
    Top = 80
    Width = 61
    Height = 13
    Caption = #1055#1086#1083#1103' '#1103#1095#1077#1077#1082':'
  end
  object Label6: TLabel
    Left = 10
    Top = 105
    Width = 84
    Height = 13
    Caption = #1048#1085#1090#1088#1077#1074#1072#1083' '#1103#1095#1077#1077#1082':'
  end
  object OK: TcxButton
    Left = 181
    Top = 276
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 0
  end
  object Cancel: TcxButton
    Left = 261
    Top = 276
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 1
  end
  object Panel2: TPanel
    Left = 5
    Top = 5
    Width = 331
    Height = 16
    Alignment = taLeftJustify
    BevelOuter = bvNone
    BorderWidth = 2
    Caption = #1055#1086#1083#1086#1078#1077#1085#1080#1077
    Color = 10857647
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object Panel3: TPanel
    Left = 5
    Top = 253
    Width = 331
    Height = 16
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
    TabOrder = 3
  end
  object align: TcxComboBox
    Left = 125
    Top = 25
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'align'
  end
  object border: TcxSpinEdit
    Left = 125
    Top = 50
    Width = 76
    Height = 21
    Properties.MaxValue = 255.000000000000000000
    TabOrder = 5
  end
  object cellpadding: TcxSpinEdit
    Left = 125
    Top = 75
    Width = 76
    Height = 21
    Properties.MaxValue = 255.000000000000000000
    TabOrder = 6
  end
  object cellspacing: TcxSpinEdit
    Left = 125
    Top = 100
    Width = 76
    Height = 21
    Properties.MaxValue = 255.000000000000000000
    TabOrder = 7
  end
  object Panel4: TPanel
    Left = 55
    Top = 125
    Width = 280
    Height = 16
    Alignment = taLeftJustify
    BevelOuter = bvNone
    BorderWidth = 2
    Caption = #1064#1080#1088#1080#1085#1072
    Color = 10857647
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
  end
  object UseWidth: TcxCheckBox
    Left = 55
    Top = 145
    Width = 121
    Height = 21
    ParentBackground = True
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1047#1072#1076#1072#1090#1100' '#1096#1080#1088#1080#1085#1091
    TabOrder = 9
  end
  object PercentWidth: TcxCheckBox
    Left = 55
    Top = 165
    Width = 121
    Height = 21
    ParentBackground = True
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1042' '#1087#1088#1086#1094#1077#1085#1090#1072#1093
    TabOrder = 10
  end
  object _width: TcxSpinEdit
    Left = 175
    Top = 145
    Width = 76
    Height = 21
    Properties.MaxValue = 255.000000000000000000
    Properties.MinValue = 1.000000000000000000
    TabOrder = 11
    Value = 1
  end
  object Panel1: TPanel
    Left = 55
    Top = 190
    Width = 280
    Height = 16
    Alignment = taLeftJustify
    BevelOuter = bvNone
    BorderWidth = 2
    Caption = #1042#1099#1089#1086#1090#1072
    Color = 10857647
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
  end
  object UseHeight: TcxCheckBox
    Left = 55
    Top = 210
    Width = 121
    Height = 21
    ParentBackground = True
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1047#1072#1076#1072#1090#1100' '#1074#1099#1089#1086#1090#1091
    TabOrder = 13
  end
  object PercentHeight: TcxCheckBox
    Left = 55
    Top = 230
    Width = 121
    Height = 21
    ParentBackground = True
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1042' '#1087#1088#1086#1094#1077#1085#1090#1072#1093
    TabOrder = 14
  end
  object _height: TcxSpinEdit
    Left = 175
    Top = 210
    Width = 76
    Height = 21
    Properties.MaxValue = 255.000000000000000000
    Properties.MinValue = 1.000000000000000000
    TabOrder = 15
    Value = 1
  end
end
