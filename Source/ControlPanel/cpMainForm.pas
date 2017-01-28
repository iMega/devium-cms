{----------------------------------------------------------------------

   DEVIUM Content Management System
   Copyright (C) 2004 by DEIV Development Team.
   http://www.deiv.com/

   $Header: /devium/Devium\040CMS\0402/Source/ControlPanel/cpMainForm.pas,v 1.4 2004/05/06 16:00:07 paladin Exp $

------------------------------------------------------------------------}
unit cpMainForm;

interface

uses
  Forms, Classes, Controls, ComCtrls, ExtCtrls, TBSkinPlus, ImgList,
  ActnList, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, TB2Item, TB2Dock, TB2Toolbar, StdCtrls, Graphics,
  PluginManagerIntf, cpSitesList, SettingsIntf, RzSndMsg, IniFiles;

type
  TMainForm = class(TForm)
    MainPanel: TPanel;
    Image1: TImage;
    TopLine: TPaintBox;
    CloseButton: TImage;
    BottomPanel: TPanel;
    ToolBarHint: TLabel;
    BottomToolBar: TTBToolbar;
    TBItem6: TTBItem;
    TBItem2: TTBItem;
    TBItem4: TTBItem;
    TBItem3: TTBItem;
    Panel1: TPanel;
    Label1: TLabel;
    SitesList: TcxComboBox;
    EditSitesList: TTBToolbar;
    TBItem1: TTBItem;
    PluginList: TListView;
    ActionList: TActionList;
    EditSites: TAction;
    Send: TAction;
    Action3: TAction;
    Action4: TAction;
    Config: TAction;
    ImageList20: TImageList;
    TBSkin: TTBSkin;
    PluginsImageList: TImageList;
    SendMessage: TRzSendMessage;
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CloseButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure EditSitesExecute(Sender: TObject);
    procedure ConfigExecute(Sender: TObject);
    procedure SitesListPropertiesChange(Sender: TObject);
    procedure SendExecute(Sender: TObject);
    procedure PluginListDblClick(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
  private
    FPluginManager: IPluginManager;
    FSitesList: TSitesList;
    FPath: String;
    FSetings: ISettings;
    FIniFile: TIniFile;
    procedure LoadProjectList;
    procedure FillProjectList;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses Windows, Messages, PluginManager, SysUtils, cpSitesForm,
  SettingsPlugin, cpSettingsForm, ControlPanelElementIntf,
  DataModuleIntf, ShellAPI, Dialogs, PluginIntf;

const
  INI_MAIN = 'Main';
  INI_CURRENT = 'Current';


procedure TMainForm.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Windows.ReleaseCapture;
  Windows.SendMessage(Handle, WM_SYSCOMMAND, $F012, 0);
end;

procedure TMainForm.CloseButtonClick(Sender: TObject);
begin
  Close
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  FPath := ExtractFilePath(ParamStr(0));

  FIniFile := TIniFile.Create(FPath + 'config.ini');

  // init plugin manager
  FPluginManager := TPluginManager.Create;
  // ISetings
  FSetings := TSettingsPlugin.Create(0, FPluginManager);
  FPluginManager.RegisterPlugin(FSetings);
  // load all plugins
  FPluginManager.LoadPlugins;
  // init sites list
  FSitesList := TSitesList.Create(FPath + 'data');
  // misc
  LoadProjectList;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FSitesList);
  FPluginManager.UnloadPlugins;
  FSetings := nil;
  FPluginManager := nil;
  FIniFile.Free;
end;

// Загружаем список проектов
procedure TMainForm.LoadProjectList;
var
  i: Integer;
begin
  SitesList.Properties.Items.Clear;
  SitesList.Properties.Items.BeginUpdate;
  for i := 0 to FSitesList.Count - 1 do
    SitesList.Properties.Items.AddObject(FSitesList[i].Name, FSitesList[i]);
  SitesList.Properties.EndUpdate;
  SitesList.ItemIndex := FIniFile.ReadInteger(INI_MAIN, INI_CURRENT, 0);
end;

procedure TMainForm.EditSitesExecute(Sender: TObject);
begin
  GetSitesForm(FSitesList, FPluginManager);
  LoadProjectList;
  FillProjectList;
end;

procedure TMainForm.ConfigExecute(Sender: TObject);
begin
  GetSettingsForm(FPluginManager);
end;

procedure TMainForm.SitesListPropertiesChange(Sender: TObject);
var
  LPath: String;
begin
  if SitesList.ItemIndex = -1 then Exit;
  LPath := TSite(SitesList.Properties.Items.Objects[SitesList.ItemIndex]).Path;
  FSetings.Load(LPath);
  FillProjectList;
  // сохранение последнего сайта
  FIniFile.WriteInteger(INI_MAIN, INI_CURRENT, SitesList.ItemIndex);
end;

procedure TMainForm.SendExecute(Sender: TObject);
begin
  SendMessage.Send;
end;

procedure TMainForm.FillProjectList;
var
  i: Integer;
  Element: IControlPanelElement;
  li: TListItem;
  Site: TSite;
  ini: TIniFile;
  Plugin: IPlugin;
begin
  PluginList.Clear;
  PluginsImageList.Clear;
  PluginList.Items.BeginUpdate;
  Site := FSitesList[SitesList.ItemIndex];
  ini := TIniFile.Create(Site.Path + 'settings.ini');
  try
    for i := 0 to FPluginManager.Plugins.Count - 1 do
    begin
      if Supports(FPluginManager.Plugins[i], IControlPanelElement, Element) then
      begin
        Supports(FPluginManager.Plugins[i], IPlugin, Plugin);
        if ini.ReadBool('Plugins', Plugin.Name, False)  then
        begin
          li := PluginList.Items.Add;
          li.Caption := Element.DisplayName;
          li.Data := Pointer(FPluginManager.Plugins[i]);
          li.ImageIndex := PluginsImageList.AddMasked(Element.Bitmap, $00FF00FF);
        end;
      end;
    end;
  finally
    ini.Free;
  end;
  PluginList.Items.EndUpdate;
end;

procedure TMainForm.PluginListDblClick(Sender: TObject);
var
  Element: IControlPanelElement;
  Intf: IInterface;
  DataModule: IDataModule;
  Site: TSite;
begin
  if PluginList.ItemIndex = -1 then Exit;
  Site := FSitesList[SitesList.ItemIndex];

  Intf := IInterface(PluginList.Items[PluginList.ItemIndex].Data);
  if Supports(Intf, IDataModule, DataModule) then
    DataModule.DataPath := Site.Path;
  if Supports(Intf, IControlPanelElement, Element) then
    Element.Execute;
end;

procedure TMainForm.Action3Execute(Sender: TObject);
begin
  ShellExecute(0, 'open', PChar('devium.chm'), nil, nil, SW_SHOWNORMAL);
end;

end.



