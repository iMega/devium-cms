unit NewsCategoryEditForm;

interface

uses
  Forms, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxEdit, DB,
  cxDBData, TB2Item, Classes, ActnList, TB2Dock, TB2Toolbar,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, Controls, cxGrid, ComCtrls;

type
  TCategoryEditForm = class(TForm)
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGrid: TcxGrid;
    title: TcxGridDBColumn;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    ActionList: TActionList;
    Ins: TAction;
    Del: TAction;
    MoveUp: TAction;
    MoveDown: TAction;
    Edit: TAction;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBItem5: TTBItem;
    StatusBar1: TStatusBar;
    name: TcxGridDBColumn;
    procedure InsExecute(Sender: TObject);
    procedure EditExecute(Sender: TObject);
    procedure DelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function GetCategoryEditForm: Integer;

implementation

uses NewsDM, NewsMainForm, Windows;

{$R *.dfm}

function GetCategoryEditForm: Integer;
var
  Form: TCategoryEditForm;
begin
  Form := TCategoryEditForm.Create(Application);
  try
    Result := Form.ShowModal;
  finally
    Form.Free;
  end;
end;

procedure TCategoryEditForm.InsExecute(Sender: TObject);
begin
  DM.Categories.Append;
end;

procedure TCategoryEditForm.EditExecute(Sender: TObject);
begin
  DM.Categories.Edit;
end;

procedure TCategoryEditForm.DelExecute(Sender: TObject);
begin
  if MessageBox(Handle,  'Вы точно уверены что хотите удалить ?',
      PChar(Caption), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
    DM.Categories.Delete;
end;

end.
