{----------------------------------------------------------------------

   DEVIUM Content Management System
   Copyright (C) 2004 by DEIV Development Team.
   http://www.deiv.com/

   $Header: /devium/Devium\040CMS\0402/Source/Common/PluginIntf.pas,v 1.2 2004/04/07 10:33:59 paladin Exp $

------------------------------------------------------------------------}
unit PluginIntf;

interface

uses PluginManagerIntf;

const
  RegisterPluginName  = 'RegisterPlugin';

type
  TRegisterPlugin = function(Module: HMODULE; PluginManager: IPluginManager): Boolean;

  IPlugin = interface (IInterface)
    ['{6D5AF092-4AF3-4C1B-8EDC-C76007103B08}']
    function GetModule: HMODULE;
    function GetName: string;
    function Load: Boolean;
    function UnLoad: Boolean;
    property Module: HMODULE read GetModule;
    property Name: string read GetName;
  end;
  
  TPlugin = class (TInterfacedObject)
  protected
    FModule: HMODULE;
    FPluginManager: IPluginManager;
  public
    constructor Create(Module: HMODULE; PluginManager: IPluginManager);
    function GetModule: HMODULE;
    property Module: HMODULE read GetModule;
  end;

implementation

{
*********************************** TPlugin ************************************
}
constructor TPlugin.Create(Module: HMODULE; PluginManager: IPluginManager);
begin
  inherited Create;
  FModule := Module;
  FPluginManager := PluginManager;
end;

function TPlugin.GetModule: HMODULE;
begin
  Result := FModule;
end;

end.
