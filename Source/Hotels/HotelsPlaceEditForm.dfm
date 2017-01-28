object PlaceEditForm: TPlaceEditForm
  Left = 432
  Top = 237
  ActiveControl = name
  BorderStyle = bsDialog
  BorderWidth = 5
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1084#1077#1089#1090#1072
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
    Caption = '&'#1053#1072#1079#1074#1072#1085#1080#1077':'
    FocusControl = name
  end
  object Label2: TLabel
    Left = 0
    Top = 100
    Width = 39
    Height = 13
    Caption = '&'#1057#1090#1088#1072#1085#1072':'
    FocusControl = country_id
  end
  object Label3: TLabel
    Left = 0
    Top = 60
    Width = 127
    Height = 13
    Caption = '&'#1054#1088#1080#1075#1080#1085#1072#1083#1100#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077':'
    FocusControl = english_name
  end
  object Label4: TLabel
    Left = 155
    Top = 100
    Width = 73
    Height = 13
    Caption = #1050#1086#1088#1088#1076#1080#1085#1072#1090#1072' &'#1061':'
    FocusControl = map_x
  end
  object Label5: TLabel
    Left = 280
    Top = 100
    Width = 73
    Height = 13
    Caption = #1050#1086#1088#1088#1076#1080#1085#1072#1090#1072' &Y:'
    FocusControl = map_y
  end
  object Label6: TLabel
    Left = 0
    Top = 140
    Width = 53
    Height = 13
    Caption = #1054'&'#1087#1080#1089#1072#1085#1080#1077':'
    FocusControl = description
  end
  object Label7: TLabel
    Left = 280
    Top = 60
    Width = 22
    Height = 13
    Caption = '&'#1058#1080#1087':'
    FocusControl = place_type_id
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
    TabOrder = 9
  end
  object Panel1: TPanel
    Left = 0
    Top = 250
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
    TabOrder = 10
  end
  object OK: TcxButton
    Left = 243
    Top = 275
    Width = 75
    Height = 25
    Action = ActionOK
    Anchors = [akRight, akBottom]
    TabOrder = 7
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
    TabOrder = 8
  end
  object name: TcxDBTextEdit
    Left = 0
    Top = 35
    Width = 401
    Height = 21
    DataBinding.DataSource = DM.dsPlaces
    DataBinding.DataField = 'name'
    TabOrder = 0
  end
  object country_id: TcxDBLookupComboBox
    Left = 0
    Top = 115
    Width = 151
    Height = 21
    DataBinding.DataSource = DM.dsPlaces
    DataBinding.DataField = 'country_id'
    Properties.DropDownListStyle = lsFixedList
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        FieldName = 'name'
      end>
    Properties.ListOptions.GridLines = glNone
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DM.dsCountries
    TabOrder = 3
  end
  object english_name: TcxDBTextEdit
    Left = 0
    Top = 75
    Width = 276
    Height = 21
    DataBinding.DataSource = DM.dsPlaces
    DataBinding.DataField = 'english_name'
    TabOrder = 1
  end
  object map_x: TcxDBSpinEdit
    Left = 155
    Top = 115
    Width = 121
    Height = 21
    DataBinding.DataSource = DM.dsPlaces
    DataBinding.DataField = 'map_x'
    TabOrder = 4
  end
  object map_y: TcxDBSpinEdit
    Left = 280
    Top = 115
    Width = 121
    Height = 21
    DataBinding.DataSource = DM.dsPlaces
    DataBinding.DataField = 'map_y'
    TabOrder = 5
  end
  object description: TcxDBMemo
    Left = 0
    Top = 155
    Width = 401
    Height = 89
    DataBinding.DataSource = DM.dsPlaces
    DataBinding.DataField = 'description'
    TabOrder = 6
  end
  object place_type_id: TcxDBLookupComboBox
    Left = 280
    Top = 75
    Width = 121
    Height = 21
    DataBinding.DataSource = DM.dsPlaces
    DataBinding.DataField = 'place_type_id'
    Properties.DropDownListStyle = lsFixedList
    Properties.KeyFieldNames = 'id'
    Properties.ListColumns = <
      item
        FieldName = 'name'
      end>
    Properties.ListOptions.GridLines = glNone
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DM.dsPlacesTypes
    TabOrder = 2
  end
  object ActionList: TActionList
    Left = 180
    Top = 270
    object ActionOK: TAction
      Caption = 'OK'
      OnExecute = ActionOKExecute
    end
  end
end
