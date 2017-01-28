unit Reg;

interface

procedure Register;
  
implementation

uses DataBase, Classes, DesignIntf, DesignEditors;

{ TDB }

procedure Register;
begin
   RegisterClass(TDB);
   RegisterCustomModule(TDB, TCustomModule);
end;

end.
