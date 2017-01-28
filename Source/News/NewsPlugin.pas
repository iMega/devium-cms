unit NewsPlugin;

interface

uses PluginManagerIntf, PluginIntf, ControlPanelElementIntf, Graphics,
  DataModuleIntf;

type
  TNewsPlugin = class (TPlugin, IPlugin, IControlPanelElement, IDataModule)
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

uses Windows, NewsMainForm;

function RegisterPlugin(Module: HMODULE; PluginManager: IPluginManager): Boolean;
var
  Plugin: IInterface;
begin
  Plugin := TNewsPlugin.Create(Module, PluginManager);
  Result := PluginManager.RegisterPlugin(Plugin);
end;

{ TNewsPlugin }

constructor TNewsPlugin.Create(Module: HMODULE;
  PluginManager: IPluginManager);
begin
  inherited;
  FBitmap := Graphics.TBitmap.Create;
  FDisplayName := 'News';
  FBitmap.Handle := LoadBitmap(Module, 'PLUGIN_ICON');
end;

destructor TNewsPlugin.Destroy;
begin
  FBitmap.Free;
  inherited;
end;

function TNewsPlugin.Execute: Boolean;
begin
  Result := GetMainForm(FPluginManager, FDataPath) = IDOK;
end;

function TNewsPlugin.GetBitmap: Graphics.TBitmap;
begin
  Result := FBitmap;
end;

function TNewsPlugin.GetDataPath: String;
begin
  Result := FDataPath;
end;

function TNewsPlugin.GetDescription: string;
begin
  Result := 'bla-bla';
end;

function TNewsPlugin.GetDisplayName: string;
begin
  Result := FDisplayName;
end;

function TNewsPlugin.GetName: string;
begin
  Result := 'NewsPlugin';
end;

function TNewsPlugin.Load: Boolean;
begin
  Result := True;
end;

procedure TNewsPlugin.SetDataPath(const Value: String);
begin
  FDataPath := Value;
end;

procedure TNewsPlugin.SetDisplayName(const Value: string);
begin
  FDisplayName := Value;
end;

function TNewsPlugin.UnLoad: Boolean;
begin
  Result := True;
end;

end.
