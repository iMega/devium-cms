object ImageForm: TImageForm
  Left = 378
  Top = 198
  BorderStyle = bsDialog
  BorderWidth = 5
  Caption = #1057#1074#1086#1081#1089#1090#1074#1072' '#1092#1086#1090#1086
  ClientHeight = 300
  ClientWidth = 500
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    500
    300)
  PixelsPerInch = 96
  TextHeight = 13
  object Image: TImage
    Left = 0
    Top = 20
    Width = 150
    Height = 150
    Center = True
  end
  object Label1: TLabel
    Left = 155
    Top = 20
    Width = 47
    Height = 13
    Caption = #1053#1079#1074#1072#1085#1080#1077':'
  end
  object Label2: TLabel
    Left = 155
    Top = 60
    Width = 135
    Height = 13
    Caption = #1048#1084#1103' '#1083#1072#1090#1080#1085#1089#1080#1082#1084#1080' '#1073#1091#1082#1074#1072#1084#1080':'
  end
  object Label3: TLabel
    Left = 155
    Top = 100
    Width = 53
    Height = 13
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077':'
  end
  object Label4: TLabel
    Left = 155
    Top = 210
    Width = 29
    Height = 13
    Caption = #1044#1072#1090#1072':'
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 500
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
    TabOrder = 4
  end
  object OK: TcxButton
    Left = 345
    Top = 275
    Width = 75
    Height = 25
    Action = ActionOK
    Anchors = [akRight, akBottom]
    TabOrder = 6
  end
  object Cancel: TcxButton
    Left = 425
    Top = 275
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 7
  end
  object Panel1: TPanel
    Left = 0
    Top = 251
    Width = 500
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
    TabOrder = 8
  end
  object title: TcxDBTextEdit
    Left = 155
    Top = 35
    Width = 346
    Height = 21
    DataBinding.DataSource = DM.dsPhotos
    DataBinding.DataField = 'title'
    TabOrder = 0
  end
  object name: TcxDBMaskEdit
    Left = 155
    Top = 75
    Width = 346
    Height = 21
    DataBinding.DataSource = DM.dsPhotos
    DataBinding.DataField = 'name'
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '[a-zA-Z0-9_]+'
    Properties.MaxLength = 0
    TabOrder = 1
  end
  object text: TcxDBMemo
    Left = 155
    Top = 115
    Width = 346
    Height = 89
    DataBinding.DataSource = DM.dsPhotos
    DataBinding.DataField = 'text'
    TabOrder = 2
  end
  object last_update: TcxDBDateEdit
    Left = 155
    Top = 225
    Width = 176
    Height = 21
    DataBinding.DataSource = DM.dsPhotos
    DataBinding.DataField = 'last_update'
    TabOrder = 3
  end
  object is_visible: TcxDBCheckBox
    Left = 5
    Top = 275
    Width = 186
    Height = 21
    DataBinding.DataSource = DM.dsPhotos
    DataBinding.DataField = 'is_visible'
    Properties.Alignment = taLeftJustify
    Properties.DisplayUnchecked = 'False'
    Properties.NullStyle = nssUnchecked
    Properties.ValueChecked = '1'
    Properties.ValueUnchecked = '0'
    Properties.Caption = #1055#1091#1073#1083#1080#1082#1086#1074#1072#1090#1100' '#1085#1072' '#1089#1072#1081#1090#1077
    TabOrder = 5
  end
  object ActionList: TActionList
    Left = 430
    Top = 220
    object ActionOK: TAction
      Caption = 'OK'
      ShortCut = 16397
      OnExecute = ActionOKExecute
    end
  end
end
