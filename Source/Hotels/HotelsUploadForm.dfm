object UploadForm: TUploadForm
  Left = 391
  Top = 290
  BorderStyle = bsDialog
  BorderWidth = 5
  Caption = #1057#1080#1085#1093#1088#1086#1085#1080#1079#1072#1094#1080#1103' '#1092#1072#1083#1086#1074
  ClientHeight = 112
  ClientWidth = 303
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
  object pbMain: TProgressBar
    Left = 0
    Top = 15
    Width = 301
    Height = 16
    TabOrder = 0
  end
  object pbOne: TProgressBar
    Left = 0
    Top = 50
    Width = 301
    Height = 16
    TabOrder = 1
  end
  object cxButton1: TcxButton
    Left = 225
    Top = 85
    Width = 75
    Height = 25
    Caption = 'Stop'
    TabOrder = 2
  end
  object IdHTTP1: TIdHTTP
    MaxLineAction = maException
    ReadTimeout = 0
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 5
    Top = 80
  end
  object AntiFreeze: TIdAntiFreeze
    OnlyWhenIdle = False
    Left = 35
    Top = 80
  end
end
