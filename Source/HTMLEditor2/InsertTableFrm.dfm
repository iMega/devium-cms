object InsertTableForm: TInsertTableForm
  Left = 472
  Top = 198
  BorderStyle = bsDialog
  Caption = #1042#1089#1090#1072#1074#1082#1072' '#1090#1072#1073#1083#1080#1094#1099
  ClientHeight = 312
  ClientWidth = 340
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 10
    Top = 30
    Width = 67
    Height = 13
    Caption = #1063#1080#1089#1083#1086' '#1089#1090#1088#1086#1082':'
  end
  object Label2: TLabel
    Left = 10
    Top = 55
    Width = 85
    Height = 13
    Caption = #1063#1080#1089#1083#1086' '#1089#1090#1086#1083#1073#1094#1086#1074':'
  end
  object Label3: TLabel
    Left = 10
    Top = 100
    Width = 78
    Height = 13
    Caption = #1042#1099#1088#1072#1074#1085#1080#1074#1072#1085#1080#1077':'
  end
  object Label4: TLabel
    Left = 10
    Top = 125
    Width = 95
    Height = 13
    Caption = #1058#1086#1083#1097#1080#1085#1072' '#1075#1088#1072#1085#1080#1094#1099':'
  end
  object Label5: TLabel
    Left = 10
    Top = 150
    Width = 61
    Height = 13
    Caption = #1055#1086#1083#1103' '#1103#1095#1077#1077#1082':'
  end
  object Label6: TLabel
    Left = 10
    Top = 175
    Width = 84
    Height = 13
    Caption = #1048#1085#1090#1088#1077#1074#1072#1083' '#1103#1095#1077#1077#1082':'
  end
  object OK: TcxButton
    Left = 182
    Top = 284
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 9
  end
  object Cancel: TcxButton
    Left = 262
    Top = 284
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 10
  end
  object Panel1: TPanel
    Left = 5
    Top = 5
    Width = 331
    Height = 16
    Alignment = taLeftJustify
    BevelOuter = bvNone
    BorderWidth = 2
    Caption = #1056#1072#1079#1084#1077#1088
    Color = 10857647
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
  end
  object Panel2: TPanel
    Left = 5
    Top = 75
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
    TabOrder = 12
  end
  object rows: TcxSpinEdit
    Left = 125
    Top = 25
    Width = 76
    Height = 21
    Properties.MaxValue = 255.000000000000000000
    Properties.MinValue = 1.000000000000000000
    TabOrder = 0
    Value = 2
  end
  object cols: TcxSpinEdit
    Left = 125
    Top = 50
    Width = 76
    Height = 21
    Properties.MaxValue = 255.000000000000000000
    Properties.MinValue = 1.000000000000000000
    TabOrder = 1
    Value = 2
  end
  object Panel3: TPanel
    Left = 5
    Top = 265
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
    TabOrder = 13
  end
  object align: TcxComboBox
    Left = 125
    Top = 95
    Width = 121
    Height = 21
    Properties.Items.Strings = (
      #1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
      #1087#1086' '#1083#1077#1074#1086#1084#1091' '#1082#1088#1072#1102
      #1087#1086' '#1087#1088#1072#1074#1086#1084#1091' '#1082#1088#1072#1102
      #1087#1086' '#1094#1077#1085#1090#1088#1091)
    TabOrder = 2
    Text = 'align'
  end
  object border: TcxSpinEdit
    Left = 125
    Top = 120
    Width = 76
    Height = 21
    Properties.MaxValue = 255.000000000000000000
    TabOrder = 3
    Value = 1
  end
  object cellpadding: TcxSpinEdit
    Left = 125
    Top = 145
    Width = 76
    Height = 21
    Properties.MaxValue = 255.000000000000000000
    TabOrder = 4
    Value = 1
  end
  object cellspacing: TcxSpinEdit
    Left = 125
    Top = 170
    Width = 76
    Height = 21
    Properties.MaxValue = 255.000000000000000000
    TabOrder = 5
    Value = 1
  end
  object Panel4: TPanel
    Left = 4
    Top = 195
    Width = 331
    Height = 16
    Alignment = taLeftJustify
    BevelOuter = bvNone
    BorderWidth = 2
    Caption = #1047#1072#1088#1084#1077#1088
    Color = 10857647
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 14
  end
  object UseWidth: TcxCheckBox
    Left = 5
    Top = 215
    Width = 121
    Height = 21
    ParentBackground = True
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1047#1072#1076#1072#1090#1100' '#1096#1080#1088#1080#1085#1091
    State = cbsChecked
    TabOrder = 6
  end
  object PercentWidth: TcxCheckBox
    Left = 5
    Top = 235
    Width = 121
    Height = 21
    ParentBackground = True
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1042' '#1087#1088#1086#1094#1077#1085#1090#1072#1093
    State = cbsChecked
    TabOrder = 7
  end
  object _width: TcxSpinEdit
    Left = 125
    Top = 215
    Width = 76
    Height = 21
    Properties.MaxValue = 255.000000000000000000
    Properties.MinValue = 1.000000000000000000
    TabOrder = 8
    Value = 100
  end
end
