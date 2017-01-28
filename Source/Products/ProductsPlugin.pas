{----------------------------------------------------------------------

   DEVIUM Content Management System
   Copyright (C) 2004 by DEIV Development Team.
   http://www.deiv.com/

   $Header: /devium/Devium\040CMS\0402/Source/Products/ProductsPlugin.pas,v 1.1 2004/04/15 15:01:01 paladin Exp $

------------------------------------------------------------------------}
unit ProductsPlugin;

interface

uses PluginManagerIntf, PluginIntf, DataModuleIntf,
  ControlPanelElementIntf, Graphics;

type
  TProductsPlugin = class(TPlugin, IPlugin, IDataModule, IControlPanelElement)
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

uses SysUtils, Windows, prodMainForm;

function RegisterPlugin(Module: HMODULE; PluginManager: IPluginManager): Boolean;
var
  Plugin: IInterface;
begin
  Plugin := TProductsPlugin.Create(Module, PluginManager);
  Result := PluginManager.RegisterPlugin(Plugin);
end;

{ TProductsPlugin }

constructor TProductsPlugin.Create(Module: HMODULE;
  PluginManager: IPluginManager);
begin
  inherited;
  FBitmap := Graphics.TBitmap.Create;
  FDisplayName := 'Каталог товаров';
  FDescription := 'Каталог товаров';
  FBitmap.Handle := LoadBitmap(Module, 'PLUGIN_ICON');
end;

destructor TProductsPlugin.Destroy;
begin
  FBitmap.Free;
  inherited;
end;

function TProductsPlugin.Execute: Boolean;
begin
  Result := (GetMainForm(FPluginManager, FDataPath) = IDOK);
end;

function TProductsPlugin.GetBitmap: Graphics.TBitmap;
begin
  Result := FBitmap; 
end;

function TProductsPlugin.GetDataPath: String;
begin
  Result := FDataPath;
end;

function TProductsPlugin.GetDescription: string;
begin
  Result := FDescription;
end;

function TProductsPlugin.GetDisplayName: string;
begin
  Result := FDisplayName;
end;

function TProductsPlugin.GetName: string;
begin
  Result := 'ProductsPlugin';
end;

function TProductsPlugin.Load: Boolean;
begin
  Result := True;
end;

procedure TProductsPlugin.SetDataPath(const Value: String);
begin
  FDataPath := IncludeTrailingPathDelimiter(Value);
end;

function TProductsPlugin.UnLoad: Boolean;
begin
  Result := True;
end;

end.