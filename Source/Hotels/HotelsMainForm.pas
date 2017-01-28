unit HotelsMainForm;

interface

uses
  Forms, ActnList, Menus, TB2Item, TBSkinPlus, TB2Dock, TB2Toolbar,
  Controls, Classes, ComCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxEdit, DB, cxDBData, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxContainer, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, PluginManagerIntf, ImgList;

type
  TMainForm = class(TForm)
    StatusBar: TStatusBar;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBSkin: TTBSkin;
    TBPopupMenu1: TTBPopupMenu;
    ActionList: TActionList;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    Ins: TAction;
    CopyItem: TAction;
    Edit: TAction;
    Del: TAction;
    ImageList20: TImageList;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBItem4: TTBItem;
    StatusBarUpDate: TAction;
    Syn: TAction;
    TBSeparatorItem2: TTBSeparatorItem;
    TBItem5: TTBItem;
    PlaceEdit: TAction;
    TBItem6: TTBItem;
    TBSubmenuItem1: TTBSubmenuItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBItem7: TTBItem;
    TBItem8: TTBItem;
    TBItem9: TTBItem;
    TBItem10: TTBItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBItem11: TTBItem;
    ReFrash: TAction;
    TBItem12: TTBItem;
    TBSeparatorItem5: TTBSeparatorItem;
    cxGrid1DBTableView1id: TcxGridDBColumn;
    cxGrid1DBTableView1place_id: TcxGridDBColumn;
    cxGrid1DBTableView1name: TcxGridDBColumn;
    cxGrid1DBTableView1english_name: TcxGridDBColumn;
    cxGrid1DBTableView1description: TcxGridDBColumn;
    cxGrid1DBTableView1map_x: TcxGridDBColumn;
    cxGrid1DBTableView1map_y: TcxGridDBColumn;
    cxGrid1DBTableView1mod_rewrite_name: TcxGridDBColumn;
    cxGrid1DBTableView1starts: TcxGridDBColumn;
    cxGrid1DBTableView1super: TcxGridDBColumn;
    cxGrid1DBTableView1country_id: TcxGridDBColumn;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1id: TcxGridDBColumn;
    cxGrid2DBTableView1filename: TcxGridDBColumn;
    cxGrid2DBTableView1localpath: TcxGridDBColumn;
    cxGrid2DBTableView1remotepath: TcxGridDBColumn;
    cxGrid2DBTableView1is_deleted: TcxGridDBColumn;
    cxGrid2DBTableView1table: TcxGridDBColumn;
    cxGrid2DBTableView1table_keyname: TcxGridDBColumn;
    cxGrid2DBTableView1table_key: TcxGridDBColumn;
    procedure InsExecute(Sender: TObject);
    procedure EditExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StatusBarUpDateUpdate(Sender: TObject);
    procedure SynExecute(Sender: TObject);
    procedure SynUpdate(Sender: TObject);
    procedure PlaceEditExecute(Sender: TObject);
    procedure DelExecute(Sender: TObject);
  private
    FPluginManager: IPluginManager;
    FPath: String;
    procedure SetPluginManager(const Value: IPluginManager);
    procedure SetPath(const Value: String);
  public
    property PluginManager: IPluginManager read FPluginManager write SetPluginManager;
    property Path: String read FPath write SetPath;
  end;

function GetMainForm(PluginManager: IPluginManager; const Path: String): Integer; 

implementation

uses HotelsDataModule, HotelsEditForm, Windows, SysUtils, HotelsPlacesForm;

{$R *.dfm}

function GetMainForm; 
var
  Form: TMainForm;
begin
  Form := TMainForm.Create(Application);
  try
    Form.Path := Path;
    Form.PluginManager := PluginManager;
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
  DM.DataBasePath := FPath;
  DM.PluginManager := FPluginManager;
  DM.Open;
  // fill data
end;

procedure TMainForm.InsExecute(Sender: TObject);
begin
  with Dm.Hotels do
  begin
    Append;
    FieldValues['name'] := 'РќРѕРІС‹Р№ РѕС‚РµР»СЊ';
    Post;
    Edit;
    if GetHotelsForm() = mrOK then
      Post
    else
      Delete;
  end;
end;

procedure TMainForm.EditExecute(Sender: TObject);
begin
  with Dm.Hotels do
  begin
    Edit;
    if GetHotelsForm() = mrOK then
      Post
    else
      Cancel;
  end;
end;

procedure TMainForm.SetPath(const Value: String);
begin
  FPath := Value;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  DM.Free;
end;

procedure TMainForm.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  Edit.Execute;
end;

procedure TMainForm.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    Edit.Execute;
end;

procedure TMainForm.StatusBarUpDateUpdate(Sender: TObject);
begin
  with DM do
  StatusBar.Panels[0].Text :=
    Format('H: %d, HS: %d, HI: %d, S: %d, P: %d, PT: %d, IMG: %d', [
    Hotels.ChangeCount,
    HotelsServices.ChangeCount,
    HotelsImages.ChangeCount,
    Services.ChangeCount,
    Places.ChangeCount,
    PlacesTypes.ChangeCount,
    Images.RecordCount]);
end;

procedure TMainForm.SynExecute(Sender: TObject);
begin
  DM.ApplyUpdates;
end;

procedure TMainForm.SynUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := DM.CanApplyUpdates;
end;

procedure TMainForm.PlaceEditExecute(Sender: TObject);
begin
  GetPlacesForm();
end;

procedure TMainForm.DelExecute(Sender: TObject);
begin
  if MessageBox(Handle,
    'Р’С‹ СѓРІРµСЂРµРЅС‹ С‡С‚Рѕ С…РѕС‚РёС‚Рµ СѓРґР°Р»РёС‚СЊ Р·Р°РїРёСЃСЊ ?',
    PChar(Caption),
    MB_OKCANCEL + MB_ICONQUESTION + MB_DEFBUTTON2) = IDOK then
  Dm.Hotels.Delete;
end;

end.
