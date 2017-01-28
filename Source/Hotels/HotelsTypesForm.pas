unit HotelsTypesForm;

interface

uses
  Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxEdit,
  DB, cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  TB2Dock, TB2Toolbar, ComCtrls, Classes, Controls, ActnList, TB2Item;

type
  TTypesForm = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1name: TcxGridDBColumn;
    cxGrid1DBTableView1type_id: TcxGridDBColumn;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    StatusBar1: TStatusBar;
    ActionList: TActionList;
    Ins: TAction;
    Copy: TAction;
    Edit: TAction;
    Del: TAction;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    TBSubmenuItem1: TTBSubmenuItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem7: TTBItem;
    TBItem8: TTBItem;
    TBSeparatorItem2: TTBSeparatorItem;
    TBItem9: TTBItem;
    ReFrash: TAction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function GetTypesForm: Integer;

implementation

uses HotelsDataModule, HotelsMainForm;

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

end.
