object ConfigForm: TConfigForm
  Left = 419
  Top = 314
  BorderStyle = bsDialog
  BorderWidth = 5
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103
  ClientHeight = 134
  ClientWidth = 300
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    300
    134)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 0
    Top = 20
    Width = 101
    Height = 13
    Caption = #1052#1072#1083#1077#1085#1100#1082#1080#1081' '#1088#1072#1079#1084#1077#1088':'
  end
  object Label3: TLabel
    Left = 150
    Top = 20
    Width = 89
    Height = 13
    Caption = #1041#1086#1083#1100#1096#1086#1081' '#1088#1072#1079#1084#1077#1088':'
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 300
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
  object SmallSize: TcxComboBox
    Left = 0
    Top = 35
    Width = 150
    Height = 21
    Properties.DropDownListStyle = lsFixedList
    Properties.Items.Strings = (
      '80'
      '100'
      '150')
    TabOrder = 1
  end
  object BigSize: TcxComboBox
    Left = 150
    Top = 35
    Width = 150
    Height = 21
    Properties.DropDownListStyle = lsFixedList
    Properties.Items.Strings = (
      '640'
      '800'
      '1024')
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 0
    Top = 85
    Width = 300
    Height = 16
    Alignment = taLeftJustify
    Anchors = [akRight, akBottom]
    BevelOuter = bvNone
    Color = 10857647
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object OK: TcxButton
    Left = 145
    Top = 109
    Width = 75
    Height = 25
    Action = ActionOK
    Anchors = [akRight, akBottom]
    TabOrder = 4
  end
  object Cancel: TcxButton
    Left = 225
    Top = 109
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 5
  end
  object CenterCrop: TcxCheckBox
    Left = 0
    Top = 60
    Width = 291
    Height = 21
    ParentBackground = True
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1054#1073#1088#1077#1079#1072#1090#1100' '#1086#1090' '#1094#1077#1085#1090#1088#1072
    TabOrder = 6
  end
  object ActionList: TActionList
    Left = 55
    Top = 105
    object ActionOK: TAction
      Caption = 'OK'
      ShortCut = 16397
      OnExecute = ActionOKExecute
    end
  end
end
