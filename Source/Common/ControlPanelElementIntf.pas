{----------------------------------------------------------------------

   DEVIUM Content Management System
   Copyright (C) 2004 by DEIV Development Team.
   http://www.deiv.com/

   $Header: /devium/Devium\040CMS\0402/Source/Common/ControlPanelElementIntf.pas,v 1.2 2004/04/07 10:33:59 paladin Exp $

------------------------------------------------------------------------}
unit ControlPanelElementIntf;

interface

uses Graphics;

type
  IControlPanelElement = interface (IInterface)
    ['{285CBB44-CF2E-425A-BA41-1A7C9D705CBB}']
    function Execute: Boolean;
    function GetDescription: string;
    function GetDisplayName: string;
    function GetBitmap: TBitmap;
    property Description: string read GetDescription;
    property DisplayName: string read GetDisplayName;
    property Bitmap: TBitmap read GetBitmap;
  end;
  
implementation

end.
