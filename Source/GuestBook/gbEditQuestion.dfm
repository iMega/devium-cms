object EditQuestion: TEditQuestion
  Left = 390
  Top = 192
  ActiveControl = answer
  BorderStyle = bsDialog
  BorderWidth = 5
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1085#1072#1080#1077
  ClientHeight = 430
  ClientWidth = 375
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
    Left = 0
    Top = 20
    Width = 29
    Height = 13
    Caption = #1044#1072#1090#1072':'
    FocusControl = date
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 130
    Top = 20
    Width = 25
    Height = 13
    Caption = #1048#1084#1103':'
    FocusControl = author
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 0
    Top = 160
    Width = 40
    Height = 13
    Caption = #1042#1086#1087#1088#1086#1089':'
    FocusControl = question
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 0
    Top = 270
    Width = 33
    Height = 13
    Caption = #1054#1090#1074#1077#1090':'
    FocusControl = answer
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 255
    Top = 20
    Width = 28
    Height = 13
    Caption = 'E-mail'
    FocusControl = email
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 0
    Top = 60
    Width = 33
    Height = 13
    Caption = #1043#1086#1088#1086#1076':'
    FocusControl = city
  end
  object Label7: TLabel
    Left = 195
    Top = 60
    Width = 40
    Height = 13
    Caption = 'IP/Host:'
    FocusControl = ip
  end
  object Label8: TLabel
    Left = 0
    Top = 100
    Width = 84
    Height = 13
    Caption = 'Home Page URL:'
    FocusControl = homepage
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 375
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
    TabOrder = 10
  end
  object Panel2: TPanel
    Left = 0
    Top = 381
    Width = 376
    Height = 16
    Hint = 
      #1042#1099#1073#1088#1072#1085#1085#1099#1081' '#1096#1072#1073#1083#1086#1085' '#1073#1091#1076#1077#1090' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102#13#1074#1099#1089#1090#1072#1074#1083#1103#1090#1089#1103' '#1076#1083#1103' '#1082#1072#1078#1076#1086#1075#1086' '#1074#1085#1086#1074 +
      #1100#13#1089#1086#1079#1076#1072#1074#1072#1077#1084#1086#1075#1086' '#1088#1072#1079#1076#1077#1083#1072
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
    TabOrder = 11
  end
  object OK: TcxButton
    Left = 220
    Top = 405
    Width = 75
    Height = 25
    Action = ActionOK
    TabOrder = 8
  end
  object Cancel: TcxButton
    Left = 300
    Top = 405
    Width = 75
    Height = 25
    Action = ActionCancel
    Cancel = True
    TabOrder = 9
  end
  object date: TcxDBDateEdit
    Left = 0
    Top = 35
    Width = 126
    Height = 21
    DataBinding.DataSource = DM.dsGuestbook
    DataBinding.DataField = 'date'
    TabOrder = 0
  end
  object author: TcxDBTextEdit
    Left = 130
    Top = 35
    Width = 121
    Height = 21
    DataBinding.DataSource = DM.dsGuestbook
    DataBinding.DataField = 'author'
    TabOrder = 1
  end
  object email: TcxDBTextEdit
    Left = 255
    Top = 35
    Width = 121
    Height = 21
    DataBinding.DataSource = DM.dsGuestbook
    DataBinding.DataField = 'email'
    TabOrder = 2
  end
  object question: TcxDBMemo
    Left = 0
    Top = 175
    Width = 376
    Height = 89
    DataBinding.DataSource = DM.dsGuestbook
    DataBinding.DataField = 'question'
    Properties.ScrollBars = ssBoth
    Properties.WordWrap = False
    TabOrder = 6
  end
  object answer: TcxDBMemo
    Left = 0
    Top = 285
    Width = 376
    Height = 89
    DataBinding.DataSource = DM.dsGuestbook
    DataBinding.DataField = 'answer'
    Properties.ScrollBars = ssBoth
    Properties.WordWrap = False
    TabOrder = 7
  end
  object Panel3: TPanel
    Left = 0
    Top = 141
    Width = 376
    Height = 16
    Hint = 
      #1042#1099#1073#1088#1072#1085#1085#1099#1081' '#1096#1072#1073#1083#1086#1085' '#1073#1091#1076#1077#1090' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102#13#1074#1099#1089#1090#1072#1074#1083#1103#1090#1089#1103' '#1076#1083#1103' '#1082#1072#1078#1076#1086#1075#1086' '#1074#1085#1086#1074 +
      #1100#13#1089#1086#1079#1076#1072#1074#1072#1077#1084#1086#1075#1086' '#1088#1072#1079#1076#1077#1083#1072
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
    TabOrder = 12
  end
  object city: TcxDBTextEdit
    Left = 0
    Top = 75
    Width = 190
    Height = 21
    DataBinding.DataSource = DM.dsGuestbook
    DataBinding.DataField = 'city'
    TabOrder = 3
  end
  object ip: TcxDBTextEdit
    Left = 195
    Top = 75
    Width = 180
    Height = 21
    DataBinding.DataSource = DM.dsGuestbook
    DataBinding.DataField = 'ip'
    TabOrder = 4
  end
  object homepage: TcxDBTextEdit
    Left = 0
    Top = 115
    Width = 376
    Height = 21
    DataBinding.DataSource = DM.dsGuestbook
    DataBinding.DataField = 'homepage'
    TabOrder = 5
  end
  object ActionList: TActionList
    Left = 320
    Top = 200
    object ActionOK: TAction
      Caption = 'OK'
      ShortCut = 16397
      OnExecute = ActionOKExecute
    end
    object ActionCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = ActionCancelExecute
    end
  end
end
