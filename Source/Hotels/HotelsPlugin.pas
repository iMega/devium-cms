unit HotelsPlugin;

interface

uses PluginIntf, ControlPanelElementIntf, DataModuleIntf, Graphics,
  PluginManagerIntf;

type
  THotelsPlugin = class(TPlugin, IPlugin, IControlPanelElement, IDataModule)
  private
    FDisplayName: string;
    FDescription: String;
    FBitmap: TBitmap;
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

uses Windows, SysUtils, HotelsMainForm;

function RegisterPlugin(Module: HMODULE; PluginManager: IPluginManager): Boolean;
var
  Plugin: IInterface;
begin
  Plugin := THotelsPlugin.Create(Module, PluginManager);
  Result := PluginManager.RegisterPlugin(Plugin);
end;

{ THotelsPlugin }

procedure THotelsPlugin.ApplyUpdates;
begin
end;

function THotelsPlugin.CanApplyUpdates: Boolean;
begin
  Result := False;
end;

procedure THotelsPlugin.Close;
begin
end;

constructor THotelsPlugin.Create(Module: HMODULE;
  PluginManager: IPluginManager);
begin
  inherited;
  FBitmap := Graphics.TBitmap.Create;
  FBitmap.Handle := LoadBitmap(Module, 'PLUGIN_ICON');
  FDisplayName := 'Отели';
  FDescription := 'Управление отелями';
end;

destructor THotelsPlugin.Destroy;
begin
  FBitmap.Free;
  inherited;
end;

function THotelsPlugin.Execute: Boolean;
begin
  Result := (GetMainForm(FPluginManager, FDataBasePath) = IDOK);
end;

function THotelsPlugin.GetBitmap: Graphics.TBitmap;
begin
  Result := FBitmap;
end;

function THotelsPlugin.GetDataBasePath: String;
begin
  Result := FDataBasePath;
end;

function THotelsPlugin.GetDataPath: String;
begin

end;

function THotelsPlugin.GetDescription: string;
begin
  Result := FDescription;
end;

function THotelsPlugin.GetDisplayName: string;
begin
  Result := FDisplayName;
end;

function THotelsPlugin.GetName: string;
begin
  Result := 'HotelsPlugin';
end;

function THotelsPlugin.Load: Boolean;
begin
  Result := True;
end;

procedure THotelsPlugin.Open;
begin
end;

procedure THotelsPlugin.SetDataBasePath(const Value: String);
begin
  FDataBasePath := IncludeTrailingPathDelimiter(Value);
end;

procedure THotelsPlugin.SetDataPath(const Value: String);
begin

end;

procedure THotelsPlugin.SetDisplayName(const Value: string);
begin
  FDisplayName := Value;
end;

function THotelsPlugin.UnLoad: Boolean;
begin
  Result := True;
end;

end.
