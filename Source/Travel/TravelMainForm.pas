unit TravelMainForm;

interface

uses
  Forms, PluginManagerIntf, Classes, Controls, ComCtrls, TBSkinPlus,
  TB2Dock, TB2Toolbar, ImgList, ActnList, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxEdit, DB, cxDBData, cxGridTableView,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridDBTableView, cxGrid, TB2Item, cxContainer,
  cxTextEdit, cxMaskEdit, cxDropDownEdit;

type
  TMainForm = class(TForm)
    StatusBar: TStatusBar;
    TopDock: TTBDock;
    TBToolbar1: TTBToolbar;
    TBSkin: TTBSkin;
    ActionList: TActionList;
    ImageList20: TImageList;
    GridDBTableView1: TcxGridDBTableView;
    GridLevel1: TcxGridLevel;
    Grid: TcxGrid;
    StyleRepository: TcxStyleRepository;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxStyle14: TcxStyle;
    Ins: TAction;
    Copy: TAction;
    Edit: TAction;
    Del: TAction;
    Syn: TAction;
    ReFrash: TAction;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    TBItem5: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBItem6: TTBItem;
    direction_id: TcxGridDBColumn;
    special_offer: TcxGridDBColumn;
    low_price: TcxGridDBColumn;
    priority: TcxGridDBColumn;
    currency_id: TcxGridDBColumn;
    title: TcxGridDBColumn;
    StatusBarUpdate: TAction;
    procedure FormDestroy(Sender: TObject);
    procedure SynExecute(Sender: TObject);
    procedure SynUpdate(Sender: TObject);
    procedure InsExecute(Sender: TObject);
    procedure EditExecute(Sender: TObject);
    procedure GridDBTableView1DblClick(Sender: TObject);
    procedure GridDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DelExecute(Sender: TObject);
    procedure DelUpdate(Sender: TObject);
    procedure ReFrashExecute(Sender: TObject);
    procedure StatusBarUpdateUpdate(Sender: TObject);
  private
    FPluginManager: IPluginManager;
    FDataBasePath: String;
    procedure SetPluginManager(const Value: IPluginManager);
    procedure SetDataBasePath(const Value: String);
    procedure FillNames(List: TStringList);
  public
    property PluginManager: IPluginManager read FPluginManager write SetPluginManager;
    property DataBasePath: String read FDataBasePath write SetDataBasePath;
  end;

function GetMainForm(const APluginManager: IPluginManager;
  const DataBasePath: String): Integer;

implementation

uses
  TravelDM, TravelTourEditFrom, Windows, DeviumLib, SysUtils, DBClient;

{$R *.dfm}

function GetMainForm;
var
  Form: TMainForm;
begin
  Form := TMainForm.Create(Application);
  try
    Form.DataBasePath := DataBasePath;
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
  DM.DataPath := FDataBasePath;
  DM.PluginManager := FPluginManager;
  DM.Open;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  DM.Free;
end;

procedure TMainForm.SetDataBasePath(const Value: String);
begin
  FDataBasePath := Value;
end;

procedure TMainForm.SynExecute(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    DM.ApplyUpdates;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TMainForm.SynUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := DM.CanApplyUpdates;
end;

procedure TMainForm.InsExecute(Sender: TObject);
var
  sl: TStringList;
begin
  with DM.Tours do
  begin
    sl := TStringList.Create;
    FillNames(sl);
    Append;
    Post;
    Edit;
    if GetTourEditFrom(sl.Text) = mrOK then
      Post
    else
      Delete;
    sl.Free;
  end;
end;

procedure TMainForm.EditExecute(Sender: TObject);
var
  sl: TStringList;
begin
  with DM.Tours do
  begin
    sl := TStringList.Create;
    FillNames(sl);
    Edit;
    sl.Delete(sl.IndexOf(FieldValues['name'])); // удаление самого себя из списка
    if GetTourEditFrom(sl.Text) = mrOK then
      Post
    else
      Cancel;
    sl.Free;
  end;
end;

procedure TMainForm.GridDBTableView1DblClick(Sender: TObject);
begin
  Edit.Execute;
end;

procedure TMainForm.GridDBTableView1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    Edit.Execute;
end;

procedure TMainForm.DelExecute(Sender: TObject);
begin
  if MessageBox(Handle,
    'Вы уберены что хотите удалить?', PChar(Caption),
    MB_ICONQUESTION + MB_YESNO) = IDYES then

  with DM.ToursDates do
  begin
    First;
    while not EOF do
      Delete;
  end;
  
  Dm.Tours.Delete;
end;

procedure TMainForm.DelUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (Dm.Tours.RecordCount > 0);
end;

procedure TMainForm.ReFrashExecute(Sender: TObject);
begin
  if MessageBox(Handle,
    'При этой операции все изменения, которые быле произведены, будут утеряны.' + #13#10+
    'Вы точно уверены что хотите это делать ?', PChar(Caption),
    MB_ICONQUESTION + MB_YESNO) = IDNO then Exit;

  Screen.Cursor := crHourGlass;
  try
    Dm.Refresh;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TMainForm.StatusBarUpdateUpdate(Sender: TObject);
begin
  StatusBar.Panels[0].Text :=
    Format('T: %d', [DM.Tours.ChangeCount]);
end;

procedure TMainForm.FillNames(List: TStringList);
var
  SavePlace: TBookmark;
begin
  with DM.Tours do
  begin
    DisableControls;
    SavePlace := GetBookmark;
    try
      First;
      while not EOF do
      begin
        List.Add(FieldValues['name']);
        Next;
      end;
      GotoBookmark(SavePlace);
    finally
       FreeBookmark(SavePlace);
    end;
    EnableControls;
  end;
end;

end.
