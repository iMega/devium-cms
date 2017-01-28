{----------------------------------------------------------------------

   DEVIUM Content Management System
   Copyright (C) 2004 by DEIV Development Team.
   http://www.deiv.com/

   $Header: /devium/Devium\040CMS\0402/Source/ControlPanel/PluginManager.pas,v 1.3 2004/04/17 12:17:05 paladin Exp $

------------------------------------------------------------------------}
unit PluginManager;

interface

uses Classes, PluginManagerIntf;

type
  TPluginManager = class (TInterfacedObject, IPluginManager)
  private
    FPath: string;
    FPlugins: IInterfaceList;
  protected
    function GetPath: string;
    function GetPlugins: IInterfaceList;
    procedure SetPath(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
    procedure LoadPlugins;
    function RegisterPlugin(Plugin: IInterface): Boolean;
    procedure UnloadPlugins;
    function GetPlugin(const IID: TGUID; out Plugin): Boolean;
    property Path: string read GetPath write SetPath;
    property Plugins: IInterfaceList read GetPlugins;
  end;

implementation

uses SysUtils, PluginIntf, Windows, Dialogs;

constructor TPluginManager.Create;
begin
  inherited Create;
  FPlugins := TInterfaceList.Create;
  FPath := ExtractFilePath(ParamStr(0)) + 'plugins\';
end;

destructor TPluginManager.Destroy;
begin
  UnloadPlugins;
  FPlugins := nil;
end;

function TPluginManager.GetPath: string;
begin
  Result := FPath;
end;

function TPluginManager.GetPlugin(const IID: TGUID; out Plugin): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to FPlugins.Count - 1 do
  begin
    if Succeeded(FPlugins[i].QueryInterface(IID, Plugin)) then
    begin
      Result := True;
      Break;
    end;
  end;
end;

function TPluginManager.GetPlugins: IInterfaceList;
begin
  Result := FPlugins;
end;

procedure TPluginManager.LoadPlugins;
var
  sr: TSearchRec;
  Module: HMODULE;
  RegisterPlugin: TRegisterPlugin;
  i: Integer;
  Plugin: IPlugin;
begin
  if FindFirst(FPath + '*.bpl', faAnyFile, sr) = 0 then
  begin
    repeat
      Module := LoadPackage(Path + sr.Name);
      if Module <> 0 then // Р·Р°РіСЂСѓР·РёР»СЃСЏ
      begin
        RegisterPlugin := GetProcAddress(Module, RegisterPluginName);
        // РїРѕРёСЃРє РїСЂРѕС†РµРґСѓСЂС‹ СЂРµРіРёСЃС‚СЂР°С†РёРё
        if not (Assigned(RegisterPlugin) and RegisterPlugin(Module, Self)) then
          UnloadPackage(Module);
      end;
    until FindNext(sr) <> 0;
    SysUtils.FindClose(sr);
  end;
  // РїРѕСЃР»Рµ С‚РѕРіРѕ РєР°Рє РІСЃРµ РїР»Р°РіРёРЅС‹ Р·Р°РіСЂСѓР¶РµРЅС‹, РІС‹Р·С‹РІР°РµРј "СЂР°РіСЂСѓР·РєР°"
  for i := 0 to FPlugins.Count - 1 do
  begin
    if Supports(FPlugins[i], IPlugin, Plugin) then
    begin
      Plugin.Load;
    end;
  end;
end;

function TPluginManager.RegisterPlugin(Plugin: IInterface): Boolean;
begin
  Result := False;
  if Supports(Plugin, IPlugin) then
  begin
    Result := True;
    FPlugins.Add(Plugin);
  end;
end;

procedure TPluginManager.SetPath(const Value: string);
begin
  if FPath <> Value then
  begin
    FPath := Value;
  end;
end;

procedure TPluginManager.UnloadPlugins;
var
  i: Integer;
  Plugin: IPlugin;
begin
  for i := 0 to FPlugins.Count - 1 do
  begin
    if Supports(FPlugins[i], IPlugin, Plugin) then
    begin
      Plugin.UnLoad;
    end;
  end;
  FPlugins.Clear;
end;

end.
