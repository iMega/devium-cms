unit NewsDM;

interface

uses
  Classes, DataBase, DB, DBClient;

type
  TDM = class(TDB)
    News: TClientDataSet;
    dsNews: TDataSource;
    Categories: TClientDataSet;
    dsCategories: TDataSource;
  public
    { работа с путем для файлов }
    function GetFilesPath(DataSet: TDataSet): String; override;
    function GetLocalPath(DataSet: TDataSet): String; override;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

uses SysUtils;

const
  NEWS_PATH : String = 'images\news\';

{ TDM }


function TDM.GetFilesPath(DataSet: TDataSet): String;
var
  FileList: TStringList;
  Images: TStringList;
  i: Integer;
begin
  Result := '';
  if DataSet = News then
  begin
    // поулчение списка фоток
    if Length(Trim(DataSet['images'])) > 0 then
    begin
      Images := TStringList.Create;
      try
        Images.Text := DataSet['images'];
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
  Result := DataPath + NEWS_PATH + DataSet['name'] + '\';
end;

end.
