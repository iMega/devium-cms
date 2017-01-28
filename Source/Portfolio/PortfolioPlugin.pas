unit PortfolioPlugin;

interface

uses PluginManagerIntf, PluginIntf, ControlPanelElementIntf, Graphics,
  DataModuleIntf;

type
  TPortfolioPlugin = class (TPlugin, IPlugin, IControlPanelElement, IDataModule)
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

uses Windows, pfoMainForm;

function RegisterPlugin(Module: HMODULE; PluginManager: IPluginManager): Boolean;
var
  Plugin: IInterface;
begin
  Plugin := TPortfolioPlugin.Create(Module, PluginManager);
  Result := PluginManager.RegisterPlugin(Plugin);
end;

{ TPortfolioPlugin }

constructor TPortfolioPlugin.Create(Module: HMODULE;
  PluginManager: IPluginManager);
begin
  inherited;
  FBitmap := Graphics.TBitmap.Create;
  FDisplayName := 'Портфолио';
  FBitmap.Handle := LoadBitmap(Module, 'PLUGIN_ICON');
end;

destructor TPortfolioPlugin.Destroy;
begin
  FBitmap.Free;
  inherited;
end;

function TPortfolioPlugin.Execute: Boolean;
begin
  Result := GetMainForm(FPluginManager, FDataPath) = IDOK;
end;

function TPortfolioPlugin.GetBitmap: Graphics.TBitmap;
begin
  Result := FBitmap;
end;

function TPortfolioPlugin.GetDataPath: String;
begin
  Result := FDataPath;
end;

function TPortfolioPlugin.GetDescription: string;
begin
  Result := 'Портфолио';
end;

function TPortfolioPlugin.GetDisplayName: string;
begin
  Result := FDisplayName;
end;

function TPortfolioPlugin.GetName: string;
begin
  Result := 'PortfolioPlugin';
end;

function TPortfolioPlugin.Load: Boolean;
begin
  Result := True;
end;

procedure TPortfolioPlugin.SetDataPath(const Value: String);
begin
  FDataPath := Value;
end;

procedure TPortfolioPlugin.SetDisplayName(const Value: string);
begin
  FDisplayName := Value;
end;

function TPortfolioPlugin.UnLoad: Boolean;
begin
  Result := True;
end;

end.
