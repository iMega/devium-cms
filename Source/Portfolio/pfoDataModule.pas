unit pfoDataModule;

interface

uses
  Classes, DataBase, DB, DBClient;

type
  TDM = class(TDB)
    dsPortfolio: TDataSource;
    Portfolio: TClientDataSet;
  public
    function GetFilesPath(DataSet: TDataSet): String; override;
    function GetLocalPath(DataSet: TDataSet): String; override;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

uses SysUtils;

const
  PORTFOLIO_PATH : String = 'images\portfolio\';

{ TDM }

function TDM.GetFilesPath(DataSet: TDataSet): String;
var
  FileList: TStringList;
  Images: TStringList;
  i: Integer;
begin
  Result := '';
  if DataSet = Portfolio then
  begin
    // поулчение списка фоток
    if Length(Trim(DataSet['path_small_image'])) > 0 then
    begin
      Images := TStringList.Create;
      try
        Images.Text := DataSet['path_small_image'];
        FileList := TStringList.Create;
        try
          for i := 0 to Images.Count - 1 do
            FileList.Add(GetLocalPath(DataSet) + Images[i]);
          Result := FileList.Text; 
        finally
          FileList.Free;
        end;
      finally
        Images.Free;
      end;        
    end
    else
      // убиваем папку
      DelDir(GetLocalPath(DataSet));
  end;
end;

function TDM.GetLocalPath(DataSet: TDataSet): String;
begin
  Result := DataPath + PORTFOLIO_PATH + DataSet['title'] + '\';
end;
   
end.
