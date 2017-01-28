object PriceForm: TPriceForm
  Left = 539
  Top = 349
  Width = 238
  Height = 148
  Caption = #1055#1088#1072#1081#1089
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
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 230
    Height = 23
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      Images = MainForm.ImageList20
      TabOrder = 0
      DockTextAlign = taLeftJustify
      object TBItem2: TTBItem
        Action = Action1
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 95
    Width = 230
    Height = 19
    Panels = <>
  end
  object TBPopupMenu1: TTBPopupMenu
    Left = 35
    Top = 65
  end
  object ActionList1: TActionList
    Images = MainForm.ImageList20
    Left = 65
    Top = 65
    object Action1: TAction
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1087#1088#1072#1081#1089
      OnExecute = Action1Execute
    end
  end
  object XLS: TQExport3XLS
    ExportSource = esCustom
    CustomSource = CustomSource
    About = '(About EMS QuickExport)'
    _Version = '3.10'
    FileName = 'price.xls'
    ShowFile = True
    Options.PageFooter = 'Page &P of &N'
    Options.SheetTitle = 'Sheet 1'
    Options.CaptionsFormat.Font.Style = [xfsBold]
    Options.HyperlinkFormat.Font.Color = clrBlue
    Options.HyperlinkFormat.Font.Underline = fulSingle
    Options.NoteFormat.Alignment.Horizontal = halLeft
    Options.NoteFormat.Alignment.Vertical = valTop
    Options.NoteFormat.Font.Size = 8
    Options.NoteFormat.Font.Style = [xfsBold]
    Options.NoteFormat.Font.Name = 'Tahoma'
    FieldFormats = <
      item
        FieldName = #1040#1088#1090#1080#1082#1091#1083
      end
      item
        FieldName = 'Column Name 1'
      end
      item
        FieldName = 'Column Name 2'
      end
      item
        FieldName = 'Column Name 3'
      end>
    StripStyles = <>
    Hyperlinks = <>
    Notes = <>
    Charts = <>
    Sheets = <>
    Pictures = <>
    Images = <>
    Cells = <>
    MergedCells = <>
    OnGetDataParams = XLSGetDataParams
    Left = 95
    Top = 65
  end
  object Data: TdxDBTreePrintData
    Indexes = <>
    Persistent.Option = poNone
    SortOptions = []
    DataSource = DM.dsProducts
    KeyField = 'product_id'
    LevelCount = 10
    ParentField = 'parent_id'
    Left = 130
    Top = 65
  end
  object CustomSource: TqeCustomSource
    Columns = <
      item
        ColumnName = #1040#1088#1090#1080#1082#1091#1083
        Caption = #1040#1088#1090#1080#1082#1091#1083
      end
      item
        ColumnName = #1053#1072#1079#1074#1072#1085#1080#1077
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        Width = 100
      end
      item
        ColumnName = #1062#1077#1085#1072
        ColumnType = ectCurrency
        Caption = #1062#1077#1085#1072
      end>
    OnGetNextRecord = CustomSourceGetNextRecord
    OnGetColumnValue = CustomSourceGetColumnValue
    Left = 160
    Top = 65
  end
end
