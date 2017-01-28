{----------------------------------------------------------------------

   DEVIUM Content Management System
   Copyright (C) 2004 by DEIV Development Team.
   http://www.deiv.com/

   $Header: /devium/Devium\040CMS\0402/Source/Products/prodTypesForm.pas,v 1.3 2004/04/26 08:40:45 paladin Exp $

------------------------------------------------------------------------}
unit prodTypesForm;

interface

uses
  Forms, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxEdit, DB,
  cxDBData, ComCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  ExtCtrls, TB2Item, TB2Dock, TB2Toolbar, Controls, Classes;

type
  TTypesForm = class(TForm)
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBSeparatorItem1: TTBSeparatorItem;
    TBSubmenuItem1: TTBSubmenuItem;
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    Types: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    property_title: TcxGridDBColumn;
    datatype: TcxGridDBColumn;
    length_set: TcxGridDBColumn;
    default_value: TcxGridDBColumn;
    is_required: TcxGridDBColumn;
    is_public: TcxGridDBColumn;
    name: TcxGridDBColumn;
    type_id: TcxGridDBColumn;
    StatusBar1: TStatusBar;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    type_title: TcxGridDBColumn;
    parent_id: TcxGridDBColumn;
    _type_id: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TypesForm: TTypesForm;

function GetTypesForm: Integer;

implementation

uses progDataModule, prodMainForm, cxDropDownEdit, prodTypes;

{$R *.dfm}

function GetTypesForm: Integer;
var
  Form: TTypesForm;
begin
  Form := TTypesForm.Create(Application);
  try
    Result := Form.ShowModal; 
  finally
    Form.Free;
  end;
end;

procedure TTypesForm.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  TcxComboBoxProperties(datatype.Properties).Items.Clear;
  for i := 1 to PROPERTY_COUNT do
    TcxComboBoxProperties(datatype.Properties).Items.Add(PropertyTypes[i].Name);   
end;

end.
