unit TravelDM;

interface

uses
  Classes, DB, DataBase, DBClient;

type
  TDM = class(TDB)
    Tours: TClientDataSet;
    dsTours: TDataSource;
    Directions: TClientDataSet;
    dsDirections: TDataSource;
    Currency: TClientDataSet;
    dsCurrency: TDataSource;
    ToursDates: TClientDataSet;
    dsToursDates: TDataSource;
    TourTypes: TClientDataSet;
    dsTourTypes: TDataSource;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

{ TDM }
{
procedure TDM.ToursBeforeDelete(DataSet: TDataSet);
begin
  with DM.ToursDates do
  begin
    First;
    while not EOF do
      Delete;
  end;
end;
}
end.
