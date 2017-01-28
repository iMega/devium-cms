unit artCategoriesFrm;

interface

uses
  Forms, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxEdit, DB,
  cxDBData, TB2Item, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid, Classes, ActnList, ComCtrls, TB2Dock, TB2Toolbar, Controls;

type
  TCategoriesForm = class(TForm)
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    ActionList1: TActionList;
    ItemNew: TAction;
    ItemCopy: TAction;
    ItemEdit: TAction;
    ItemDelete: TAction;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    StatusBar: TStatusBar;
    ItemUp: TAction;
    ItemDown: TAction;
    TBSeparatorItem1: TTBSeparatorItem;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    title: TcxGridDBColumn;
    TBSubmenuItem1: TTBSubmenuItem;
    TBSeparatorItem2: TTBSeparatorItem;
    TBItem7: TTBItem;
    TBItem8: TTBItem;
    TBItem9: TTBItem;
    TBItem10: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBItem11: TTBItem;
    TBItem12: TTBItem;
    name: TcxGridDBColumn;
  end;

function GetCategoriesForm: Integer;

implementation

uses artDataModule;

{$R *.dfm}

function GetCategoriesForm: Integer;
var
  Form: TCategoriesForm;
begin
  Form := TCategoriesForm.Create(Application);
  try
    Result := Form.ShowModal;
  finally
    Form.Free;
  end;
end;

end.
