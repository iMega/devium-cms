unit ForumPlugin;

interface

uses PluginManagerIntf, PluginIntf, ControlPanelElementIntf, Graphics,
  DataModuleIntf;

type
  TForumPlugin = class (TPlugin, IPlugin, IControlPanelElement, IDataModule)
  private
    FDisplayName: string;
    FBitmap: TBitmap;
    FDataPath: String;
  public
    constructor Create(Module: HMODULE; PluginManager: IPluginManager);
    destructor Destroy; override;
    function Execute: Boolean;
    function GetDescription: string;
    function GetDisplayName: string;
    function GetBitmap: TBitmap;
    function GetName: string;
    function Load: Boolean;
    procedure SetDisplayName(const Value: string);
    function UnLoad: Boolean;
    { IDataModule }
    function GetDataPath: String;
    procedure SetDataPath(const Value: String);
  end;

function RegisterPlugin(Module: HMODULE; PluginManager: IPluginManager): Boolean;

exports RegisterPlugin;

implementation

uses Windows, uForumForm;

function RegisterPlugin(Module: HMODULE; PluginManager: IPluginManager): Boolean;
var
  Plugin: IInterface;
begin
  Plugin := TForumPlugin.Create(Module, PluginManager);
  Result := PluginManager.RegisterPlugin(Plugin);
end;

{ TNewsPlugin }

constructor TForumPlugin.Create(Module: HMODULE;
  PluginManager: IPluginManager);
begin
  inherited;
  FBitmap := Graphics.TBitmap.Create;
  FDisplayName := 'Мега форум';
  FBitmap.Handle := LoadBitmap(Module, 'PLUGIN_ICON');
end;

destructor TForumPlugin.Destroy;
begin
  FBitmap.Free;
  inherited;
end;

function TForumPlugin.Execute: Boolean;
begin
  Result := True;
  ShowForumForm(FPluginManager, FDataPath);
end;

function TForumPlugin.GetBitmap: Graphics.TBitmap;
begin
  Result := FBitmap;
end;

function TForumPlugin.GetDataPath: String;
begin
  Result := FDataPath;
end;

function TForumPlugin.GetDescription: string;
begin
  Result := 'bla-bla';
end;

function TForumPlugin.GetDisplayName: string;
begin
  Result := FDisplayName;
end;

function TForumPlugin.GetName: string;
begin
  Result := 'ForumPlugin';
end;

function TForumPlugin.Load: Boolean;
begin
  Result := True;
end;

procedure TForumPlugin.SetDataPath(const Value: String);
begin
  FDataPath := Value;
end;

procedure TForumPlugin.SetDisplayName(const Value: string);
begin
  FDisplayName := Value;
end;

function TForumPlugin.UnLoad: Boolean;
begin
  Result := True;
end;

end.
