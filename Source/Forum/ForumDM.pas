unit ForumDM;

interface

uses
  Classes, DataBase, DB, DBClient;

type
  TDM = class(TDB)
    Topics: TClientDataSet;
    dsTopics: TDataSource;
    dsCategories: TDataSource;
    Categories: TClientDataSet;
    dsPosts: TDataSource;
    Posts: TClientDataSet;
    Forums: TClientDataSet;
    dsForums: TDataSource;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

{ TDM }

end.
