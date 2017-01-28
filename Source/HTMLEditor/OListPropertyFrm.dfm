object OListPropertyForm: TOListPropertyForm
  Left = 412
  Top = 240
  BorderStyle = bsDialog
  BorderWidth = 5
  Caption = #1057#1074#1086#1081#1089#1090#1074#1072' '#1089#1087#1080#1089#1082#1072
  ClientHeight = 219
  ClientWidth = 250
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
    Left = 5
    Top = 150
    Width = 48
    Height = 13
    Caption = #1053#1072#1095#1072#1090#1100' '#1089':'
  end
  object OK: TcxButton
    Left = 95
    Top = 194
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 6
  end
  object Cancel: TcxButton
    Left = 175
    Top = 194
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 7
  end
  object cxRadioButton1: TcxRadioButton
    Left = 0
    Top = 20
    Width = 250
    Height = 17
    Caption = '1, 2, 3, ... ('#1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102')'
    Checked = True
    TabOrder = 0
    TabStop = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 250
    Height = 16
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    BorderWidth = 2
    Caption = #1053#1091#1084#1077#1088#1072#1094#1080#1103
    Color = 10857647
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
  end
  object cxRadioButton2: TcxRadioButton
    Left = 0
    Top = 40
    Width = 250
    Height = 17
    Caption = 'a, b, c, ...'
    TabOrder = 1
  end
  object cxRadioButton3: TcxRadioButton
    Left = 0
    Top = 60
    Width = 250
    Height = 17
    Caption = 'A, B, C, ...'
    TabOrder = 2
  end
  object cxRadioButton4: TcxRadioButton
    Left = 0
    Top = 80
    Width = 250
    Height = 17
    Caption = 'i, ii, iii, ...'
    TabOrder = 3
  end
  object cxRadioButton5: TcxRadioButton
    Left = 0
    Top = 100
    Width = 250
    Height = 17
    Caption = 'I, II, III, ...'
    TabOrder = 4
  end
  object Panel3: TPanel
    Left = 0
    Top = 125
    Width = 250
    Height = 16
    Alignment = taLeftJustify
    BevelOuter = bvNone
    BorderWidth = 2
    Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
    Color = 10857647
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
  end
  object Start: TcxSpinEdit
    Left = 65
    Top = 145
    Width = 121
    Height = 21
    Properties.MaxValue = 1000000.000000000000000000
    Properties.MinValue = 1.000000000000000000
    TabOrder = 5
    Value = 1
  end
  object Panel4: TPanel
    Left = 0
    Top = 170
    Width = 250
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
    TabOrder = 10
  end
end
