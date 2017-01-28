unit gbMainForm;

interface

uses
  Forms, PluginManagerIntf, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxEdit, DB, cxDBData, TB2Item, Classes, ActnList, ImgList,
  Controls, TBSkinPlus, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, TB2Dock, TB2Toolbar, ComCtrls;

type
  TMainForm = class(TForm)
    TBDock1: TTBDock;
    TBToolbar: TTBToolbar;
    TBSkin: TTBSkin;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGrid: TcxGrid;
    cxGridDBTableView1date: TcxGridDBColumn;
    cxGridDBTableView1question: TcxGridDBColumn;
    cxGridDBTableView1answer: TcxGridDBColumn;
    cxGridDBTableView1author: TcxGridDBColumn;
    cxGridDBTableView1email: TcxGridDBColumn;
    ActionList: TActionList;
    ImageList20: TImageList;
    Ins: TAction;
    Delete: TAction;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    StatusBar: TStatusBar;
    TBSeparatorItem1: TTBSeparatorItem;
    TBItem4: TTBItem;
    Syn: TAction;
    ItemEdit: TAction;
    procedure FormDestroy(Sender: TObject);
    procedure DeleteExecute(Sender: TObject);
    procedure cxGridDBTableView1DblClick(Sender: TObject);
    procedure EditUpdate(Sender: TObject);
    procedure SynExecute(Sender: TObject);
    procedure ItemEditExecute(Sender: TObject);
  private
    FPluginManager: IPluginManager;
    FPath: String;
    procedure SetPluginManager(const Value: IPluginManager);
    procedure SetPath(const Value: String);
  public
    property PluginManager: IPluginManager read FPluginManager write SetPluginManager;
    property Path: String read FPath write SetPath;
  end;

function GetMainForm(APluginManager: IPluginManager; const Path: String): Integer;
 
implementation

uses gbDataModule, gbEditQuestion, Windows;

{$R *.dfm}

function GetMainForm(APluginManager: IPluginManager; const Path: String): Integer;
var
  Form: TMainForm;
begin
  Form := TMainForm.Create(Application);
  try
    Form.Path := Path;
    Form.PluginManager := APluginManager;
    Result := Form.ShowModal;
  finally
    Form.Free;
  end;
end;

{ TMainForm }

procedure TMainForm.SetPluginManager(const Value: IPluginManager);
begin
  FPluginManager := Value;
  DM := TDM.Create(Application);
  DM.DataPath := FPath;
  DM.PluginManager := FPluginManager;
  DM.Open;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  DM.Free;
end;

procedure TMainForm.DeleteExecute(Sender: TObject);
var
  i: Integer;
begin
  i := MessageBox(Handle, 'Вы уверены что хотите удалить ?',
    PChar(Caption), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2);
  if i = IDCANCEL then Exit;
  with DM.Guestbook do
  begin
    Delete;
  end;
end;

procedure TMainForm.cxGridDBTableView1DblClick(Sender: TObject);
begin
  ItemEdit.Execute;
end;

procedure TMainForm.EditUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := DM.Guestbook.CanModify;
end;

procedure TMainForm.SynExecute(Sender: TObject);
var
  cur: TCursor;
begin
  cur := Screen.Cursor;
  try
    SetCursor(LoadCursor(0, IDC_WAIT));
    DM.ApplyUpdates();
  finally
    Screen.Cursor := cur;
  end;
end;

procedure TMainForm.ItemEditExecute(Sender: TObject);
begin
  with DM.Guestbook do
  begin
    Edit;
    if GetEditQuestion = mrOK then
      Post
    else
      Cancel
  end;
end;

procedure TMainForm.SetPath(const Value: String);
begin
  FPath := Value;
end;

end.
