{----------------------------------------------------------------------

   DEVIUM Content Management System
   Copyright (C) 2004 by DEIV Development Team.
   http://www.deiv.com/

   $Header: /devium/Devium\040CMS\0402/Source/ControlPanel/cpSitesForm.pas,v 1.3 2004/05/06 16:00:07 paladin Exp $

------------------------------------------------------------------------}
unit cpSitesForm;

interface

uses
  Forms, TBSkinPlus, TB2Dock, TB2Toolbar, Classes, Controls, ExtCtrls,
  ComCtrls, cpSitesList, ActnList, TB2Item, PluginManagerIntf, ImgList;

type
  TSitesForm = class(TForm)
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBSkin: TTBSkin;
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    SitesTree: TTreeView;
    ListView: TListView;
    PluginsImageList: TImageList;
    ImageList16: TImageList;
    ActionList1: TActionList;
    NewDir: TAction;
    DelDir: TAction;
    EdtDir: TAction;
    TBSubmenuItem1: TTBSubmenuItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    procedure SitesTreeEdited(Sender: TObject; Node: TTreeNode;
      var S: String);
    procedure SitesTreeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListViewChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure SitesTreeChange(Sender: TObject; Node: TTreeNode);
  private
    FSitesList: TSitesList;
    FPluginManager: IPluginManager;
    procedure SetSitesList(const Value: TSitesList);
    procedure FillSites;
  public
    procedure FillPluginList;
    property SitesList: TSitesList read FSitesList write SetSitesList;
    property PluginManager: IPluginManager read FPluginManager write FPluginManager;

  end;

function GetSitesForm(SitesList: TSitesList; PluginManager: IPluginManager): Integer;

implementation

uses cpMainForm, SysUtils, ControlPanelElementIntf, Windows, IniFiles,
  PluginIntf;

{$R *.dfm}

function GetSitesForm;
var
  Form: TSitesForm;
begin
  Form := TSitesForm.Create(Application);
  try
    Form.SitesList := SitesList;
    Form.PluginManager := PluginManager;
    Form.FillPluginList;
    Result := Form.ShowModal;
  finally
    Form.Free;
  end;
end;

{ TSitesForm }

procedure TSitesForm.FillSites;
var
  i: Integer;
  Node: TTreeNode;
begin
  SitesTree.Items.Clear;
  SitesTree.Items.BeginUpdate;
  for i := 0 to FSitesList.Count - 1 do
  begin
    Node := SitesTree.Items.AddObject(nil, FSitesList[i].Name, FSitesList[i]);
    Node.ImageIndex := 121;
    Node.SelectedIndex := 121;
  end;
  SitesTree.Items.EndUpdate;
end;

procedure TSitesForm.SetSitesList(const Value: TSitesList);
begin
  FSitesList := Value;
  FillSites;
end;

procedure TSitesForm.FillPluginList;
var
  li: TListItem;
  i: Integer;
  Element: IControlPanelElement;
begin
  ListView.Clear;
  ListView.Items.BeginUpdate;
  try
    for i := 0 to FPluginManager.Plugins.Count - 1 do
    begin
      if Supports(FPluginManager.Plugins[i], IControlPanelElement, Element) then
      begin
        li :=  ListView.Items.Add;
        li.Data := Pointer(FPluginManager.Plugins[i]);
        li.Caption :=  Element.DisplayName;
        li.SubItems.Add(Element.Description);
        li.ImageIndex := PluginsImageList.AddMasked(Element.Bitmap, $00FF00FF);
      end;
    end;
  finally
    ListView.Items.EndUpdate;
  end;
end;

procedure TSitesForm.SitesTreeEdited(Sender: TObject; Node: TTreeNode;
  var S: String);
begin
  RenameFile(FSitesList.Path + Node.Text, FSitesList.Path + S);
  TSite(Node.Data).Name := S;
end;

procedure TSitesForm.SitesTreeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F2 then
    TTreeView(Sender).Selected.EditText;
end;

procedure TSitesForm.ListViewChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
var
  ini: TIniFile;
  Path: String;
  Plugin: IPlugin;
begin
  if not Assigned(SitesTree.Selected) then Exit;
  
  Path := TSite(SitesTree.Selected.Data).Path;
  ini := TIniFile.Create(Path + 'settings.ini');
  try
    if Supports(IInterface(Item.Data), IPlugin, Plugin) then
    begin
      ini.WriteBool('Plugins', Plugin.Name, Item.Checked);
    end;
  finally
    ini.Free;
  end;
end;

procedure TSitesForm.SitesTreeChange(Sender: TObject; Node: TTreeNode);
var
  i: Integer;
  Plugin: IPlugin;
  ini: TIniFile;
  Path: String;
begin
  if not Assigned(SitesTree.Selected) then Exit;

  // Р Р°СЃРЅРѕРІР»СЏРµРј РіР°Р»РєРё
  Path := TSite(SitesTree.Selected.Data).Path;
  ini := TIniFile.Create(Path + 'settings.ini');
  try
    for i := 0 to ListView.Items.Count - 1  do
    begin
      if Supports(IInterface(ListView.Items[i].Data), IPlugin, Plugin) then
        ListView.Items[i].Checked := ini.ReadBool('Plugins', Plugin.Name, False);
    end;
  finally
    ini.Free;
  end;
end;

end.

