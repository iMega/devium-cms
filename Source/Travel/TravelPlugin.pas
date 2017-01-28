unit TravelPlugin;

interface

uses PluginManagerIntf, PluginIntf, ControlPanelElementIntf,
  Graphics, DataModuleIntf;

type
  TTravelPlugin = class(TPlugin, IPlugin, IControlPanelElement, IDataModule)
  private
    FDisplayName: string;
    FDescription: String;
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
    property Description: string read GetDescription;
    property DisplayName: string read GetDisplayName write SetDisplayName;
    property Bitmap: TBitmap read GetBitmap;
    property Name: string read GetName;
    { IDataModule }
    function GetDataPath: String;
    procedure SetDataPath(const Value: String);
    property DataPath: String read GetDataPath write SetDataPath;
  end;
  
function RegisterPlugin(Module: HMODULE; PluginManager: IPluginManager): Boolean;

exports RegisterPlugin;

implementation

uses Windows, TravelMainForm;

function RegisterPlugin(Module: HMODULE; PluginManager: IPluginManager): Boolean;
var
  Plugin: IInterface;
begin
  Plugin := TTravelPlugin.Create(Module, PluginManager);
  Result := PluginManager.RegisterPlugin(Plugin);
end;

{ TTyresPlugin }

constructor TTravelPlugin.Create(Module: HMODULE;
  PluginManager: IPluginManager);
begin
  inherited;
  FBitmap := Graphics.TBitmap.Create;
  FBitmap.Handle := LoadBitmap(Module, 'PLUGIN_ICON');
  FDisplayName := 'Туры';
  FDescription := 'Управление турами';
end;

destructor TTravelPlugin.Destroy;
begin
  FBitmap.Free;
  inherited;
end;

function TTravelPlugin.Execute: Boolean;
begin
  Result := (GetMainForm(FPluginManager, FDataPath) = idOK);
end;

function TTravelPlugin.GetDescription: string;
begin
  Result := FDescription;
end;

function TTravelPlugin.GetDisplayName: string;
begin
  Result := FDisplayName;
end;

function TTravelPlugin.GetBitmap: Graphics.TBitmap;
begin
  Result := FBitmap;
end;

function TTravelPlugin.GetName: string;
begin
  Result := 'TravelPlugin';
end;

function TTravelPlugin.Load: Boolean;
begin
  Result := True;
end;

procedure TTravelPlugin.SetDisplayName(const Value: string);
begin
  FDisplayName := Value;
end;

function TTravelPlugin.UnLoad: Boolean;
begin
  Result := True;
end;

function TTravelPlugin.GetDataPath: String;
begin
  Result := FDataPath;
end;

procedure TTravelPlugin.SetDataPath(const Value: String);
begin
  FDataPath := Value;
end;

end.
