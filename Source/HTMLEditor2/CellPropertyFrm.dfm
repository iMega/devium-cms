object CellPropertyForm: TCellPropertyForm
  Left = 345
  Top = 213
  BorderStyle = bsDialog
  BorderWidth = 5
  Caption = #1057#1074#1086#1081#1089#1090#1074#1072' '#1103#1095#1077#1081#1082#1080
  ClientHeight = 345
  ClientWidth = 350
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
  object Label2: TLabel
    Left = 10
    Top = 25
    Width = 160
    Height = 13
    Caption = #1042#1099#1088#1072#1074#1085#1080#1074#1072#1085#1080#1077' '#1087#1086' '#1075#1086#1088#1080#1079#1086#1085#1090#1072#1083#1080':'
  end
  object Label3: TLabel
    Left = 10
    Top = 50
    Width = 149
    Height = 13
    Caption = #1042#1099#1088#1072#1074#1085#1080#1074#1072#1085#1080#1077' '#1087#1086' '#1074#1077#1088#1090#1080#1082#1072#1083#1080':'
  end
  object Label1: TLabel
    Left = 35
    Top = 250
    Width = 104
    Height = 13
    Caption = #1054#1073#1098#1077#1076#1080#1085#1077#1085#1080#1077' '#1089#1090#1088#1086#1082':'
  end
  object Label4: TLabel
    Left = 35
    Top = 275
    Width = 122
    Height = 13
    Caption = #1054#1073#1098#1077#1076#1080#1085#1077#1085#1080#1077' '#1089#1090#1086#1083#1073#1094#1086#1074':'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 350
    Height = 16
    Align = alTop
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
    TabOrder = 0
  end
  object align: TcxComboBox
    Left = 180
    Top = 20
    Width = 121
    Height = 21
    Properties.DropDownListStyle = lsFixedList
    Properties.Items.Strings = (
      #1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
      #1087#1086' '#1083#1077#1074#1086#1084#1091' '#1082#1088#1072#1102
      #1087#1086' '#1087#1088#1072#1074#1086#1084#1091' '#1082#1088#1072#1102
      #1087#1086' '#1094#1077#1085#1090#1088#1091
      #1087#1086' '#1096#1080#1088#1080#1085#1077)
    TabOrder = 1
    Text = #1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
  end
  object valign: TcxComboBox
    Left = 180
    Top = 45
    Width = 121
    Height = 21
    Properties.DropDownListStyle = lsFixedList
    Properties.Items.Strings = (
      #1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
      #1087#1086' '#1074#1077#1088#1085#1077#1084#1091' '#1082#1088#1072#1102
      #1087#1086' '#1089#1077#1088#1077#1076#1080#1085#1077
      #1087#1086' '#1085#1080#1078#1085#1080#1084#1091' '#1082#1088#1072#1102)
    TabOrder = 2
    Text = #1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
  end
  object UseHeight: TcxCheckBox
    Left = 30
    Top = 115
    Width = 121
    Height = 21
    ParentBackground = True
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1047#1072#1076#1072#1090#1100' '#1074#1099#1089#1086#1090#1091':'
    TabOrder = 3
  end
  object Panel4: TPanel
    Left = 25
    Top = 95
    Width = 326
    Height = 16
    Alignment = taLeftJustify
    BevelOuter = bvNone
    BorderWidth = 2
    Caption = #1042#1099#1089#1086#1090#1072':'
    Color = 10857647
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object Panel5: TPanel
    Left = 25
    Top = 160
    Width = 326
    Height = 16
    Alignment = taLeftJustify
    BevelOuter = bvNone
    BorderWidth = 2
    Caption = #1064#1080#1088#1080#1085#1072':'
    Color = 10857647
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object UseWidth: TcxCheckBox
    Left = 30
    Top = 180
    Width = 121
    Height = 21
    ParentBackground = True
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1047#1072#1076#1072#1090#1100' '#1096#1080#1088#1080#1085#1091':'
    TabOrder = 6
  end
  object PercentHeight: TcxCheckBox
    Left = 30
    Top = 130
    Width = 121
    Height = 21
    ParentBackground = True
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1042' '#1087#1088#1086#1094#1077#1085#1090#1072#1093
    TabOrder = 7
  end
  object PercentWidth: TcxCheckBox
    Left = 30
    Top = 195
    Width = 121
    Height = 21
    ParentBackground = True
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1042' '#1087#1088#1086#1094#1077#1085#1090#1072#1093
    TabOrder = 8
  end
  object _height: TcxSpinEdit
    Left = 155
    Top = 115
    Width = 71
    Height = 21
    Properties.MaxValue = 255.000000000000000000
    TabOrder = 9
  end
  object _width: TcxSpinEdit
    Left = 155
    Top = 180
    Width = 71
    Height = 21
    Properties.MaxValue = 255.000000000000000000
    TabOrder = 10
  end
  object Panel6: TPanel
    Left = 0
    Top = 300
    Width = 351
    Height = 16
    Alignment = taLeftJustify
    BevelOuter = bvNone
    BorderWidth = 2
    Color = 10857647
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
  end
  object OK: TcxButton
    Left = 195
    Top = 320
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 12
  end
  object Cancel: TcxButton
    Left = 275
    Top = 320
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 13
  end
  object nowrap: TcxCheckBox
    Left = 175
    Top = 65
    Width = 166
    Height = 21
    ParentBackground = True
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1053#1077' '#1087#1077#1088#1077#1085#1086#1089#1080#1090#1100' '#1089#1083#1086#1074#1072
    TabOrder = 14
  end
  object Panel2: TPanel
    Left = 25
    Top = 225
    Width = 326
    Height = 16
    Alignment = taLeftJustify
    BevelOuter = bvNone
    BorderWidth = 2
    Caption = #1054#1073#1098#1077#1076#1077#1085#1077#1085#1080#1103':'
    Color = 10857647
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 15
  end
  object rowSpan: TcxSpinEdit
    Left = 160
    Top = 245
    Width = 66
    Height = 21
    TabOrder = 16
  end
  object colSpan: TcxSpinEdit
    Left = 160
    Top = 270
    Width = 66
    Height = 21
    TabOrder = 17
  end
end
