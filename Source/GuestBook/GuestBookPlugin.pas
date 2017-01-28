unit GuestBookPlugin;

interface

uses PluginManagerIntf, PluginIntf, ControlPanelElementIntf,
  Graphics, DataModuleIntf;

type
  TGuestBookPlugin = class (TPlugin, IPlugin, IControlPanelElement, IDataModule)
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

uses Windows, gbMainForm, SysUtils;

function RegisterPlugin(Module: HMODULE; PluginManager: IPluginManager): Boolean;
var
  Plugin: IInterface;
begin
  Plugin := TGuestBookPlugin.Create(Module, PluginManager);
  Result := PluginManager.RegisterPlugin(Plugin);
end;

{ TGuestBookPlugin }

constructor TGuestBookPlugin.Create(Module: HMODULE;
  PluginManager: IPluginManager);
begin
  inherited;
  FBitmap := Graphics.TBitmap.Create;
  FDisplayName := 'Гостевая книга';
  FBitmap.Handle := LoadBitmap(Module, 'PLUGIN_ICON');
end;

destructor TGuestBookPlugin.Destroy;
begin
  FBitmap.Free;
  inherited;
end;

function TGuestBookPlugin.Execute: Boolean;
begin
  Result := GetMainForm(FPluginManager, FDataPath) = IDOK;
end;

function TGuestBookPlugin.GetBitmap: Graphics.TBitmap;
begin
  Result := FBitmap;
end;

function TGuestBookPlugin.GetDataPath: String;
begin
  Result := FDataPath;
end;

function TGuestBookPlugin.GetDescription: string;
begin
  Result := 'Гостевая книга';
end;

function TGuestBookPlugin.GetDisplayName: string;
begin
  Result := FDisplayName;
end;

function TGuestBookPlugin.GetName: string;
begin
  Result := 'GuestBookPlugin';
end;

function TGuestBookPlugin.Load: Boolean;
begin
  Result := True;
end;

procedure TGuestBookPlugin.SetDataPath(const Value: String);
begin
  FDataPath := Value;
end;

procedure TGuestBookPlugin.SetDisplayName(const Value: string);
begin
  FDisplayName := Value;
end;

function TGuestBookPlugin.UnLoad: Boolean;
begin
  Result := True;
end;

end.
