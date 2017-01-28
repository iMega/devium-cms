{----------------------------------------------------------------------

   DEVIUM Content Management System
   Copyright (C) 2004 by DEIV Development Team.
   http://www.deiv.com/

   $Header: /devium/Devium\040CMS\0402/Source/Products/prodUnitnamesForm.pas,v 1.2 2004/04/20 05:13:23 paladin Exp $

------------------------------------------------------------------------}
unit prodUnitnamesForm;

interface

uses
  Forms, Classes, Controls, ComCtrls, TB2Dock, TB2Toolbar, TB2Item, Menus,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid;

type
  TUnitnamesForm = class(TForm)
    StatusBar: TStatusBar;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBSubmenuItem1: TTBSubmenuItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBPopupMenu1: TTBPopupMenu;
    UnitNames: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    unit_title: TcxGridDBColumn;
    unit_full_title: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function GetUnitnamesForm: Integer;

implementation

uses prodMainForm, progDataModule;

{$R *.dfm}

function GetUnitnamesForm: Integer;
var
  Form: TUnitnamesForm;
begin
  Form := TUnitnamesForm.Create(Application);
  try
    Result := Form.ShowModal;
  finally
    Form.Free;
  end;
end;

procedure TUnitnamesForm.FormCreate(Sender: TObject);
begin
  UnitNames.DataController.DataSource := Dm.dsUnitNames;
end;

end.
