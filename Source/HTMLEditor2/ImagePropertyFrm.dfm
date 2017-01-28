object ImagePropertyForm: TImagePropertyForm
  Left = 438
  Top = 170
  BorderStyle = bsDialog
  BorderWidth = 5
  Caption = #1057#1074#1086#1081#1089#1090#1074#1072' '#1088#1080#1089#1091#1085#1082#1072
  ClientHeight = 359
  ClientWidth = 463
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
    Left = 185
    Top = 225
    Width = 42
    Height = 13
    Caption = #1064#1080#1088#1080#1085#1072':'
  end
  object Label2: TLabel
    Left = 305
    Top = 225
    Width = 41
    Height = 13
    Caption = #1042#1099#1089#1086#1090#1072':'
  end
  object Label3: TLabel
    Left = 5
    Top = 25
    Width = 95
    Height = 13
    Caption = #1048#1089#1090#1086#1095#1085#1080#1082' '#1088#1080#1089#1091#1085#1082#1072':'
  end
  object Label4: TLabel
    Left = 5
    Top = 65
    Width = 33
    Height = 13
    Caption = #1058#1077#1082#1089#1090':'
  end
  object Label6: TLabel
    Left = 200
    Top = 150
    Width = 134
    Height = 13
    Caption = #1048#1085#1090#1077#1088#1074#1072#1083' '#1087#1086' '#1075#1086#1088#1080#1079#1086#1085#1090#1072#1083#1080':'
  end
  object Label8: TLabel
    Left = 200
    Top = 175
    Width = 123
    Height = 13
    Caption = #1048#1085#1090#1077#1088#1074#1072#1083' '#1087#1086' '#1074#1077#1088#1090#1080#1082#1072#1083#1080':'
  end
  object Label9: TLabel
    Left = 5
    Top = 175
    Width = 95
    Height = 13
    Caption = #1058#1086#1083#1097#1080#1085#1072' '#1075#1088#1072#1085#1080#1094#1099':'
  end
  object Label10: TLabel
    Left = 5
    Top = 130
    Width = 78
    Height = 13
    Caption = #1042#1099#1088#1072#1074#1085#1080#1074#1072#1085#1080#1077':'
  end
  object Label5: TLabel
    Left = 5
    Top = 270
    Width = 25
    Height = 13
    Caption = 'URL:'
  end
  object src: TcxButtonEdit
    Left = 5
    Top = 40
    Width = 371
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = SourcePropertiesButtonClick
    TabOrder = 0
    Text = 'src'
  end
  object cxButton1: TcxButton
    Left = 385
    Top = 40
    Width = 75
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100'...'
    Enabled = False
    TabOrder = 1
  end
  object alt: TcxTextEdit
    Left = 5
    Top = 80
    Width = 456
    Height = 21
    TabOrder = 2
    Text = 'alt'
  end
  object AWidth: TcxSpinEdit
    Left = 235
    Top = 220
    Width = 61
    Height = 21
    Properties.MaxValue = 3000.000000000000000000
    TabOrder = 3
  end
  object AHeigth: TcxSpinEdit
    Left = 355
    Top = 220
    Width = 61
    Height = 21
    Properties.MaxValue = 3000.000000000000000000
    TabOrder = 4
  end
  object vspace: TcxSpinEdit
    Left = 355
    Top = 145
    Width = 61
    Height = 21
    Properties.MaxValue = 255.000000000000000000
    TabOrder = 5
  end
  object HSpace: TcxSpinEdit
    Left = 355
    Top = 170
    Width = 61
    Height = 21
    Properties.MaxValue = 255.000000000000000000
    TabOrder = 6
  end
  object Border: TcxSpinEdit
    Left = 125
    Top = 170
    Width = 61
    Height = 21
    Properties.MaxValue = 255.000000000000000000
    TabOrder = 7
  end
  object Align: TcxComboBox
    Left = 5
    Top = 145
    Width = 181
    Height = 21
    Properties.DropDownListStyle = lsFixedList
    Properties.Items.Strings = (
      #1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
      #1087#1086' '#1083#1077#1074#1086#1084#1091' '#1082#1088#1072#1102
      #1087#1086' '#1087#1088#1072#1074#1086#1084#1091' '#1082#1088#1072#1102
      #1087#1086' '#1074#1077#1088#1093#1085#1077#1084#1091' '#1082#1088#1072#1102
      #1087#1086' '#1089#1077#1088#1077#1076#1080#1085#1077
      #1087#1086' '#1085#1080#1078#1085#1077#1084#1091' '#1082#1088#1072#1102
      #1087#1086' '#1094#1077#1085#1090#1088#1091)
    TabOrder = 8
  end
  object Cancel: TcxButton
    Left = 388
    Top = 333
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 10
  end
  object OK: TcxButton
    Left = 310
    Top = 333
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 9
  end
  object Panel3: TPanel
    Left = 0
    Top = 110
    Width = 466
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
    TabOrder = 11
  end
  object Panel4: TPanel
    Left = 0
    Top = 195
    Width = 466
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
    TabOrder = 12
  end
  object SizePropo: TcxCheckBox
    Left = 5
    Top = 220
    Width = 156
    Height = 21
    ParentBackground = True
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1057#1086#1093#1088#1072#1085#1103#1090#1100' '#1087#1088#1086#1087#1086#1088#1094#1080#1080
    State = cbsChecked
    TabOrder = 13
  end
  object Panel5: TPanel
    Left = 0
    Top = 250
    Width = 461
    Height = 16
    Alignment = taLeftJustify
    BevelOuter = bvNone
    BorderWidth = 2
    Caption = #1043#1080#1087#1077#1088#1089#1089#1099#1083#1082#1072
    Color = 10857647
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 14
  end
  object Panel6: TPanel
    Left = 0
    Top = 0
    Width = 463
    Height = 16
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    BorderWidth = 2
    Caption = #1054#1073#1097#1080#1077
    Color = 10857647
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 15
  end
  object Panel7: TPanel
    Left = 0
    Top = 313
    Width = 466
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
    TabOrder = 16
  end
  object href: TcxButtonEdit
    Left = 5
    Top = 285
    Width = 456
    Height = 21
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 17
    Text = 'href'
  end
  object CalcImageSize: TcxButton
    Left = 425
    Top = 220
    Width = 21
    Height = 21
    TabOrder = 18
    OnClick = CalcImageSizeClick
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FF0B80C30B80C30B80C30B80C30B80C30B80C30B
      80C30B80C30B80C30B80C30B80C30B80C30B80C3FF00FFFF00FFFF00FF0B80C3
      C3F1FFC3F1FFC3F1FFC3F1FFC3F1FFC3F1FFC3F1FFC3F1FFC3F1FFC3F1FFC3F1
      FF0B80C3FF00FFFF00FFFF00FF0B80C3C3F1FF0B80C36BDDFF0B80C36BDDFF0B
      80C36BDDFF0B80C36BDDFF0B80C3C3F1FF0B80C3FF00FFFF00FFFF00FF0B80C3
      C3F1FF6BDDFFFFFFFF6BDDFFFFFFFF6BDDFFFFFFFF6BDDFFFFFFFF6BDDFFC3F1
      FF0B80C3FF00FFFF00FFFF00FF0B80C3C3F1FF0B80C36BDDFF0B80C36BDDFF0B
      80C36BDDFF0B80C36BDDFF0B80C3C3F1FF0B80C3FF00FFFF00FFFF00FF0B80C3
      C3F1FF6BDDFFFFFFFF6BDDFFFFFFFF6BDDFFFFFFFF6BDDFFFFFFFF6BDDFFC3F1
      FF0B80C3FF00FFFF00FFFF00FF0B80C3C3F1FF0B80C36BDDFF0B80C36BDDFF0B
      80C36BDDFF0B80C36BDDFF0B80C3C3F1FF0B80C3FF00FFFF00FFFF00FF0B80C3
      C3F1FF6BDDFFFFFFFF6BDDFFFFFFFF6BDDFFFFFFFF6BDDFFFFFFFF6BDDFFC3F1
      FF0B80C3FF00FFFF00FFFF00FF0B80C3C3F1FFC3F1FFC3F1FFC3F1FFC3F1FFC3
      F1FFC3F1FFC3F1FFC3F1FFC3F1FFC3F1FF0B80C3FF00FFFF00FFFF00FF0B80C3
      C3F1FF0B80C30B80C30B80C30B80C30B80C30B80C30B80C30B80C30B80C3C9F2
      FF0B80C3FF00FFFF00FFFF00FF0B80C3C3F1FF0B80C3FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF0B80C3C6F2FF0B80C3FF00FFFF00FFFF00FF0B80C3
      C3F1FF0B80C30B80C30B80C30B80C30B80C30B80C30B80C30B80C30B80C3C4F1
      FF0B80C3FF00FFFF00FFFF00FF0B80C3C3F1FFC3F1FFC3F1FFC3F1FFC3F1FFC3
      F1FFC3F1FFC3F1FFC3F1FFC3F1FFC3F1FF0B80C3FF00FFFF00FFFF00FF0B80C3
      0B80C30B80C30B80C30B80C30B80C30B80C30B80C30B80C30B80C30B80C30B80
      C30B80C3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    LookAndFeel.Kind = lfUltraFlat
    UseSystemPaint = False
  end
  object OpenPictureDialog: TOpenPictureDialog
    OptionsEx = [ofExNoPlacesBar]
    Left = 425
    Top = 20
  end
end
