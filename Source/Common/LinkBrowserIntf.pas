unit LinkBrowserIntf;

interface

type
  ILinkBrowser = interface(IInterface)
  ['{297D8EBC-88E0-4258-B49E-BF824B5AEB5C}']
    function Execute(var S: String): Boolean;
    function GetName: string;
    property Name: string read GetName;
  end;

implementation

end.
