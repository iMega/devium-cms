unit PhotoGalleryPlugin;

interface

uses PluginManagerIntf, PluginIntf, DataModuleIntf,
  ControlPanelElementIntf, Graphics;

type
  TPhotoGalleryPlugin = class(TPlugin, IPlugin, IDataModule, IControlPanelElement)
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
  end;

function RegisterPlugin(Module: HMODULE; PluginManager: IPluginManager): Boolean;

exports RegisterPlugin;

implementation

uses SysUtils, Windows, pgMainForm;

function RegisterPlugin(Module: HMODULE; PluginManager: IPluginManager): Boolean;
var
  Plugin: IInterface;
begin
  Plugin := TPhotoGalleryPlugin.Create(Module, PluginManager);
  Result := PluginManager.RegisterPlugin(Plugin);
end;

{ TPhotoGalleryPlugin }

constructor TPhotoGalleryPlugin.Create(Module: HMODULE;
  PluginManager: IPluginManager);
begin
  inherited;
  FBitmap := Graphics.TBitmap.Create;
  FDisplayName := 'Фото галлерея';
  FDescription := 'Фото галлерея';
  FBitmap.Handle := LoadBitmap(Module, 'PLUGIN_ICON');
end;

destructor TPhotoGalleryPlugin.Destroy;
begin
  FBitmap.Free;
  inherited;
end;

function TPhotoGalleryPlugin.Execute: Boolean;
begin
  Result := (GetMainForm(FPluginManager, FDataPath) = IDOK);
end;

function TPhotoGalleryPlugin.GetBitmap: Graphics.TBitmap;
begin
  Result := FBitmap;
end;

function TPhotoGalleryPlugin.GetDataPath: String;
begin
  Result := FDataPath;
end;

function TPhotoGalleryPlugin.GetDescription: string;
begin
  Result := FDescription;
end;

function TPhotoGalleryPlugin.GetDisplayName: string;
begin
  Result := FDisplayName;
end;

function TPhotoGalleryPlugin.GetName: string;
begin
  Result := 'PhotoGalleryPlugin';
end;

function TPhotoGalleryPlugin.Load: Boolean;
begin
  Result := True;
end;

procedure TPhotoGalleryPlugin.SetDataPath(const Value: String);
begin
  FDataPath := IncludeTrailingPathDelimiter(Value);
end;

function TPhotoGalleryPlugin.UnLoad: Boolean;
begin
  Result := True;
end;

end.
