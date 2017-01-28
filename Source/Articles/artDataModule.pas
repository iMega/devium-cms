unit artDataModule;

interface

uses
  Classes, DataBase, DB, DBClient;

type
  TDM = class(TDB)
    Articles: TClientDataSet;
    dsArticles: TDataSource;
    Category: TClientDataSet;
    dsCategory: TDataSource;
    Pages: TClientDataSet;
    dsPages: TDataSource;
  public
    function GetLocalPath(DataSet: TDataSet): String; override;
  end;

var
  DM: TDM;

const
  ARTICLES_PATH : String = 'images\articles\';

implementation

{$R *.dfm}

{ TDM }

function TDM.GetLocalPath(DataSet: TDataSet): String;
begin
  if DataSet = Articles then
  begin
    Result := DataPath + ARTICLES_PATH + DataSet['name'] + '\';
  end;
  if DataSet = Pages then
  begin
    Result := GetLocalPath(Articles) + DataSet['name'] + '\';
  end;
end;

end.
