object ProgressCopyForm: TProgressCopyForm
  Left = 427
  Top = 283
  BorderStyle = bsDialog
  BorderWidth = 5
  Caption = #1054#1073#1084#1077#1085' '#1092#1072#1081#1083#1072#1084#1080
  ClientHeight = 145
  ClientWidth = 400
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 65
    Width = 88
    Height = 13
    Caption = #1054#1073#1097#1080#1081' '#1087#1088#1086#1075#1088#1077#1089#1089':'
  end
  object lbAction: TLabel
    Left = 0
    Top = 110
    Width = 117
    Height = 13
    Caption = #1044#1077#1081#1089#1090#1074#1080#1077' '#1080' '#1080#1084#1103' '#1092#1072#1081#1083#1072
  end
  object Cancel: TcxButton
    Left = 325
    Top = 120
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 0
    OnClick = CancelClick
  end
  object pbCurrent: TProgressBar
    Left = 0
    Top = 125
    Width = 311
    Height = 17
    TabOrder = 1
  end
  object Animate: TAnimate
    Left = 0
    Top = 0
    Width = 272
    Height = 60
    CommonAVI = aviCopyFile
    StopFrame = 20
  end
  object pbMain: TProgressBar
    Left = 0
    Top = 85
    Width = 311
    Height = 17
    Step = 1
    TabOrder = 3
  end
  object AntiFreeze: TIdAntiFreeze
    OnlyWhenIdle = False
    Left = 350
    Top = 15
  end
  object HTTP: TIdHTTP
    MaxLineAction = maException
    OnWork = HTTPWork
    OnWorkBegin = HTTPWorkBegin
    OnWorkEnd = HTTPWorkEnd
    AllowCookies = False
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = []
    Left = 355
    Top = 50
  end
  object IdLogFile: TIdLogFile
    ReplaceCRLF = False
    Filename = 'upload.log'
    Left = 304
    Top = 16
  end
end
