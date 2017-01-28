unit gbDataModule;

interface

uses
  Classes, PluginManagerIntf, DataBase, DB, DBClient;

type
  TDM = class(TDB)
    Guestbook: TClientDataSet;
    dsGuestbook: TDataSource;
    Guestbookid: TAutoIncField;
    Guestbookdate: TDateTimeField;
    Guestbookquestion: TBlobField;
    Guestbookanswer: TBlobField;
    Guestbookauthor: TStringField;
    Guestbookemail: TStringField;
    Guestbookcity: TStringField;
    Guestbookhomepage: TStringField;
    Guestbookip: TStringField;
  public
    procedure ApplyUpdates; override;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

{ TDM }

procedure TDM.ApplyUpdates;
begin
  inherited;
  Refresh;
end;

end.
