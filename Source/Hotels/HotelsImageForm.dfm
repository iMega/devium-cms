object ImageForm: TImageForm
  Left = 357
  Top = 209
  ActiveControl = name
  BorderStyle = bsDialog
  BorderWidth = 5
  Caption = #1057#1090#1074#1086#1081#1089#1090#1074#1072' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1103
  ClientHeight = 300
  ClientWidth = 400
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  DesignSize = (
    400
    300)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 20
    Width = 53
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
  end
  object Label3: TLabel
    Left = 115
    Top = 60
    Width = 53
    Height = 13
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077':'
  end
  object Label2: TLabel
    Left = 0
    Top = 60
    Width = 31
    Height = 13
    Caption = #1060#1086#1090#1086':'
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 400
    Height = 16
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Color = 10857647
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object Panel1: TPanel
    Left = 0
    Top = 254
    Width = 400
    Height = 16
    Alignment = taLeftJustify
    Anchors = [akLeft, akRight, akBottom]
    BevelOuter = bvNone
    Color = 10857647
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
  end
  object btnOK: TcxButton
    Left = 244
    Top = 275
    Width = 75
    Height = 25
    Action = ActionOK
    Anchors = [akRight, akBottom]
    TabOrder = 3
  end
  object Cancel: TcxButton
    Left = 325
    Top = 275
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 4
  end
  object name: TcxDBTextEdit
    Left = 0
    Top = 35
    Width = 401
    Height = 21
    DataBinding.DataSource = DM.dsHotelsImages
    DataBinding.DataField = 'name'
    TabOrder = 0
  end
  object description: TcxDBMemo
    Left = 115
    Top = 75
    Width = 286
    Height = 176
    DataBinding.DataSource = DM.dsHotelsImages
    DataBinding.DataField = 'description'
    TabOrder = 1
  end
  object btnLoad: TcxButton
    Left = 0
    Top = 275
    Width = 75
    Height = 25
    Action = LoadImage
    TabOrder = 2
  end
  object Panel3: TPanel
    Left = 0
    Top = 75
    Width = 105
    Height = 105
    BevelOuter = bvNone
    BorderWidth = 1
    Color = clActiveCaption
    TabOrder = 7
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 103
      Height = 103
      Align = alClient
      BevelOuter = bvNone
      Color = clWindow
      TabOrder = 0
      object Image: TImage
        Left = 0
        Top = 0
        Width = 103
        Height = 103
        Align = alClient
        Center = True
        Proportional = True
      end
    end
  end
  object ActionList: TActionList
    Images = MainForm.ImageList20
    Left = 200
    Top = 260
    object ActionOK: TAction
      Caption = 'OK'
      ShortCut = 16397
      OnExecute = ActionOKExecute
    end
    object LoadImage: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
      OnExecute = LoadImageExecute
    end
  end
  object OpenPictureDialog: TOpenPictureDialog
    OptionsEx = [ofExNoPlacesBar]
    Left = 170
    Top = 260
  end
end
