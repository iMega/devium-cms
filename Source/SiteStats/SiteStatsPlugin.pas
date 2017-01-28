unit SiteStatsPlugin;

interface

uses PluginManagerIntf, PluginIntf, ControlPanelElementIntf, Graphics,
  DataModuleIntf;

type
  TSiteStatsPlugin = class (TPlugin, IPlugin, IControlPanelElement, IDataModule)
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

uses Windows, SiteStatsFrm;

function RegisterPlugin(Module: HMODULE; PluginManager: IPluginManager): Boolean;
var
  Plugin: IInterface;
begin
  Plugin := TSiteStatsPlugin.Create(Module, PluginManager);
  Result := PluginManager.RegisterPlugin(Plugin);
end;

{ TSiteStatsPlugin }

constructor TSiteStatsPlugin.Create(Module: HMODULE;
  PluginManager: IPluginManager);
begin
  inherited;
  FBitmap := Graphics.TBitmap.Create;
  FDisplayName := 'Статистика';
  FBitmap.Handle := LoadBitmap(Module, 'PLUGIN_ICON');
end;

destructor TSiteStatsPlugin.Destroy;
begin
  FBitmap.Free;
  inherited;
end;

function TSiteStatsPlugin.Execute: Boolean;
begin
  Result := GetMainForm(FPluginManager, FDataPath) = IDOK;
end;

function TSiteStatsPlugin.GetBitmap;
begin
  Result := FBitmap;
end;

function TSiteStatsPlugin.GetDataPath: String;
begin
  Result := FDataPath;
end;

function TSiteStatsPlugin.GetDescription: string;
begin
  Result := 'Статистика сайта';
end;

function TSiteStatsPlugin.GetDisplayName: string;
begin
  Result := FDisplayName;
end;

function TSiteStatsPlugin.GetName: string;
begin
  Result := 'SiteStatPlugin';
end;

function TSiteStatsPlugin.Load: Boolean;
begin
  Result := True;
end;

procedure TSiteStatsPlugin.SetDataPath(const Value: String);
begin
  FDataPath := Value;
end;

procedure TSiteStatsPlugin.SetDisplayName(const Value: string);
begin
  FDisplayName := Value;
end;

function TSiteStatsPlugin.UnLoad: Boolean;
begin
  Result := True;
end;

end.
