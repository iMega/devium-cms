unit ImageEditorPlugin;

interface

uses PluginManagerIntf, PluginIntf, ControlPanelElementIntf, Graphics,
  DataModuleIntf;

type
  TImageEditorPlugin = class (TPlugin, IPlugin, IControlPanelElement, IDataModule)
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

uses Windows, mainFrm;

function RegisterPlugin(Module: HMODULE; PluginManager: IPluginManager): Boolean;
var
  Plugin: IInterface;
begin
  Plugin := TImageEditorPlugin.Create(Module, PluginManager);
  Result := PluginManager.RegisterPlugin(Plugin);
end;

{ TImageEditorPlugin }

constructor TImageEditorPlugin.Create(Module: HMODULE;
  PluginManager: IPluginManager);
begin
  inherited;
  FBitmap := Graphics.TBitmap.Create;
  FDisplayName := 'Графический редактор';
  FBitmap.Handle := LoadBitmap(Module, 'PLUGIN_ICON');
end;

destructor TImageEditorPlugin.Destroy;
begin
  FBitmap.Free;
  inherited;
end;

function TImageEditorPlugin.Execute: Boolean;
begin
  Result := GetMainForm = IDOK;
end;

function TImageEditorPlugin.GetBitmap: Graphics.TBitmap;
begin
  Result := FBitmap;
end;

function TImageEditorPlugin.GetDataPath: String;
begin
  Result := FDataPath;
end;

function TImageEditorPlugin.GetDescription: string;
begin
  Result := 'bla-bla';
end;

function TImageEditorPlugin.GetDisplayName: string;
begin
  Result := FDisplayName;
end;

function TImageEditorPlugin.GetName: string;
begin
  Result := 'ImageEditorPlugin';
end;

function TImageEditorPlugin.Load: Boolean;
begin
  Result := True;
end;

procedure TImageEditorPlugin.SetDataPath(const Value: String);
begin
  FDataPath := Value;
end;

procedure TImageEditorPlugin.SetDisplayName(const Value: string);
begin
  FDisplayName := Value;
end;

function TImageEditorPlugin.UnLoad: Boolean;
begin
  Result := True;
end;

end.
