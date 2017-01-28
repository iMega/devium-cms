object UListPropertyForm: TUListPropertyForm
  Left = 365
  Top = 228
  BorderStyle = bsDialog
  BorderWidth = 5
  Caption = #1057#1074#1086#1081#1089#1090#1074#1072' '#1089#1087#1080#1089#1082#1072
  ClientHeight = 130
  ClientWidth = 260
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
  object OK: TcxButton
    Left = 105
    Top = 105
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 3
  end
  object Cancel: TcxButton
    Left = 185
    Top = 105
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 4
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 260
    Height = 16
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    BorderWidth = 2
    Caption = #1054#1073#1099#1095#1085#1099#1077' '#1084#1072#1088#1082#1077#1088#1099
    Color = 10857647
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object cxRadioButton6: TcxRadioButton
    Left = 0
    Top = 20
    Width = 250
    Height = 17
    Caption = #1047#1072#1082#1088#1072#1096#1077#1085#1099#1081' '#1082#1088#1091#1075' ('#1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102')'
    Checked = True
    TabOrder = 0
    TabStop = True
  end
  object cxRadioButton7: TcxRadioButton
    Left = 0
    Top = 40
    Width = 250
    Height = 17
    Caption = #1053#1077#1079#1072#1082#1088#1072#1096#1077#1085#1099#1081' '#1082#1088#1091#1075
    TabOrder = 1
  end
  object cxRadioButton8: TcxRadioButton
    Left = 0
    Top = 60
    Width = 250
    Height = 17
    Caption = #1055#1088#1103#1084#1086#1091#1075#1086#1083#1100#1085#1080#1082
    TabOrder = 2
  end
  object Panel4: TPanel
    Left = 0
    Top = 85
    Width = 260
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
    TabOrder = 6
  end
end
