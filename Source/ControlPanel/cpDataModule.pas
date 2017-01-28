unit cpDataModule;

interface

uses
  SysUtils, Classes, AppEvnts;

type
  TDM = class(TDataModule)
    ApplicationEvents: TApplicationEvents;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}
 
end.
