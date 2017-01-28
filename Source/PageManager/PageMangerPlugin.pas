unit PageMangerPlugin;

interface

uses PluginManagerIntf, PluginIntf, DataModuleIntf,
  ControlPanelElementIntf, Graphics, LinkBrowserIntf;

type
  TPageMangerPlugin = class(TPlugin, IPlugin, IDataModule,
    IControlPanelElement, ILinkBrowser)
  private
    FDataPath: String;
    FDescription: String;
    FDisplayName: string;
    FBitmap: TBitmap; 
  public
    constructor Create(Module: HMODULE; PluginManager: IPluginManager);
    destructor Destroy; override;
    { IPlugin }
    function GetName: string;
    function Load: Boolean;
    function UnLoad: Boolean;
    { IDataModule }
    function GetDataPath: String;
    procedure SetDataPath(const Value: String);
    { IControlPanelElement }
    function Execute: Boolean;
    function GetDescription: string;
    function GetDisplayName: string;
    function GetBitmap: TBitmap;
    { ILinkBrowser }
    function ILinkBrowser.Execute = ExecuteBrowser;
    function ExecuteBrowser(var S: String): Boolean;
    function ILinkBrowser.GetName = GetBrowserName;
    function GetBrowserName: string;
  end;

function RegisterPlugin(Module: HMODULE; PluginManager: IPluginManager): Boolean;

exports RegisterPlugin;

implementation

uses SysUtils, Windows, PageMangerMainForm, PageTreeForm;

function RegisterPlugin(Module: HMODULE; PluginManager: IPluginManager): Boolean;
var
  Plugin: IInterface;
begin
  Plugin := TPageMangerPlugin.Create(Module, PluginManager);
  Result := PluginManager.RegisterPlugin(Plugin);
end;

{ TPageMangerPlugin }

constructor TPageMangerPlugin.Create(Module: HMODULE;
  PluginManager: IPluginManager);
begin
  inherited;
  FBitmap := Graphics.TBitmap.Create;
  FDisplayName := 'Редактор страниц';
  FDescription := 'Редактор разделов для страниц';
  FBitmap.Handle := LoadBitmap(Module, 'PLUGIN_ICON');
end;

destructor TPageMangerPlugin.Destroy;
begin
  FBitmap.Free;
  inherited;
end;

function TPageMangerPlugin.Execute: Boolean;
begin
  Result := (GetMainForm(FPluginManager, FDataPath) = IDOK);
end;

function TPageMangerPlugin.ExecuteBrowser(var S: String): Boolean;
begin
  Result := (GetTreeForm(FPluginManager, FDataPath, S) = IDOK);    
end;

function TPageMangerPlugin.GetBitmap: Graphics.TBitmap;
begin
  Result := FBitmap; 
end;

function TPageMangerPlugin.GetBrowserName: string;
begin
  Result := 'Карта сайта';
end;

function TPageMangerPlugin.GetDataPath: String;
begin
  Result := FDataPath;
end;

function TPageMangerPlugin.GetDescription: string;
begin
  Result := FDescription;
end;

function TPageMangerPlugin.GetDisplayName: string;
begin
  Result := FDisplayName;
end;

function TPageMangerPlugin.GetName: string;
begin
  Result := 'PageMangerPlugin';
end;

function TPageMangerPlugin.Load: Boolean;
begin
  Result := True;
end;

procedure TPageMangerPlugin.SetDataPath(const Value: String);
begin
  FDataPath := IncludeTrailingPathDelimiter(Value);
end;

function TPageMangerPlugin.UnLoad: Boolean;
begin
  Result := True;
end;

end.
