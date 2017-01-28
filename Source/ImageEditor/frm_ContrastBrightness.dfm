object frmContrastBrightness: TfrmContrastBrightness
  Left = 247
  Top = 107
  BorderStyle = bsDialog
  BorderWidth = 5
  Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1103#1088#1082#1086#1089#1090#1080' '#1080' '#1082#1086#1085#1090#1088#1072#1089#1090#1072
  ClientHeight = 313
  ClientWidth = 309
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 2
    Width = 43
    Height = 13
    Caption = #1071#1088#1082#1086#1089#1090#1100
  end
  object Label2: TLabel
    Left = 8
    Top = 68
    Width = 47
    Height = 13
    Caption = #1050#1086#1085#1090#1088#1072#1089#1090
  end
  object Panel1: TPanel
    Left = 0
    Top = 128
    Width = 150
    Height = 130
    BevelOuter = bvNone
    BorderWidth = 1
    TabOrder = 0
    object ImageOrig: TImage
      Left = 1
      Top = 1
      Width = 148
      Height = 128
      Align = alClient
      Center = True
      Proportional = True
    end
  end
  object Panel2: TPanel
    Left = 158
    Top = 128
    Width = 150
    Height = 130
    BevelOuter = bvNone
    BorderWidth = 1
    TabOrder = 1
    object Image: TImage
      Left = 1
      Top = 1
      Width = 148
      Height = 128
      Align = alClient
      Center = True
      Proportional = True
    end
  end
  object RzTrackBar1: TRzTrackBar
    Left = 8
    Top = 22
    Width = 289
    Height = 40
    Max = 127
    Min = -127
    Position = 0
    TickStep = 10
    OnChange = RzTrackBar1Change
    TabOrder = 2
  end
  object cxSpinEdit1: TcxSpinEdit
    Left = 231
    Top = 0
    Width = 65
    Height = 21
    Properties.MaxValue = 127.000000000000000000
    Properties.MinValue = -127.000000000000000000
    TabOrder = 3
    OnClick = cxSpinEdit1Click
  end
  object Panel4: TPanel
    Left = 0
    Top = 263
    Width = 309
    Height = 16
    Align = alBottom
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
    TabOrder = 4
  end
  object RzTrackBar2: TRzTrackBar
    Left = 8
    Top = 84
    Width = 289
    Height = 40
    Max = 127
    Min = -127
    Position = 0
    TickStep = 10
    OnChange = RzTrackBar2Change
    TabOrder = 5
  end
  object cxSpinEdit2: TcxSpinEdit
    Left = 231
    Top = 62
    Width = 65
    Height = 21
    Properties.MaxValue = 127.000000000000000000
    Properties.MinValue = -127.000000000000000000
    TabOrder = 6
    OnClick = cxSpinEdit2Click
  end
  object Panel5: TPanel
    Left = 0
    Top = 279
    Width = 309
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 7
    object mbOk: TcxButton
      Left = 137
      Top = 8
      Width = 75
      Height = 25
      Action = ActionOk
      TabOrder = 0
    end
    object mbCancel: TcxButton
      Left = 228
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
  end
  object ActionList1: TActionList
    Left = 8
    Top = 280
    object ActionOk: TAction
      Caption = 'Ok'
      OnExecute = ActionOkExecute
    end
  end
end
