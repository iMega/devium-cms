object frmBlur: TfrmBlur
  Left = 289
  Top = 157
  BorderStyle = bsDialog
  BorderWidth = 5
  Caption = #1056#1072#1079#1084#1099#1090#1080#1077' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1103
  ClientHeight = 312
  ClientWidth = 262
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
    Left = 5
    Top = 3
    Width = 52
    Height = 13
    Caption = #1056#1072#1079#1084#1099#1090#1080#1077
  end
  object Label2: TLabel
    Left = 5
    Top = 67
    Width = 48
    Height = 13
    Caption = #1056#1077#1079#1082#1086#1089#1090#1100
  end
  object Panel1: TPanel
    Left = 54
    Top = 128
    Width = 150
    Height = 130
    BevelOuter = bvNone
    BorderWidth = 1
    TabOrder = 0
    object PreViewImage: TImage
      Left = 1
      Top = 1
      Width = 148
      Height = 128
      Align = alClient
      Center = True
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 263
    Width = 262
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
    TabOrder = 1
  end
  object tbBlur: TRzTrackBar
    Left = 0
    Top = 22
    Width = 262
    Height = 40
    Position = 0
    OnChange = tbBlurChange
    TabOrder = 2
  end
  object seBlur: TcxSpinEdit
    Left = 196
    Top = -1
    Width = 65
    Height = 21
    Properties.MaxValue = 10.000000000000000000
    TabOrder = 3
    OnClick = seBlurClick
  end
  object Panel2: TPanel
    Left = 0
    Top = 279
    Width = 262
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    object mbCancel: TcxButton
      Left = 184
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 0
    end
    object mbOk: TcxButton
      Left = 96
      Top = 8
      Width = 75
      Height = 25
      Action = ActionOk
      TabOrder = 1
    end
  end
  object tbSharpen: TRzTrackBar
    Left = 0
    Top = 86
    Width = 262
    Height = 40
    Max = 100
    Position = 0
    TickStep = 5
    OnChange = tbSharpenChange
    TabOrder = 5
  end
  object seSharpen: TcxSpinEdit
    Left = 196
    Top = 63
    Width = 65
    Height = 21
    TabOrder = 6
    OnClick = seSharpenClick
  end
  object ActionList1: TActionList
    Left = 208
    Top = 136
    object ActionOk: TAction
      Caption = 'Ok'
      OnExecute = ActionOkExecute
    end
  end
end
