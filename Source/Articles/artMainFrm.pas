unit artMainFrm;

interface

uses
  Forms, PluginManagerIntf, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxEdit, DB, cxDBData, Classes, ActnList, ImgList, Controls,
  TBSkinPlus, StdCtrls, ExtCtrls, ComCtrls, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxContainer, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, TB2Item, TB2Dock, TB2Toolbar;

type
  TMainForm = class(TForm)
    StatusBar: TStatusBar;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBSkin: TTBSkin;
    ImageList20: TImageList;
    ActionList: TActionList;
    ArticlesGridTable: TcxGridDBTableView;
    ArticlesGrid: TcxGrid;
    CatEdit: TAction;
    ItemNew: TAction;
    ItemEdit: TAction;
    ItemDelete: TAction;
    ItemCopy: TAction;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem4: TTBItem;
    TBItem5: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    category_id: TcxGridDBColumn;
    title: TcxGridDBColumn;
    date: TcxGridDBColumn;
    is_visible: TcxGridDBColumn;
    Syn: TAction;
    TBSeparatorItem2: TTBSeparatorItem;
    TBItem8: TTBItem;
    ImageList16: TImageList;
    StatusBarUpDate: TAction;
    TBSeparatorItem3: TTBSeparatorItem;
    TBSubmenuItem1: TTBSubmenuItem;
    TBItem3: TTBItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBItem6: TTBItem;
    TBItem7: TTBItem;
    TBItem9: TTBItem;
    TBSeparatorItem5: TTBSeparatorItem;
    TBItem10: TTBItem;
    TBItem11: TTBItem;
    Refresh: TAction;
    CategoryGridTable: TcxGridDBTableView;
    category_title: TcxGridDBColumn;
    ArticlesGridLevel1: TcxGridLevel;
    procedure SynExecute(Sender: TObject);
    procedure SynUpdate(Sender: TObject);
    procedure StatusBarUpDateUpdate(Sender: TObject);
    procedure ItemDeleteUpdate(Sender: TObject);
    procedure ArticlesGridTableDblClick(Sender: TObject);
    procedure RefreshExecute(Sender: TObject);
    procedure CatEditExecute(Sender: TObject);
    procedure ItemNewExecute(Sender: TObject);
    procedure ItemEditExecute(Sender: TObject);
    procedure ItemDeleteExecute(Sender: TObject);
  private
    FDataBasePath: String; 
    FPluginManager: IPluginManager;
    FDataPath: String;
    procedure SetPluginManager(const Value: IPluginManager);
    procedure DeleteActicle;
  public
    property PluginManager: IPluginManager read FPluginManager write SetPluginManager;
    property DataPath: String read FDataPath write FDataPath;
  end;

function GetMainForm(const APluginManager: IPluginManager; const Path: String): Integer;

implementation

uses artDataModule, Windows, artCategoriesFrm, artArticle;

{$R *.dfm}

function GetMainForm;
var
  Form: TMainForm;
begin
  Form := TMainForm.Create(Application);
  try
    Form.DataPath := Path;
    Form.PluginManager := APluginManager;
    Result := Form.ShowModal;
    if Result = mrOK then
    begin
    end;
  finally
    Form.Free;
  end;
end;

{ TMainForm }

procedure TMainForm.SetPluginManager(const Value: IPluginManager);
begin
  FPluginManager := Value;
  DM := TDM.Create(Self);
  DM.PluginManager := FPluginManager;
  DM.DataPath := FDataBasePath;
  DM.Open;
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

procedure TMainForm.StatusBarUpDateUpdate(Sender: TObject);
begin
  StatusBar.Panels[0].Text := DM.GetStatsuBarString;
end;

procedure TMainForm.ItemDeleteUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (DM.Articles.RecordCount > 0);
end;

procedure TMainForm.ArticlesGridTableDblClick(Sender: TObject);
begin
  ItemEdit.Execute;
end;

procedure TMainForm.RefreshExecute(Sender: TObject);
var
  cur: TCursor;
begin
  cur := Screen.Cursor;
  try
    SetCursor(LoadCursor(0, IDC_WAIT));
    DM.Refresh;
  finally
    Screen.Cursor := cur;
  end;
end;

procedure TMainForm.CatEditExecute(Sender: TObject);
begin
  GetCategoriesForm;
end;

procedure TMainForm.ItemNewExecute(Sender: TObject);
begin
  with DM.Articles do
  begin
    Append;
    FieldValues['is_visible'] := 1;
    Post;
    Edit;
    if GetArticleForm(FPluginManager) = mrOK then
      Post
    else
      DeleteActicle;
  end;
end;

procedure TMainForm.ItemEditExecute(Sender: TObject);
begin
  with DM.Articles do
  begin
    Edit;
    if GetArticleForm(FPluginManager) = mrOK then
      Post
    else
      Cancel;
  end;
end;

procedure TMainForm.ItemDeleteExecute(Sender: TObject);
begin
  DeleteActicle;
end;

procedure TMainForm.DeleteActicle;
begin
  with DM.Pages do
  begin
    First;
    while not EOF do Delete;
  end;
  DM.Articles.Delete;
end;

end.
