{----------------------------------------------------------------------

   DEVIUM Content Management System
   Copyright (C) 2004 by DEIV Development Team.
   http://www.deiv.com/

   $Header: /devium/Devium\040CMS\0402/Source/Products/progDataModule.pas,v 1.7 2004/05/06 15:24:06 paladin Exp $

------------------------------------------------------------------------}
unit progDataModule;

interface

uses
  Classes, DataBase, DB, DBClient;

type
  TDM = class(TDB)
    Products: TClientDataSet;
    dsProducts: TDataSource;
    Prices: TClientDataSet;
    dsPrices: TDataSource;
    Units: TClientDataSet;
    dsUnits: TDataSource;
    UnitNames: TClientDataSet;
    dsUnitNames: TDataSource;
    PriceTypes: TClientDataSet;
    dsPriceTypes: TDataSource;
    Types: TClientDataSet;
    dsTypes: TDataSource;
    Properties: TClientDataSet;
    dsProperties: TDataSource;
    Values: TClientDataSet;
    dsValues: TDataSource;
  private
    function GetImagesFromHTML(const HTML, LocalPath: String): String;
  public
    function GetFilesPath(DataSet: TDataSet): String; override;
    function GetLocalPath(DataSet: TDataSet): String; override;
    function GetStatsuBarString: String; override;
  end;
{
<img\s[^>]*src\s*=\s*(["']?)([^>]*[\.jpg|\.gif|\.png])\1[^>]*>

}
var
  DM: TDM;

const
  PRODUCTS_PATH = 'images\products\';
  IMAGES_REGEXPR = '<img\s[^>]*src\s*=\s*(["'']?)([^>]*[\.jpg|\.gif|\.png])\1[^>]*>';

implementation

{$R *.dfm}

uses RegExpr, SysUtils, StrUtils, prodTypes;

{ TDM }

function TDM.GetFilesPath(DataSet: TDataSet): String;
begin
  Result := '';
  // Products
  if DataSet = Products then
    Result := GetImagesFromHTML(DataSet['description'],  GetLocalPath(DataSet));
  // Values
  if DataSet = Values then
  begin
    // 1. Определяем тип
    // 2. Для типа определяем может чтонить содержать
    // 3. Добавялем в очередь
    Properties.Locate('property_id', DataSet['property_id'], []);
    case GetPropertyIndex(Properties['datatype']) of
      IndexOfPicture, IndexOfFile: Result := GetLocalPath(DataSet) + DataSet['value'];
    end;
  end;
end;

// Получение списка картинок в HTML
function TDM.GetImagesFromHTML(const HTML, LocalPath: String): String;
var
  FileList: TStringList;
  r: TRegExpr;
  s: String;
  RemotePath: String;
begin
  Result := '';
  FileList := TStringList.Create;
  try
    r := TRegExpr.Create;
    try
      r.Expression := IMAGES_REGEXPR;
      r.ModifierG := True;
      r.ModifierS := True;
      r.ModifierI := True;
      if r.Exec(HTML) then
      repeat
        RemotePath := GetRemotePath(LocalPath);
        s := AnsiReplaceText(r.Match[2], RemotePath, LocalPath);
        FileList.Add(s);
      until not r.ExecNext;
      Result := FileList.Text;
    finally
      r.Free;
    end;
  finally
    FileList.Free;  
  end;
end;

// получение локального пути для DataSet
function TDM.GetLocalPath(DataSet: TDataSet): String;

  function GetProductPath(ADataSet: TDataSet): String;
  var
    SavePlace: TBookmark;
    State: TDataSetState;
    ParentID: Integer;
  begin
    Result := '';
    ADataSet.DisableControls;
    State := ADataSet.State;
    // будем подниматся до корня
    SavePlace := ADataSet.GetBookmark;
    try
      repeat
        ParentID := ADataSet['parent_id'];
        Result := ADataSet['name'] + '\' + Result;
      until not ADataSet.Locate('product_id', ParentID, []);
      ADataSet.GotoBookmark(SavePlace);
      if State = dsEdit then ADataSet.Edit;
    finally
      ADataSet.FreeBookmark(SavePlace);
    end;
    ADataSet.EnableControls;
  end;

begin
  Result := '';
  if DataSet = Products then
    Result := DataPath + PRODUCTS_PATH + GetProductPath(DataSet) + 'description\';

  if DataSet = Values then
  begin
    Result := DataPath + PRODUCTS_PATH + GetProductPath(Products);
    // для всех файлов кидаем их в корень папки
    // для описания создаем папку
    // для текстовых свойсв тоже создаем папку
    Properties.Locate('property_id', DataSet['property_id'], []);
    if GetPropertyIndex(Properties['datatype']) = 6 then // TEXT
      Result := Result + Properties['name'] + '\'
  end;
end;

function TDM.GetStatsuBarString: String;
begin
  Result := Format('Изменено. Продукция: %d, Свойства: %d',
    [Products.ChangeCount, Values.ChangeCount]);
end;

end.
