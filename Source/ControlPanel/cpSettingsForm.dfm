object SettingsForm: TSettingsForm
  Left = 339
  Top = 245
  BorderStyle = bsDialog
  BorderWidth = 5
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1089#1086#1077#1076#1080#1085#1077#1085#1080#1103
  ClientHeight = 235
  ClientWidth = 470
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
    Left = 15
    Top = 25
    Width = 101
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '&URL:'
    FocusControl = HttpRoot
  end
  object Label2: TLabel
    Left = 16
    Top = 50
    Width = 100
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '&'#1055#1088#1077#1092#1080#1082#1089' '#1041#1044':'
    FocusControl = DataBasePrefix
  end
  object HttpProxy_label: TLabel
    Left = 16
    Top = 140
    Width = 100
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = #1055'&'#1088#1086#1082#1089#1080':'
    Enabled = False
    FocusControl = HttpProxy
  end
  object HttpProxyLogin_label: TLabel
    Left = 16
    Top = 165
    Width = 100
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '&'#1051#1086#1075#1080#1085'/'#1055#1072#1088#1086#1083#1100':'
    Enabled = False
    FocusControl = HttpProxyLogin
  end
  object Label3: TLabel
    Left = 16
    Top = 75
    Width = 100
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '&'#1051#1086#1075#1080#1085'/'#1055#1072#1088#1086#1083#1100':'
    FocusControl = HttpLogin
  end
  object OK: TcxButton
    Left = 315
    Top = 210
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 0
  end
  object Cancel: TcxButton
    Left = 395
    Top = 210
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 1
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 470
    Height = 16
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = 'WWW'
    Color = 10857647
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object HttpRoot: TcxTextEdit
    Left = 125
    Top = 20
    Width = 346
    Height = 21
    TabOrder = 3
    Text = 'HttpRoot'
  end
  object DataBasePrefix: TcxTextEdit
    Left = 125
    Top = 45
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'DataBasePrefix'
  end
  object HttpProxy: TcxTextEdit
    Left = 125
    Top = 135
    Width = 346
    Height = 21
    Enabled = False
    TabOrder = 5
    Text = 'HttpProxy'
  end
  object HttpProxyLogin: TcxTextEdit
    Left = 125
    Top = 160
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 6
    Text = 'HttpProxyLogin'
  end
  object HttpProxyPass: TcxTextEdit
    Left = 250
    Top = 160
    Width = 121
    Height = 21
    Enabled = False
    Properties.EchoMode = eemPassword
    Style.Shadow = False
    TabOrder = 7
    Text = 'HttpProxyPass'
  end
  object UseHttpProxy: TcxCheckBox
    Left = 120
    Top = 115
    Width = 181
    Height = 21
    ParentBackground = True
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = '&'#1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' Proxy'
    TabOrder = 8
  end
  object Panel3: TPanel
    Left = 0
    Top = 186
    Width = 470
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
    TabOrder = 9
  end
  object Panel1: TPanel
    Left = 0
    Top = 96
    Width = 470
    Height = 16
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = #1055#1088#1086#1082#1089#1080
    Color = 10857647
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
  end
  object HttpLogin: TcxTextEdit
    Left = 125
    Top = 70
    Width = 121
    Height = 21
    TabOrder = 11
    Text = 'HttpLogin'
  end
  object HttpPass: TcxTextEdit
    Left = 250
    Top = 70
    Width = 121
    Height = 21
    Properties.EchoMode = eemPassword
    Style.Shadow = False
    TabOrder = 12
    Text = 'HttpPass'
  end
end
