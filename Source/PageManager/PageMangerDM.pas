{----------------------------------------------------------------------

   DEVIUM Content Management System
   Copyright (C) 2004 by DEIV Development Team.
   http://www.deiv.com/

   $Header: /devium/Devium\040CMS\0402/Source/PageManager/PageMangerDM.pas,v 1.4 2004/05/13 06:02:38 paladin Exp $

------------------------------------------------------------------------}
unit PageMangerDM;

interface

uses
  Classes, DataBase, DB, DBClient;

type
  TDM = class(TDB)
    Pages: TClientDataSet;
    dsPages: TDataSource;
    Languages: TClientDataSet;
    dsLanguages: TDataSource;
    Templates: TClientDataSet;
    dsTemplates: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    FLanguage: Integer;
  public
    procedure Open; override;
    function GetFilesPath(DataSet: TDataSet): String; override;
    function GetLocalPath(DataSet: TDataSet): String; override;
    function GetStatsuBarString: String; override;
    procedure SetLanguage(const Name: String);
    property Language: Integer read FLanguage write FLanguage;
  end;

var
  DM: TDM;

const
  PAGES_PATH : String = 'images\pages\';

implementation

uses SysUtils;

{$R *.dfm}

{ TDM }

procedure TDM.Open;
begin
  inherited;
  SetLanguage('Русский');
end;

procedure TDM.SetLanguage(const Name: String);
begin
  if Languages.Locate('title', Name, []) then
  begin
    FLanguage := Languages.FieldByName('id').AsInteger;
    Pages.Filter := Format('language_id=%d', [FLanguage]);
    Pages.Filtered := True;
  end;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  inherited;
  FLanguage := 1;
end;

function TDM.GetFilesPath(DataSet: TDataSet): String;
var
  FileList: TStringList;
  Images: TStringList;
  i: Integer;
begin
  Result := '';
  if DataSet = Pages then
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

function TDM.GetStatsuBarString: String;
begin
  Result := Format('Изменено элементов: %d', [Pages.ChangeCount]);
end;

function TDM.GetLocalPath(DataSet: TDataSet): String;
var
  SavePlace: TBookmark;
  ParentID: Integer;
begin
  Result := '';
  if DataSet = Pages then
  begin
    // будем подниматся до корня
    SavePlace := DataSet.GetBookmark;
    try
      repeat
        ParentID := DataSet['parent_id'];
//        if DataSet['folder'] = 1 then
          Result := DataSet['name'] + '\' + Result;
      until not DataSet.Locate('id', ParentID, []);
      DataSet.GotoBookmark(SavePlace);
    finally
      DataSet.FreeBookmark(SavePlace);
    end;
    Result := DataPath + PAGES_PATH + Result;
  end;
end;

end.
