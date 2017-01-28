unit uForumForm;

interface

uses
  Forms, PluginManagerIntf, ImgList, Controls, Menus, TB2Item, TBSkinPlus,
  Classes, ActnList, ComCtrls, TB2Dock, TB2Toolbar;

type
  TForumForm = class(TForm)
    ActionList: TActionList;
    aRefresh: TAction;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    StatusBar: TStatusBar;
    TBSkin: TTBSkin;
    TBSubmenuItem1: TTBSubmenuItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    TBItem5: TTBItem;
    TBPopupMenu1: TTBPopupMenu;
    ImageList20: TImageList;
    StatusBarUpDate: TAction;
    procedure aRefreshExecute(Sender: TObject);
    procedure StatusBarUpDateUpdate(Sender: TObject);
  private
    FPluginManager: IPluginManager;
    FPath: String;
    procedure SetPluginManager(const Value: IPluginManager);
    procedure SetPath(const Value: String);
  public
    property PluginManager: IPluginManager read FPluginManager write SetPluginManager;
    property Path: String read FPath write SetPath;
  end;

 function ShowForumForm(APluginManager : IPluginManager;DataPath : string) : integer;

implementation

uses DateUtils, ForumDM, Windows;

{$R *.dfm}

function ShowForumForm(APluginManager : IPluginManager;DataPath : string) : integer;
begin
  with TForumForm.Create(Application) do
    try
      PluginManager := APluginManager;
      Path := DataPath;
      Result := ShowModal;
    finally
      Free;
    end;
end;

procedure TForumForm.aRefreshExecute(Sender: TObject);
begin
  if MessageBox(Handle,
    'РџСЂРё СЌС‚РѕР№ РѕРїРµСЂР°С†РёРё РІСЃРµ РёР·РјРµРЅРµРЅРёСЏ, РєРѕС‚РѕСЂС‹Рµ Р±С‹Р»Рµ РїСЂРѕРёР·РІРµРґРµРЅС‹, Р±СѓРґСѓС‚ СѓС‚РµСЂСЏРЅС‹.' + #13#10+
    'Р’С‹ С‚РѕС‡РЅРѕ СѓРІРµСЂРµРЅС‹ С‡С‚Рѕ С…РѕС‚РёС‚Рµ СЌС‚Рѕ РґРµР»Р°С‚СЊ ?', PChar(Caption),
    MB_ICONQUESTION + MB_YESNO) = IDNO then Exit;

  Screen.Cursor := crHourGlass;
  try
    DM.Refresh;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TForumForm.SetPath(const Value: String);
begin
  FPath := Value;
end;

procedure TForumForm.SetPluginManager(const Value: IPluginManager);
begin
  FPluginManager := Value;
  DM := TDM.Create(Application);
  DM.DataPath := FPath;
  DM.PluginManager := FPluginManager;
  Dm.Open;
end;

procedure TForumForm.StatusBarUpDateUpdate(Sender: TObject);
begin
  StatusBar.Panels[0].Text  := DM.GetStatsuBarString;
end;

end.
