{----------------------------------------------------------------------

   DEVIUM Content Management System
   Copyright (C) 2004 by DEIV Development Team.
   http://www.deiv.com/

   $Header: /devium/Devium\040CMS\0402/Source/Products/prodUnitsListForm.pas,v 1.2 2004/04/20 05:13:23 paladin Exp $

------------------------------------------------------------------------}
unit prodUnitsListForm;

interface

uses
  Forms, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxEdit, DB,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  TB2Dock, TB2Toolbar, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, Classes, Controls, cxGrid;

type
  TUnitsListForm = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    unit_name_id: TcxGridDBColumn;
    multiplier: TcxGridDBColumn;
    weight: TcxGridDBColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function GetUnitsListForm: Integer;
 
implementation

uses progDataModule;

{$R *.dfm}

function GetUnitsListForm: Integer;
var
  Form: TUnitsListForm;
begin
  Form := TUnitsListForm.Create(Application);
  try
    Result := Form.ShowModal;
  finally
    Form.Free;
  end;
end;

end.
