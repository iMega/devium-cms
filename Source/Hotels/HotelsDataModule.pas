unit HotelsDataModule;

interface

uses
  Classes, DataModuleIntf, DB, DBClient, SOAPConn, PluginManagerIntf,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TDM = class(TDataModule, IDataModule)
    SoapConnection: TSoapConnection;
    Hotels: TClientDataSet;
    dsHotels: TDataSource;
    HotelsImages: TClientDataSet;
    dsHotelsImages: TDataSource;
    Hotelsid: TAutoIncField;
    Hotelsplace_id: TIntegerField;
    Hotelsname: TStringField;
    Hotelsenglish_name: TStringField;
    Hotelsdescription: TBlobField;
    Hotelsmap_x: TIntegerField;
    Hotelsmap_y: TIntegerField;
    Hotelsmod_rewrite_name: TStringField;
    HotelsImagesid: TAutoIncField;
    HotelsImageshotel_id: TIntegerField;
    HotelsImagesimage: TStringField;
    HotelsImagesdescription: TStringField;
    HotelsImagessort_order: TIntegerField;
    Services: TClientDataSet;
    dsServices: TDataSource;
    dsHotelsServices: TDataSource;
    HotelsServices: TClientDataSet;
    ServicesGroups: TClientDataSet;
    dsServicesGroups: TDataSource;
    Servicesid: TAutoIncField;
    Servicesname: TStringField;
    HotelsServicesid: TAutoIncField;
    HotelsServiceshotel_id: TIntegerField;
    HotelsServicesservice_id: TIntegerField;
    ServicesGroupsid: TAutoIncField;
    ServicesGroupsname: TStringField;
    ServicesGroupssort_order: TIntegerField;
    HotelsServicesgroup_id: TIntegerField;
    ServicesTypes: TClientDataSet;
    dsServicesTypes: TDataSource;
    ServicesTypesid: TAutoIncField;
    ServicesTypesname: TStringField;
    Servicestype_id: TIntegerField;
    ServicesTypessort_order: TIntegerField;
    Places: TClientDataSet;
    dsPlaces: TDataSource;
    PlacesTypes: TClientDataSet;
    dsPlacesTypes: TDataSource;
    Countries: TClientDataSet;
    dsCountries: TDataSource;
    PlacesTypesid: TAutoIncField;
    PlacesTypesname: TStringField;
    Countriesid: TAutoIncField;
    Countriesdirection_id: TIntegerField;
    Countriesname: TStringField;
    Directions: TClientDataSet;
    dsDirections: TDataSource;
    Placesid: TAutoIncField;
    Placescountry_id: TIntegerField;
    Placesplace_type_id: TIntegerField;
    Placesname: TStringField;
    Placesmap_x: TIntegerField;
    Placesmap_y: TIntegerField;
    Placesdescription: TBlobField;
    Placesenglish_name: TStringField;
    Placesmod_rewrite_name: TStringField;
    Hotelsstarts: TIntegerField;
    Hotelssuper: TIntegerField;
    Hotelscountry_id: TIntegerField;
    Images: TClientDataSet;
    HTTP: TIdHTTP;
    HotelsImagesname: TStringField;
    Hotelsimages2: TBlobField;
    Placesimages: TBlobField;
    dsImages: TDataSource;
    procedure DataModuleDestroy(Sender: TObject);
    procedure HotelsBeforeDelete(DataSet: TDataSet);
    procedure ServicesBeforeDelete(DataSet: TDataSet);
    procedure ServicesGroupsBeforeDelete(DataSet: TDataSet);
    procedure HotelsImagesBeforeDelete(DataSet: TDataSet);
  private
    FDataBasePath: String;
    FPluginManager: IPluginManager;
    procedure SetPluginManager(const Value: IPluginManager);
    procedure OpenImageTable;
  public
    // РЅР°С‡Р°Р»Рѕ СЂР°Р±РѕС‚Р° СЃ РєР°СЂС‚РёРЅРєР°РјРё
    procedure AddImage(const AImageName, ATable, AKeyName: String;
      AKey: Integer; ADelete: Boolean = False);
    procedure AddImage2(const ASourceImageName, ATable, AKeyName: String;
      AKey: Integer; ADelete: Boolean = False);
    procedure RemoveImage(const AImageName, ATable, AKeyName: String; AKey: Integer);
    // РєРѕРЅРµС† СЂР°Р±РѕС‚Р° СЃ РєР°СЂС‚РёРЅРєР°РјРё
    function GetDataBasePath: String;
    procedure SetDataBasePath(const Value: String);
    procedure Open;
    procedure Close;
    procedure ApplyUpdates;
    function CanApplyUpdates: Boolean;
    function GetNextHotelsImagesSort: Integer;
    function GetImagesPath: String;
    function GetImagesPathR: String;
    function GetImagesPathL: String;
    property DataBasePath: String read GetDataBasePath write SetDataBasePath;
    property PluginManager: IPluginManager read FPluginManager write SetPluginManager;
  end;

var
  DM: TDM;

implementation

uses SysUtils, SettingsIntf, Math, Variants, StrUtils, Windows;

{$R *.dfm}

{ TDM }

procedure TDM.ApplyUpdates;
begin
  Hotels.ApplyUpdates(-1);
  HotelsImages.ApplyUpdates(-1);
  Services.ApplyUpdates(-1);
  HotelsServices.ApplyUpdates(-1);
  Places.ApplyUpdates(-1);
  PlacesTypes.ApplyUpdates(-1);
end;

function TDM.CanApplyUpdates: Boolean;
begin
  Result :=
    (DM.Hotels.ChangeCount > 0) or
    (DM.HotelsServices.ChangeCount > 0) or
    (DM.HotelsImages.ChangeCount > 0) or
    (DM.Services.ChangeCount > 0) or
    (DM.Places.ChangeCount > 0) or
    (DM.PlacesTypes.ChangeCount > 0);
end;

procedure TDM.Close;
begin
  Images.SaveToFile();
  Images.Close;
  Hotels.Close;
  HotelsImages.Close;
  Services.Close;
  HotelsServices.Close;
  ServicesGroups.Close;
  ServicesTypes.Close;
  Countries.Close;
  Places.Close;
  PlacesTypes.Close;
  Directions.Close;
end;

function TDM.GetDataBasePath: String;
begin
  Result := FDataBasePath;
end;

procedure TDM.Open;
var
  Settings: ISettings;
begin
  if FPluginManager.GetPlugin(ISettings, Settings) then
  begin
    Settings.SetupSoapConnection(SoapConnection);
    OpenDataSet(Hotels, Settings.DataBasePrefix, FDataBasePath);
    OpenDataSet(HotelsImages, Settings.DataBasePrefix, FDataBasePath);
    OpenDataSet(Services, Settings.DataBasePrefix, FDataBasePath);
    OpenDataSet(HotelsServices, Settings.DataBasePrefix, FDataBasePath);
    OpenDataSet(ServicesGroups, Settings.DataBasePrefix, FDataBasePath);
    OpenDataSet(ServicesTypes, Settings.DataBasePrefix, FDataBasePath);
    OpenDataSet(Countries, Settings.DataBasePrefix, FDataBasePath);
    OpenDataSet(Places, Settings.DataBasePrefix, FDataBasePath);
    OpenDataSet(PlacesTypes, Settings.DataBasePrefix, FDataBasePath);
    OpenDataSet(Directions, Settings.DataBasePrefix, FDataBasePath);
    OpenImageTable;
  end;
end;

procedure TDM.SetDataBasePath(const Value: String);
begin
  FDataBasePath := IncludeTrailingPathDelimiter(Value);
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  Close;
end;

procedure TDM.SetPluginManager(const Value: IPluginManager);
begin
  FPluginManager := Value;
end;

procedure TDM.HotelsBeforeDelete(DataSet: TDataSet);
begin
  // СѓРґР°Р»РµРЅРёРµ СЃРїРёСЃРєР° С„РѕС‚Рѕ
  with HotelsImages do
  begin
    DisableControls;
    First;
    while not EOF do
      Delete;
    EnableControls;
  end;
  // СѓРґР°Р»РµРЅРёРµ РёР· РѕС‚РЅРѕС€РµРЅРёСЏ СЃРµСЂРІРµСЃ-РѕС‚РµР»СЊ
  with HotelsServices do
  begin
    DisableControls;
    First;
    while not EOF do
    begin
      if FieldValues['hotel_id'] = DataSet['id'] then
        Delete
      else
        Next;
    end;
    EnableControls;
  end;
  RemoveImage('', DataSet.Name, 'id', DataSet['id']);
end;

procedure TDM.ServicesBeforeDelete(DataSet: TDataSet);
begin
  // СѓРґР°Р»РµРЅРёРµ РёР· РѕС‚РЅРѕС€РµРЅРёСЏ СЃРµСЂРІРµСЃ-РѕС‚РµР»СЊ
  with HotelsServices do
  begin
    DisableControls;
    First;
    while not EOF do
    begin
      if FieldValues['service_id'] = DataSet['id'] then
        Delete
      else
        Next;
    end;
    EnableControls;
  end;
end;

procedure TDM.ServicesGroupsBeforeDelete(DataSet: TDataSet);
begin
  // СѓРґР°Р»РµРЅРёРµ РёР· РѕС‚РЅРѕС€РµРЅРёСЏ СЃРµСЂРІРµСЃ-РѕС‚РµР»СЊ
  with HotelsServices do
  begin
    DisableControls;
    First;
    while not EOF do
    begin
      if FieldValues['group_id'] = DataSet['id'] then
        Delete
      else
        Next;
    end;
    EnableControls;
  end;
end;

function TDM.GetNextHotelsImagesSort: Integer;
begin
  Result := 0;
  with HotelsImages do
  begin
    DisableControls;
    while not Eof do
    begin
      Result := Max(Result, FieldValues['sort_order']);
      Next;
    end; 
    EnableControls;
  end;
  Result := Result + 10;
end;

procedure TDM.OpenImageTable;
begin
  Images.FileName := FDataBasePath + Images.Name + '.xml';
  try
    Images.Open;
  except
    Images.CreateDataSet;
    Images.Open;
    Images.SaveToFile();
  end;
  Images.LogChanges := False;
end;

procedure TDM.HotelsImagesBeforeDelete(DataSet: TDataSet);
begin
  RemoveImage('', DataSet.Name, 'id', DataSet['id']);
end;

function TDM.GetImagesPath: String;
begin
  Result := 'images\hotels\';
end;

function TDM.GetImagesPathL: String;
begin
  Result := IncludeTrailingPathDelimiter(
    FDataBasePath + GetImagesPath + Hotels.FieldByName('id').AsString);
end;

function TDM.GetImagesPathR: String;
begin
  Result := '';
end;

procedure TDM.RemoveImage;
var
  LFileName: String;
  LLocateStr: String;
  LKeyValues: Variant;
begin
  SysUtils.DeleteFile(AImageName);
  LFileName := ExtractFileName(AImageName);
  with Images do
  begin
    LLocateStr := 'table;table_key;filename';
    LKeyValues := VarArrayOf([ATable, AKey, LFileName]);
    if LFileName = '' then
    begin
      LLocateStr := 'table;table_key';
      LKeyValues := VarArrayOf([ATable, AKey])
    end;
    if Locate(LLocateStr, LKeyValues, [loPartialKey])
    then
      Delete
    else
      AddImage(AImageName, ATable, AKeyName, AKey, True);
  end;
end;

procedure TDM.AddImage(const AImageName, ATable, AKeyName: String;
  AKey: Integer; ADelete: Boolean = False);
var
  LPath, RPath, LFileName: String;
begin
  LFileName := ExtractFileName(AImageName);
  LPath := ExtractFilePath(AImageName);
  RPath := Copy(LPath, Length(FDataBasePath) + 1, Length(LPath));
  RPath := DosPathToUnixPath(RPath);
  with Images do
  begin
    Append;
    FieldValues['table'] := ATable;
    FieldValues['table_keyname'] := AKeyName;
    FieldValues['table_key'] := AKey;
    FieldValues['localpath'] := LPath;
    FieldValues['remotepath'] := RPath;
    FieldValues['filename'] := LFileName;
    FieldValues['is_deleted'] := ADelete;
    Post;
  end;
end;

procedure TDM.AddImage2(const ASourceImageName, ATable, AKeyName: String;
  AKey: Integer; ADelete: Boolean);
var
  LFileName, LPath: String;
  LImageName: String;
begin
  LFileName := ExtractFileName(ASourceImageName);
  LPath := GetImagesPathL + 'images\';
  if not DirectoryExists(LPath) then
    ForceDirectories(LPath);
  LImageName := LPath + LFileName;
  CopyFile(PChar(ASourceImageName), PChar(LImageName), False);
  AddImage(LImageName, ATable, AKeyName, AKey);
end;

end.
