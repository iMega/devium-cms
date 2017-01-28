object frmResize: TfrmResize
  Left = 357
  Top = 127
  BorderStyle = bsDialog
  BorderWidth = 5
  Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1088#1072#1079#1084#1077#1088#1086#1074' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1103
  ClientHeight = 186
  ClientWidth = 276
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 62
    Width = 85
    Height = 13
    Caption = #1042#1099#1089#1086#1090#1072' '#1088#1080#1089#1091#1085#1082#1072':'
  end
  object Label2: TLabel
    Left = 16
    Top = 29
    Width = 86
    Height = 13
    Caption = #1064#1080#1088#1080#1085#1072' '#1088#1080#1089#1091#1085#1082#1072':'
  end
  object Label3: TLabel
    Left = 16
    Top = 93
    Width = 35
    Height = 13
    Caption = #1052#1077#1090#1086#1076':'
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 276
    Height = 16
    Align = alTop
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
  object Panel1: TPanel
    Left = 0
    Top = 136
    Width = 273
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
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object cxComboBox1: TcxComboBox
    Left = 112
    Top = 88
    Width = 121
    Height = 21
    Properties.Items.Strings = (
      #1054#1073#1099#1095#1085#1099#1081
      #1041#1080#1083#1080#1085#1077#1081#1085#1099#1081)
    TabOrder = 2
  end
  object OK: TcxButton
    Left = 111
    Top = 160
    Width = 75
    Height = 25
    Action = ActionOK
    TabOrder = 3
  end
  object Cancel: TcxButton
    Left = 198
    Top = 160
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 4
  end
  object CheckBox1: TcxCheckBox
    Left = 64
    Top = 112
    Width = 137
    Height = 21
    ParentBackground = True
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1057#1086#1093#1088#1072#1085#1103#1090#1100' '#1087#1088#1086#1087#1086#1088#1094#1080#1080
    State = cbsChecked
    Style.Shadow = False
    TabOrder = 5
  end
  object EditWidth: TcxSpinEdit
    Left = 112
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 6
    OnKeyUp = EditWidthKeyUp
  end
  object EditHeight: TcxSpinEdit
    Left = 112
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 7
    OnKeyUp = EditHeightKeyUp
  end
  object ActionList1: TActionList
    Left = 37
    Top = 153
    object ActionOK: TAction
      Caption = 'OK'
      ShortCut = 16397
      OnExecute = ActionOKExecute
    end
  end
end
