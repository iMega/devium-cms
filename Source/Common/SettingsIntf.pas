{----------------------------------------------------------------------

   DEVIUM Content Management System
   Copyright (C) 2004 by DEIV Development Team.
   http://www.deiv.com/

   $Header: /devium/Devium\040CMS\0402/Source/Common/SettingsIntf.pas,v 1.2 2004/04/07 10:33:59 paladin Exp $

------------------------------------------------------------------------}
unit SettingsIntf;

interface

uses Classes, SoapConn;

type
  ISettings = interface (IInterface)
    ['{60CBE02B-FB98-4265-AAF8-4B8F6BE06353}']
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
    function GetHttpPass: string;
    procedure SetHttpPass(const Value: string);
    function GetHttpLogin: string;
    procedure SetHttpLogin(const Value: string);
    procedure Load(const Path: String);
    procedure Save;
    function NeedShowPlugins(const Name: String): Boolean;
    property DataBasePrefix: string read GetDataBasePrefix write
            SetDataBasePrefix;
    property HttpProxy: string read GetHttpProxy write SetHttpProxy;
    property HttpProxyLogin: string read GetHttpProxyLogin write
            SetHttpProxyLogin;
    property HttpProxyPass: string read GetHttpProxyPass write SetHttpProxyPass;
    property HttpRoot: string read GetHttpRoot write SetHttpRoot;
    property UseHttpProxy: Boolean read GetUseHttpProxy write SetUseHttpProxy;
    property HttpLogin: string read GetHttpLogin write SetHttpLogin;
    property HttpPass: string read GetHttpPass write SetHttpPass;
  end;
  
implementation

end.
