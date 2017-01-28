{----------------------------------------------------------------------

   DEVIUM Content Management System
   Copyright (C) 2004 by DEIV Development Team.
   http://www.deiv.com/

   $Header: /devium/Devium\040CMS\0402/Source/ControlPanel/SettingsPlugin.pas,v 1.2 2004/04/06 09:29:07 paladin Exp $

------------------------------------------------------------------------}
unit SettingsPlugin;

interface

uses SettingsIntf, Classes, SoapConn, IniFiles, PluginIntf, PluginManagerIntf;


type
  TSettingsPlugin = class(TPlugin, IPlugin, ISettings)
  private
    FIniFile: TIniFile;
  public
    destructor Destroy; override;
    { IPlugin }
    function GetName: string;
    function Load: Boolean;
    function UnLoad: Boolean;
    { ISettings }
    function GetHttpLogin: string;
    procedure SetHttpLogin(const Value: string);
    function GetHttpPass: string;
    procedure SetHttpPass(const Value: string);
    function GetDataBasePrefix: string;
    function GetHttpProxy: string;
    function GetHttpProxyLogin: string;
    function GetHttpProxyPass: string;
    function GetHttpRoot: string;
    function GetUseHttpProxy: Boolean;
    procedure SetDataBasePrefix(const Value: string);
    procedure SetHttpProxy(const Value: string);
    procedure SetHttpProxyLogin(const Value: string);
    procedure SetHttpProxyPass(const Value: string);
    procedure SetHttpRoot(const Value: string);
    procedure SetupSoapConnection(SoapConnection: TSoapConnection);
    procedure SetUseHttpProxy(Value: Boolean);
    procedure ISettings.Load = LoadSettings;
    procedure LoadSettings(const Path: String);
    procedure Save;
    function NeedShowPlugins(const Name: String): Boolean;
  end;
  
implementation

const
  ConSec          = 'Connection';
  DataBasePrefix  = 'DataBasePrefix';
  HttpProxy       = 'HttpProxy';
  HttpProxyLogin  = 'HttpProxyLogin';
  HttpProxyPass   = 'HttpProxyPass';
  HttpRoot        = 'HttpRoot';
  UseHttpProxy    = 'UseHttpProxy';
  HttpLogin       = 'HttpLogin';
  HttpPass        = 'HttpPass';
  PluginsSec      = 'Plugins';
  soap_server     = 'soap_server.php';
  
{ TSettingsPlugin }

destructor TSettingsPlugin.Destroy;
begin
  Save;
  inherited;
end;

function TSettingsPlugin.GetDataBasePrefix: string;
begin
  Result := FIniFile.ReadString(ConSec, DataBasePrefix, '');
end;

function TSettingsPlugin.GetHttpLogin: string;
begin
  Result := FIniFile.ReadString(ConSec, HttpLogin, '');
end;

function TSettingsPlugin.GetHttpPass: string;
begin
  Result := FIniFile.ReadString(ConSec, HttpPass, '');
end;

function TSettingsPlugin.GetHttpProxy: string;
begin
  Result := FIniFile.ReadString(ConSec, HttpProxy, '');
end;

function TSettingsPlugin.GetHttpProxyLogin: string;
begin
  Result := FIniFile.ReadString(ConSec, HttpProxyLogin, '');
end;

function TSettingsPlugin.GetHttpProxyPass: string;
begin
  Result := FIniFile.ReadString(ConSec, HttpProxyPass, '');
end;

function TSettingsPlugin.GetHttpRoot: string;
begin
  Result := FIniFile.ReadString(ConSec, HttpRoot, '');
end;

function TSettingsPlugin.GetName: string;
begin
  Result := 'SettingsPlugin';
end;

function TSettingsPlugin.GetUseHttpProxy: Boolean;
begin
  Result := FIniFile.ReadBool(ConSec, UseHttpProxy, False);
end;

function TSettingsPlugin.Load: Boolean;
begin
  Result := True;
end;

procedure TSettingsPlugin.LoadSettings(const Path: String);
begin
  Save;
  FIniFile := TIniFile.Create(Path + 'settings.ini');
end;

function TSettingsPlugin.NeedShowPlugins(const Name: String): Boolean;
begin
  Result := FIniFile.ReadBool(PluginsSec, Name, False);
end;

procedure TSettingsPlugin.Save;
begin
  if Assigned(FIniFile) then FIniFile.Free;
end;

procedure TSettingsPlugin.SetDataBasePrefix(const Value: string);
begin
  FIniFile.WriteString(ConSec, DataBasePrefix, Value);
end;

procedure TSettingsPlugin.SetHttpLogin(const Value: string);
begin
  FIniFile.WriteString(ConSec, HttpLogin, Value);
end;

procedure TSettingsPlugin.SetHttpPass(const Value: string);
begin
  FIniFile.WriteString(ConSec, HttpPass, Value);
end;

procedure TSettingsPlugin.SetHttpProxy(const Value: string);
begin
  FIniFile.WriteString(ConSec, HttpProxy, Value);
end;

procedure TSettingsPlugin.SetHttpProxyLogin(const Value: string);
begin
  FIniFile.WriteString(ConSec, HttpProxyLogin, Value);
end;

procedure TSettingsPlugin.SetHttpProxyPass(const Value: string);
begin
  FIniFile.WriteString(ConSec, HttpProxyPass, Value);
end;

procedure TSettingsPlugin.SetHttpRoot(const Value: string);
begin
  FIniFile.WriteString(ConSec, HttpRoot, Value);
end;

procedure TSettingsPlugin.SetupSoapConnection(SoapConnection: TSoapConnection);
begin
  SoapConnection.URL := GetHttpRoot + soap_server;
  { TODO 5 -opalaidn : Р”РѕРґРµР»Р°С‚СЊ СЂР°Р±РѕС‚Сѓ СЃ РїСЂРѕРєСЃРё }
end;

procedure TSettingsPlugin.SetUseHttpProxy(Value: Boolean);
begin
  FIniFile.WriteBool(ConSec, UseHttpProxy, Value);
end;

function TSettingsPlugin.UnLoad: Boolean;
begin
  Result := True;
end;

end.
