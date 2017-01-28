unit ArticlesPlugin;

interface

uses PluginManagerIntf, PluginIntf, ControlPanelElementIntf, Graphics,
  DataModuleIntf;

type
  TArticlesPlugin = class (TPlugin, IPlugin, IControlPanelElement, IDataModule)
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

uses Windows, artMainFrm;

function RegisterPlugin(Module: HMODULE; PluginManager: IPluginManager): Boolean;
var
  Plugin: IInterface;
begin
  Plugin := TArticlesPlugin.Create(Module, PluginManager);
  Result := PluginManager.RegisterPlugin(Plugin);
end;

{ TArticlesPlugin }

constructor TArticlesPlugin.Create(Module: HMODULE;
  PluginManager: IPluginManager);
begin
  inherited;
  FBitmap := Graphics.TBitmap.Create;
  FDisplayName := 'Статьи';
  FBitmap.Handle := LoadBitmap(Module, 'PLUGIN_ICON');
end;

destructor TArticlesPlugin.Destroy;
begin
  FBitmap.Free;
  inherited;
end;

function TArticlesPlugin.Execute: Boolean;
begin
  Result := GetMainForm(FPluginManager, FDataPath) = IDOK;
end;

function TArticlesPlugin.GetBitmap: Graphics.TBitmap;
begin
  Result := FBitmap;
end;

function TArticlesPlugin.GetDataPath: String;
begin
  Result := FDataPath;
end;

function TArticlesPlugin.GetDescription: string;
begin
  Result := 'Редактирование статей';
end;

function TArticlesPlugin.GetDisplayName: string;
begin
  Result := FDisplayName;
end;

function TArticlesPlugin.GetName: string;
begin
  Result := 'ArticlesPlugin';
end;

function TArticlesPlugin.Load: Boolean;
begin
  Result := True;
end;

procedure TArticlesPlugin.SetDataPath(const Value: String);
begin
  FDataPath := Value;
end;

procedure TArticlesPlugin.SetDisplayName(const Value: string);
begin
  FDisplayName := Value;
end;

function TArticlesPlugin.UnLoad: Boolean;
begin
  Result := True;
end;

end.
