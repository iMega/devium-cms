object EditForm: TEditForm
  Left = 372
  Top = 238
  BorderStyle = bsDialog
  BorderWidth = 5
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1085#1086#1074#1086#1089#1090#1080
  ClientHeight = 390
  ClientWidth = 370
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 60
    Width = 57
    Height = 13
    Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082':'
  end
  object Label2: TLabel
    Left = 0
    Top = 100
    Width = 29
    Height = 13
    Caption = #1044#1072#1090#1072':'
  end
  object Label3: TLabel
    Left = 130
    Top = 100
    Width = 36
    Height = 13
    Caption = #1042#1088#1077#1084#1103':'
  end
  object Label4: TLabel
    Left = 0
    Top = 20
    Width = 56
    Height = 13
    Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103':'
  end
  object Label5: TLabel
    Left = 255
    Top = 100
    Width = 33
    Height = 13
    Caption = #1040#1074#1090#1086#1088':'
  end
  object Label6: TLabel
    Left = 0
    Top = 215
    Width = 77
    Height = 13
    Caption = #1058#1077#1082#1089#1090' '#1085#1086#1074#1086#1089#1090#1080':'
  end
  object Label7: TLabel
    Left = 0
    Top = 140
    Width = 34
    Height = 13
    Caption = #1040#1085#1086#1085#1089':'
  end
  object Label8: TLabel
    Left = 170
    Top = 20
    Width = 163
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1083#1072#1090#1080#1085#1089#1082#1080#1084#1080' '#1073#1091#1082#1074#1072#1084#1080':'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 370
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
    TabOrder = 12
  end
  object btnOK: TcxButton
    Left = 215
    Top = 365
    Width = 75
    Height = 25
    Action = OK
    TabOrder = 10
  end
  object Cancel: TcxButton
    Left = 295
    Top = 365
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 11
  end
  object Panel2: TPanel
    Left = 0
    Top = 341
    Width = 371
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
    TabOrder = 13
  end
  object title: TcxDBTextEdit
    Left = 0
    Top = 75
    Width = 371
    Height = 21
    DataBinding.DataSource = DM.dsNews
    DataBinding.DataField = 'title'
    Properties.OnEditValueChanged = titlePropertiesEditValueChanged
    TabOrder = 2
  end
  object creation_date: TcxDBDateEdit
    Left = 0
    Top = 115
    Width = 121
    Height = 21
    DataBinding.DataSource = DM.dsNews
    DataBinding.DataField = 'creation_date'
    Properties.SaveTime = False
    Properties.ShowTime = False
    TabOrder = 3
  end
  object creation_time: TcxDBTimeEdit
    Left = 125
    Top = 115
    Width = 121
    Height = 21
    DataBinding.DataSource = DM.dsNews
    DataBinding.DataField = 'creation_date'
    TabOrder = 4
  end
  object _published: TcxDBCheckBox
    Left = 0
    Top = 363
    Width = 201
    Height = 21
    DataBinding.DataSource = DM.dsNews
    DataBinding.DataField = 'published'
    Properties.Alignment = taLeftJustify
    Properties.DisplayUnchecked = 'False'
    Properties.NullStyle = nssUnchecked
    Properties.ValueChecked = '1'
    Properties.ValueUnchecked = '0'
    Properties.Caption = #1055#1091#1073#1083#1080#1082#1086#1074#1072#1090#1100' '#1085#1072' '#1089#1072#1081#1090#1077
    TabOrder = 9
  end
  object category_id: TcxDBLookupComboBox
    Left = 0
    Top = 35
    Width = 166
    Height = 21
    DataBinding.DataSource = DM.dsNews
    DataBinding.DataField = 'category_id'
    Properties.DropDownListStyle = lsFixedList
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        FieldName = 'title'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DM.dsCategories
    TabOrder = 0
  end
  object author: TcxDBTextEdit
    Left = 250
    Top = 115
    Width = 121
    Height = 21
    DataBinding.DataSource = DM.dsNews
    DataBinding.DataField = 'author'
    TabOrder = 5
  end
  object text: TcxDBMemo
    Left = 0
    Top = 230
    Width = 336
    Height = 106
    DataBinding.DataSource = DM.dsNews
    DataBinding.DataField = 'text'
    TabOrder = 7
  end
  object btnEditText: TcxButton
    Left = 344
    Top = 230
    Width = 26
    Height = 106
    Caption = '...'
    TabOrder = 8
    OnClick = btnEditTextClick
  end
  object announcement: TcxDBMemo
    Left = 0
    Top = 155
    Width = 371
    Height = 56
    DataBinding.DataSource = DM.dsNews
    DataBinding.DataField = 'announcement'
    TabOrder = 6
  end
  object name: TcxDBMaskEdit
    Left = 170
    Top = 35
    Width = 201
    Height = 21
    TabStop = False
    DataBinding.DataSource = DM.dsNews
    DataBinding.DataField = 'name'
    Properties.MaskKind = emkRegExpr
    Properties.EditMask = '[a-z_0-9-]+'
    Properties.MaxLength = 0
    TabOrder = 1
  end
  object ActionList: TActionList
    Left = 140
    Top = 190
    object OK: TAction
      Caption = 'OK'
      ShortCut = 16397
      OnExecute = OKExecute
    end
    object Action2: TAction
      Caption = 'Action2'
    end
  end
end
