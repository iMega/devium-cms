{----------------------------------------------------------------------

   DEVIUM Content Management System
   Copyright (C) 2004 by DEIV Development Team.
   http://www.deiv.com/

   $Header: /devium/Devium\040CMS\0402/Source/PhotoGallery/pgDataModule.pas,v 1.3 2004/04/10 07:12:11 paladin Exp $

------------------------------------------------------------------------}
unit pgDataModule;

interface

uses
  SysUtils, Classes, DB, DBClient, DataBase;

type
  TDM = class(TDB)
    Photos: TClientDataSet;
    List: TClientDataSet;
    Comments: TClientDataSet;
    Albums: TClientDataSet;
    dsList: TDataSource;
    dsAlbums: TDataSource;
    dsPhotos: TDataSource;
  public
    function GetFilesPath(DataSet: TDataSet): String; override;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

const
  GALLERY_PATH : String = 'images\gallery';

function TDM.GetFilesPath(DataSet: TDataSet): String;
var
  sl: TStringList;
begin
  Result := '';

  if DataSet = Photos then
  begin
    Albums.Locate('id', DataSet['album_id'], []);
    List.Locate('id', Albums['gallery_id'], []);
    sl := TStringList.Create;
    sl.Add(Format('%s%s\%s\%s\%s.jpg', [DataPath, GALLERY_PATH,
      List['name'], Albums['name'], DataSet['name']]));
    sl.Add(Format('%s%s\%s\%s\small_%s.jpg', [DataPath, GALLERY_PATH,
      List['name'], Albums['name'], DataSet['name']]));
    Result := sl.Text;
    sl.Free;
  end;
  // Albums
  if DataSet = Albums then
  begin
    List.Locate('id', DataSet['gallery_id'], []);
    Result := Format('%s%s\%s\%s\', [DataPath, GALLERY_PATH, List['name'], DataSet['name']]);
  end;
  // Albums
  if DataSet = List then
  begin
    Result := Format('%s%s\%s\', [DataPath, GALLERY_PATH, DataSet['name']]);
  end;
end;

end.
