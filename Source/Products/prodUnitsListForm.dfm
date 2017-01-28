object UnitsListForm: TUnitsListForm
  Left = 411
  Top = 316
  Width = 490
  Height = 319
  Caption = 'UnitsListForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 26
    Width = 482
    Height = 259
    Align = alClient
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = DM.dsUnits
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object unit_name_id: TcxGridDBColumn
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'unit_name_id'
        Properties.ListColumns = <
          item
            FieldName = 'unit_title'
          end>
        Properties.ListSource = DM.dsUnitNames
        Width = 192
        DataBinding.FieldName = 'unit_name_id'
      end
      object multiplier: TcxGridDBColumn
        Width = 160
        DataBinding.FieldName = 'multiplier'
      end
      object weight: TcxGridDBColumn
        Width = 128
        DataBinding.FieldName = 'weight'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 482
    Height = 26
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      TabOrder = 0
      DockTextAlign = taLeftJustify
    end
  end
end
