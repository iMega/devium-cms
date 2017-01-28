{----------------------------------------------------------------------

   DEVIUM Content Management System
   Copyright (C) 2004 by DEIV Development Team.
   http://www.deiv.com/

   $Header: /devium/Devium\040CMS\0402/Source/Common/PluginManagerIntf.pas,v 1.2 2004/04/07 10:33:59 paladin Exp $

------------------------------------------------------------------------}
unit PluginManagerIntf;

interface

uses Classes;

type
  IPluginManager = interface (IInterface)
    ['{8BBF649D-D60A-47E5-85C3-8C81D7C5B40C}']
    function GetPath: string;
    function GetPlugins: IInterfaceList;
    procedure LoadPlugins;
    function RegisterPlugin(Plugin: IInterface): Boolean;
    procedure SetPath(const Value: string);
    procedure UnloadPlugins;
    function GetPlugin(const IID: TGUID; out Plugin): Boolean;    
    property Path: string read GetPath write SetPath;
    property Plugins: IInterfaceList read GetPlugins;
  end;
  
implementation

end.
