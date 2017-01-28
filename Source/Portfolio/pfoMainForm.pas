unit pfoMainForm;

interface

uses
  Forms, Classes, Controls,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxEdit,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxControls,
  cxGridCustomView, cxGridLevel, cxGrid, ComCtrls, TBSkinPlus, cxContainer,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, TB2Item, TB2Dock, TB2Toolbar,
  ActnList, cxDBData, cxGridDBTableView, StdActns, ImgList, Menus,
  PluginManagerIntf, DB;

type
  TMainForm = class(TForm)
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBSubmenuItem1: TTBSubmenuItem;
    TBItem3: TTBItem;
    TBItem5: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBItem8: TTBItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBItem18: TTBItem;
    TBSeparatorItem2: TTBSeparatorItem;
    TBItem7: TTBItem;
    TBItem12: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBItem9: TTBItem;
    TBSkin1: TTBSkin;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    ActionList1: TActionList;
    NewItem: TAction;
    GridDBTableView1: TcxGridDBTableView;
    GridDBTableView1DBtitle: TcxGridDBColumn;
    ImageList1: TImageList;
    EditItem: TAction;
    DelItem: TAction;
    FileExit1: TFileExit;
    TBPopupMenu1: TTBPopupMenu;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBSeparatorItem5: TTBSeparatorItem;
    TBItem4: TTBItem;
    cxGrid1DBTableView2: TcxGridDBTableView;
    cxGrid1TableView1: TcxGridTableView;
    Refresh: TAction;
    TBSeparatorItem6: TTBSeparatorItem;
    TBItem6: TTBItem;
    procedure RefreshExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
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

uses pfoDataModule, pfoEditorRecords, Windows, SysUtils;

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
  GridDBTableView1.DataController.DataSource := DM.dsPortfolio;
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

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  DM.Free;
end;

end.
