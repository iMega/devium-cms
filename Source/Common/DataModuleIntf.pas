{----------------------------------------------------------------------

   DEVIUM Content Management System
   Copyright (C) 2004 by DEIV Development Team.
   http://www.deiv.com/

   $Header: /devium/Devium\040CMS\0402/Source/Common/DataModuleIntf.pas,v 1.2 2004/04/07 10:33:59 paladin Exp $

------------------------------------------------------------------------}
unit DataModuleIntf;

interface

type
  IDataModule = interface(IInterface)
  ['{B8C9CECC-543D-4A0A-933E-0D173690E96F}']
    function GetDataPath: String;
    procedure SetDataPath(const Value: String);
    property DataPath: String read GetDataPath write SetDataPath;
  end;
  
implementation

end.
