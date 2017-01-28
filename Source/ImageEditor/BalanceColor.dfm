object frmBalanceColor: TfrmBalanceColor
  Left = 291
  Top = 109
  BorderStyle = bsDialog
  BorderWidth = 5
  Caption = #1041#1072#1083#1072#1085#1089' '#1094#1074#1077#1090#1086#1074
  ClientHeight = 325
  ClientWidth = 351
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
    Left = 295
    Top = 44
    Width = 48
    Height = 13
    Caption = #1050#1088#1072#1089#1085#1099#1081':'
  end
  object Label2: TLabel
    Left = 295
    Top = 79
    Width = 48
    Height = 13
    Caption = #1047#1077#1083#1077#1085#1099#1081':'
  end
  object Label3: TLabel
    Left = 295
    Top = 114
    Width = 34
    Height = 13
    Caption = #1057#1080#1085#1080#1081':'
  end
  object Label4: TLabel
    Left = 5
    Top = 4
    Width = 73
    Height = 13
    Caption = #1059#1088#1086#1074#1085#1080' '#1094#1074#1077#1090#1072':'
  end
  object Label5: TLabel
    Left = 5
    Top = 114
    Width = 42
    Height = 13
    Caption = #1046#1077#1083#1090#1099#1081
  end
  object Label6: TLabel
    Left = 5
    Top = 79
    Width = 48
    Height = 13
    Caption = #1052#1072#1083#1080#1085#1086#1074'.'
  end
  object Label7: TLabel
    Left = 5
    Top = 44
    Width = 41
    Height = 13
    Caption = #1043#1086#1083#1091#1073#1086#1081
  end
  object Panel1: TPanel
    Left = 177
    Top = 145
    Width = 150
    Height = 130
    BevelOuter = bvNone
    BorderWidth = 1
    TabOrder = 0
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
  object tbRed: TRzTrackBar
    Left = 60
    Top = 29
    Width = 227
    HighlightColor = clRed
    Max = 127
    Min = -127
    Position = 0
    TickStep = 10
    OnChange = tbRedChange
    TabOrder = 1
  end
  object tbGreen: TRzTrackBar
    Left = 60
    Top = 64
    Width = 227
    HighlightColor = clGreen
    Max = 127
    Min = -127
    Position = 0
    TickStep = 10
    OnChange = tbGreenChange
    TabOrder = 2
  end
  object tbBlue: TRzTrackBar
    Left = 60
    Top = 99
    Width = 227
    Max = 127
    Min = -127
    Position = 0
    TickStep = 10
    OnChange = tbBlueChange
    TabOrder = 3
  end
  object Panel3: TPanel
    Left = 0
    Top = 280
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
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object OK: TcxButton
    Left = 191
    Top = 300
    Width = 75
    Height = 25
    Action = ActionOK
    TabOrder = 5
  end
  object Cancel: TcxButton
    Left = 271
    Top = 300
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 6
  end
  object cxSpinEdit1: TcxSpinEdit
    Left = 85
    Top = -1
    Width = 56
    Height = 21
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.MaxValue = 127.000000000000000000
    Properties.MinValue = -127.000000000000000000
    Properties.OnChange = cxSpinEdit1PropertiesChange
    TabOrder = 7
  end
  object cxSpinEdit2: TcxSpinEdit
    Left = 145
    Top = -1
    Width = 56
    Height = 21
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.MaxValue = 127.000000000000000000
    Properties.MinValue = -127.000000000000000000
    Properties.OnChange = cxSpinEdit2PropertiesChange
    TabOrder = 8
  end
  object cxSpinEdit3: TcxSpinEdit
    Left = 205
    Top = -1
    Width = 56
    Height = 21
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.MaxValue = 127.000000000000000000
    Properties.MinValue = -127.000000000000000000
    Properties.OnChange = cxSpinEdit3PropertiesChange
    TabOrder = 9
  end
  object Panel4: TPanel
    Left = 20
    Top = 144
    Width = 150
    Height = 130
    BevelOuter = bvNone
    BorderWidth = 1
    TabOrder = 10
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
  object ActionList1: TActionList
    Left = 138
    Top = 296
    object ActionOK: TAction
      Caption = 'OK'
      ShortCut = 16397
      OnExecute = ActionOKExecute
    end
  end
end
