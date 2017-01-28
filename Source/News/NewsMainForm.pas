unit NewsMainForm;

interface

uses
  Forms, PluginManagerIntf, ComCtrls, TBSkinPlus, TB2Dock, TB2Toolbar,
  Classes, Controls, ActnList, ImgList, TB2Item, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Menus;

type
  TMainForm = class(TForm)
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBSkin: TTBSkin;
    StatusBar: TStatusBar;
    ActionList: TActionList;
    ImageList20: TImageList;
    Ins: TAction;
    Copy: TAction;
    Edit: TAction;
    Delete: TAction;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    CatEdit: TAction;
    TBItem5: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    GridDBTableView1: TcxGridDBTableView;
    GridLevel1: TcxGridLevel;
    Grid: TcxGrid;
    GridDBTableView1category_id: TcxGridDBColumn;
    GridDBTableView1title: TcxGridDBColumn;
    GridDBTableView1published: TcxGridDBColumn;
    GridDBTableView1creation_date: TcxGridDBColumn;
    GridDBTableView1announcement: TcxGridDBColumn;
    Syn: TAction;
    TBItem6: TTBItem;
    TBSeparatorItem2: TTBSeparatorItem;
    Refresh: TAction;
    TBSubmenuItem1: TTBSubmenuItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBItem7: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBItem8: TTBItem;
    TBItem9: TTBItem;
    TBItem10: TTBItem;
    TBItem11: TTBItem;
    TBSeparatorItem5: TTBSeparatorItem;
    TBItem12: TTBItem;
    TBItem13: TTBItem;
    StatusBarUpdate: TAction;
    TBPopupMenu: TTBPopupMenu;
    TBSeparatorItem6: TTBSeparatorItem;
    TBItem15: TTBItem;
    TBItem16: TTBItem;
    TBItem17: TTBItem;
    TBItem18: TTBItem;
    TBSeparatorItem7: TTBSeparatorItem;
    TBItem19: TTBItem;
    procedure FormDestroy(Sender: TObject);
    procedure InsExecute(Sender: TObject);
    procedure EditExecute(Sender: TObject);
    procedure DeleteExecute(Sender: TObject);
    procedure GridDBTableView1DblClick(Sender: TObject);
    procedure SynExecute(Sender: TObject);
    procedure SynUpdate(Sender: TObject);
    procedure CatEditExecute(Sender: TObject);
    procedure RefreshExecute(Sender: TObject);
    procedure StatusBarUpdateUpdate(Sender: TObject);
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

uses NewsDM, NewsEditForm, Windows, SysUtils, NewsCategoryEditForm{,
  DBClient};

{$R *.dfm}

function GetMainForm;
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
  GridDBTableView1.DataController.DataSource := DM.dsNews;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  DM.Free;
end;

procedure TMainForm.InsExecute(Sender: TObject);
begin
  with DM.News do
  begin
    Append;
    FieldValues['creation_date'] := Now();
    if GetEditForm(FPluginManager) = mrOK then
      Post
    else
      Delete;
  end;
end;

procedure TMainForm.EditExecute(Sender: TObject);
begin
  with DM.News do
  begin
    Edit;
    if GetEditForm(FPluginManager) = mrOK then
      Post
    else
      Cancel;
  end;
end;

procedure TMainForm.DeleteExecute(Sender: TObject);
begin
  if MessageBox(Handle,
    'Вы уберены что хотите удалить новость ?',
    PChar(Caption),
    MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  DM.News.Delete;
end;

procedure TMainForm.GridDBTableView1DblClick(Sender: TObject);
begin
  Edit.Execute;
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

procedure TMainForm.SynUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := DM.CanApplyUpdates;
end;

procedure TMainForm.CatEditExecute(Sender: TObject);
begin
  GetCategoryEditForm;
end;

procedure TMainForm.SetPath(const Value: String);
begin
  FPath := Value;
end;

procedure TMainForm.RefreshExecute(Sender: TObject);
begin
  if MessageBox(Handle,
    'При этой операции все изменения, которые быле произведены, будут утеряны.' + #13#10+
    'Вы точно уверены что хотите это делать ?', PChar(Caption),
    MB_ICONQUESTION + MB_YESNO) = IDNO then Exit;

  Screen.Cursor := crHourGlass;
  try
    DM.Refresh;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TMainForm.StatusBarUpdateUpdate(Sender: TObject);
begin
  StatusBar.Panels[0].Text := DM.GetStatsuBarString;
end;

end.
