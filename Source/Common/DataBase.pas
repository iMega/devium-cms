{----------------------------------------------------------------------

   DEVIUM Content Management System
   Copyright (C) 2004 by DEIV Development Team.
   http://www.deiv.com/

   $Header: /devium/Devium\040CMS\0402/Source/Common/DataBase.pas,v 1.7 2004/05/14 09:38:10 paladin Exp $

------------------------------------------------------------------------}
unit DataBase;

interface

uses
  SysUtils, Classes, PluginManagerIntf, DB, DBClient, SOAPConn, xmldom,
  XMLIntf, msxmldom, XMLDoc, DataBaseIntf, SettingsIntf;

type
  TDB = class(TDataModule, IDataBase)
    SoapConnection: TSoapConnection;
    XMLDocument: TXMLDocument;
    RemoteTasks: TClientDataSet;
    procedure DataModuleDestroy(Sender: TObject);
    procedure SoapConnectionAfterExecute(const MethodName: String;
      SOAPResponse: TStream);
    procedure DataModuleCreate(Sender: TObject);
  private
    FPluginManager: IPluginManager;
    FDataPath: String;
    FSettings: ISettings;
    FOldName: Variant;
    procedure SetDataPath(const Value: String);
    procedure SetPluginManager(const Value: IPluginManager);
  protected
    procedure OpenDataFile(const DataBasePrefix, DataPath: String); virtual;
    procedure DeleteDataFiles; virtual;
    procedure OpenDataSet(DataSet: TClientDataSet; const Prefix,
      Path: String); virtual;
    procedure OpenRemoteTasks;
    procedure SplitPath(const AFileName: String; var LocalPath,
      RemotePath, FileName: String); virtual;
    procedure DataSetBeforePost(DataSet: TDataSet); virtual;
    procedure DataSetBeforeDelete(DataSet: TDataSet); virtual;
    procedure DataSetAfterPost(DataSet: TDataSet); virtual;
  public
    { работа с путем для файлов }
    function GetFilesPath(DataSet: TDataSet): String; virtual;
    function GetRemotePath(const LocalPath: String): String; overload; virtual;
    function GetRemotePath(DataSet: TDataSet): String; overload; virtual;
    function GetLocalPath(DataSet: TDataSet): String; virtual;
    { методы для данных}
    procedure Open; virtual;
    procedure Close; virtual;
    procedure ApplyUpdates; virtual;
    procedure Refresh; virtual;
    function CanApplyUpdates: Boolean; virtual;
    function GetStatsuBarString: String; virtual;
    { работа с очередью }
    procedure AddFile(DataSet: TDataSet; const AFileName: String);
    procedure DelFile(const AFileName: String);
    procedure DelDir(ADirName: String);
    procedure RenFile(AOldName, NewName: String);
    procedure RenDir(AOldName, NewName: String);
    procedure GetFile(AFileName: String);
    procedure GetDir(ADirName: String);
    { прочие методы для данных }
    function GetNextSortOrder(DataSet: TDataSet; const AFieldName: String;
      const AFilter: String = ''): Integer; virtual;
    procedure ReSort(DataSet: TDataSet; const AFieldName: String; ADelta: Integer;
      const AFilter: String = ''); virtual;
    { properties }
    property PluginManager: IPluginManager read FPluginManager write SetPluginManager;
    property DataPath: String read FDataPath write SetDataPath;
    property Settings: ISettings read FSettings;
  end;

const
  REMOTE_SERVER_DATASET_TAG = 100;
  NAME_FIELD = 'name';
  
implementation

uses ZLIBEX, EncdDecd, FilesLib,
  ProgressCopyFrm, Controls, DeviumLib, Variants, Math;

{$R *.dfm}

{ TDB }

procedure TDB.ApplyUpdates;
var
  F: TFiles;
  fi: TFile;
  i: Integer;
  DataSet: TClientDataSet;
  AFilter: String;
begin
  F := TFiles.Create;
  try
    F.URL := Settings.HttpRoot + 'upload_server.php';
    AFilter := '';
    for i := 0 to ComponentCount - 1 do
    begin
      if (Components[i] is TClientDataSet) then
      begin
        DataSet := TClientDataSet(Components[i]);
        if Assigned(DataSet.RemoteServer) then
        begin
          AFilter := AFilter + Format('dataset=''%s'' or ', [DataSet.Name]);
        end;
      end;
    end;
    AFilter := Copy(AFilter, 1, Length(AFilter) - 4); // remode ' or '

    with RemoteTasks do
    begin
      DisableControls;
      
      Filter := AFilter;
      Filtered := True;

      First;
      while not EOF do
      begin
        fi := F.Add;
        fi.LocalPath := FieldByName('filename').AsString;
        fi.RemotePath := GetRemotePath(fi.LocalPath);
        fi.Action := FieldByName('action').AsInteger;
        Next;
      end;
      if F.Count > 0 then
      begin
        GetProgressCopyForm(F);
        while not EOF do Delete;
      end;
      Filtered := False;
      EnableControls;
    end;
  finally
    f.Free;
  end;

  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TClientDataSet) then
    begin
      DataSet := TClientDataSet(Components[i]);
      if Assigned(DataSet.RemoteServer) then
        DataSet.ApplyUpdates(-1);
    end;
  end;
end;

function TDB.CanApplyUpdates: Boolean;
var
  DataSet: TClientDataSet;
  i: Integer;
begin
  Result := False;
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TClientDataSet) then
    begin
      DataSet := TClientDataSet(Components[i]);
      if Assigned(DataSet.RemoteServer) then
        Result := Result or (DataSet.ChangeCount > 0);
    end;
  end;
end;

procedure TDB.Close;
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TClientDataSet) then
      TClientDataSet(Components[i]).Close;
  end;
end;

procedure TDB.Open;
begin
  Settings.SetupSoapConnection(SoapConnection);
  OpenDataFile(Settings.DataBasePrefix, FDataPath);
  OpenRemoteTasks;
end;

procedure TDB.Refresh;
begin
  Close;
  DeleteDataFiles;
  Open;
end;

procedure TDB.SetDataPath(const Value: String);
begin
  FDataPath := IncludeTrailingPathDelimiter(Value);
end;

procedure TDB.SetPluginManager(const Value: IPluginManager);
begin
  FPluginManager := Value;
  FPluginManager.GetPlugin(ISettings, FSettings);  
end;

procedure TDB.DataModuleDestroy(Sender: TObject);
begin
  Close;
end;

procedure TDB.OpenDataFile(const DataBasePrefix, DataPath: String);
var
  DataSet: TClientDataSet;
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TClientDataSet) then
    begin
      DataSet := TClientDataSet(Components[i]);
      if Assigned(DataSet.RemoteServer) then
        OpenDataSet(DataSet, DataBasePrefix, DataPath)
    end;
  end;
end;

procedure TDB.DeleteDataFiles;
var
  DataSet: TClientDataSet;
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TClientDataSet) then
    begin
      DataSet := TClientDataSet(Components[i]);
      if Assigned(DataSet.RemoteServer) then
        DeleteFile(DataSet.FileName);
    end;
  end;
end;

procedure TDB.OpenDataSet(DataSet: TClientDataSet; const Prefix,
  Path: String);
begin
  DataSet.ProviderName := Prefix + DataSet.ProviderName;
  DataSet.FileName := Path + DataSet.ProviderName + '.xml';
  DataSet.BeforePost := DataSetBeforePost;
  DataSet.BeforeDelete := DataSetBeforeDelete;
  DataSet.AfterPost := DataSetAfterPost;
  DataSet.Open;
  DataSet.SaveToFile();
end;

procedure TDB.SoapConnectionAfterExecute(const MethodName: String;
  SOAPResponse: TStream);
var
  s: String;
begin
  if MethodName = 'AS_ApplyUpdates' then Exit;
  SOAPResponse.Position := 0;
  XMLDocument.LoadFromStream(SOAPResponse);
  s := XMLDocument.DocumentElement.ChildNodes[0].ChildNodes[0].ChildNodes[0].Text;
  s := DecodeString(s);
  s := ZDecompressStr(s);
  s := EncodeString(s);
  XMLDocument.DocumentElement.ChildNodes[0].ChildNodes[0].ChildNodes[0].Text := s;
  SOAPResponse.Size := 0;
  XMLDocument.SaveToStream(SOAPResponse);
end;

procedure TDB.DataModuleCreate(Sender: TObject);
var
  DataSet: TClientDataSet;
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TClientDataSet) then
    begin
      DataSet := TClientDataSet(Components[i]);
      if DataSet.Tag = REMOTE_SERVER_DATASET_TAG then
        DataSet.RemoteServer := SoapConnection;
    end;
  end;
end;

procedure TDB.OpenRemoteTasks;
begin
  RemoteTasks.FileName := DataPath + RemoteTasks.Name + '.xml';
  try
    RemoteTasks.Open;
  except
    RemoteTasks.CreateDataSet;
  end;
  RemoteTasks.LogChanges := False;
  RemoteTasks.SaveToFile();
end;

procedure TDB.AddFile(DataSet: TDataSet; const AFileName: String);
begin
  with RemoteTasks do
  begin
    // если файл уже есть с писке ?
    if Locate('filename;action', VarArrayOf([AFileName, POST_FILE]),
      [loPartialKey]) then Exit;

    // если с писке на удаление
    if Locate('filename;action', VarArrayOf([AFileName, DELETE_FILE]),
      [loPartialKey]) then  Delete;

    Append;
    FieldValues['filename'] := AFileName;
    FieldValues['action'] := POST_FILE;
    FieldValues['dataset'] := DataSet.Name;
    FieldValues['key'] := DataSet.Fields[0].Value;
    Post;
  end;
end;

procedure TDB.DelDir(ADirName: String);
begin
  with RemoteTasks do
  begin
    // если файл уже есть с писке ?
    while  Locate('filename', ADirName, [loPartialKey]) do
      Delete;

    Append;
    FieldValues['filename'] := ADirName;
    FieldValues['action'] := DELETE_DIR;
    Post;
  end;
end;

procedure TDB.DelFile(const AFileName: String);
begin
  with RemoteTasks do
  begin
    // если файл уже есть с писке ?
    if Locate('filename;action', VarArrayOf([AFileName, DELETE_FILE]),
      [loPartialKey]) then Exit;

    // если с писке на удаление
    if Locate('filename;action', VarArrayOf([AFileName, POST_FILE]),
      [loPartialKey]) then
     begin
      Delete;
      Exit;
     end;

    Append;
    FieldValues['filename'] := AFileName;
    FieldValues['action'] := DELETE_FILE;
    Post;
  end;
end;

procedure TDB.RenDir(AOldName, NewName: String);
begin
  with RemoteTasks do
  begin
    Append;
    FieldValues['filename'] := AOldName;
    FieldValues['new_filename'] := NewName;
    FieldValues['action'] := RENAME_DIR;
    Post;
  end;
end;

procedure TDB.RenFile(AOldName, NewName: String);
begin
  with RemoteTasks do
  begin
    Append;
    FieldValues['filename'] := AOldName;
    FieldValues['new_filename'] := NewName;
    FieldValues['action'] := RENAME_FILE;
    Post;
  end;
end;

procedure TDB.GetDir(ADirName: String);
begin

end;

procedure TDB.GetFile(AFileName: String);
begin

end;

procedure TDB.SplitPath(const AFileName: String; var LocalPath, RemotePath,
  FileName: String);
begin
  LocalPath := ExtractFilePath(AFileName);
  FileName := ExtractFileName(AFileName);
  RemotePath := Copy(LocalPath, Length(FDataPath), Length(RemotePath));
  RemotePath := DosPathToUnixPath(RemotePath);
end;

// больба с блобавми, нулевае блобы
procedure TDB.DataSetBeforePost(DataSet: TDataSet);
var
  I: Integer;
begin
  FOldName := NULL;
  for I := 0 to DataSet.FieldCount - 1 do
  begin
    if (DataSet.Fields[i] is TBlobField) and (DataSet.Fields[i].IsNull) then
      DataSet.Fields[i].Value := #32;
    if (DataSet.Fields[i].FieldName = NAME_FIELD) then
      FOldName := DataSet.Fields[i].Value;
  end;      
end;

function TDB.GetFilesPath(DataSet: TDataSet): String;
begin
  Result := '';
end;

// попвтка удалить все файла которые пренадлежат данной записи
procedure TDB.DataSetBeforeDelete(DataSet: TDataSet);
var
  sl: TStringList;
  i: Integer;
begin
  sl := TStringList.Create;
  try
    sl.Text := GetFilesPath(DataSet);
    for i := 0  to sl.Count - 1 do
    begin
      if FileExists(sl[i]) then
      begin
        DeleteFile(sl[i]);
        DelFile(sl[i]);
      end
      else
      begin
        ForceDeleteDir(sl[i]);
        DelDir(sl[i]);
      end;
    end;
  finally
    sl.Free;
  end;
end;

// получение статцсной информации
function TDB.GetStatsuBarString: String;
var
  DataSet: TClientDataSet;
  i: Integer;
begin
  Result := '';
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TClientDataSet) then
    begin
      DataSet := TClientDataSet(Components[i]);
      if DataSet.Tag = REMOTE_SERVER_DATASET_TAG then
        Result := Result + Format('%s: %d; ', [DataSet.Name, DataSet.ChangeCount]);
    end;
  end;
end;

function TDB.GetRemotePath(const LocalPath: String): String;
begin
  Result := Copy(LocalPath, Length(DataPath), Length(LocalPath));
  Result := {Settings.HttpRoot + }DosPathToUnixPath(Result);
end;

function TDB.GetRemotePath(DataSet: TDataSet): String;
begin
  Result := GetFilesPath(DataSet);
  Result := GetRemotePath(Result);
end;

procedure TDB.DataSetAfterPost(DataSet: TDataSet);
var
  FileList: String;
  sl: TStringList;
  i: Integer;
  NewValue: Variant;
begin
  FileList := GetFilesPath(DataSet);
  if FileList <> '' then
  begin
    sl := TStringList.Create;
    try
      sl.Text := FileList;
      for i := 0 to sl.Count - 1 do
        if ExtractFileName(sl[i]) <> '' then // не папка
          AddFile(DataSet, sl[i]);
    finally
      sl.Free;
    end;
  end;
  if not VarIsNull(FOldName) then
  begin
    NewValue := DataSet.FieldByName(NAME_FIELD).Value;
    if NewValue <> FOldName then ;
    { TODO : Rename }
  end;
end;

function TDB.GetLocalPath(DataSet: TDataSet): String;
begin
  Result := '';
end;

function TDB.GetNextSortOrder(DataSet: TDataSet; const AFieldName: String;
  const AFilter: String = ''): Integer;
var
  SavePlace: TBookmark;
  OldFilter: String;
  OldFiltered: Boolean;
begin
  OldFilter := '';
  OldFiltered := False;
  Result := 0;
  with DataSet do
  begin
    DisableControls;
    SavePlace := GetBookmark;
    if Length(AFilter) > 0 then
    begin
      OldFilter := Filter;
      OldFiltered := Filtered;
      Filter := AFilter;
      Filtered := True;
    end;
    try
      First;
      while not EOF do
      begin
        Result := Max(Result, FieldByName(AFieldName).AsInteger);
        Next;
      end;
      if Length(AFilter) > 0 then
      begin
        Filter := OldFilter;
        Filtered := OldFiltered;
      end;
      GotoBookmark(SavePlace);
    finally
      FreeBookmark(SavePlace);
    end;
    EnableControls;
  end;
  Result := Result + 10;
end;

procedure TDB.ReSort(DataSet: TDataSet; const AFieldName: String;
  ADelta: Integer; const AFilter: String);
var
  Sort: Integer;
  Key: Variant;
  OldFilter: String;
  OldIndexFieldNames: String;
  OldFiltere: Boolean;
begin
  { TODO -oPaladin : Filter }
  with TClientDataSet(DataSet) do
  begin
    DisableControls;
    Key := Fields[0].Value;
    // save filter
    OldFilter := Filter;
    OldFiltere := Filtered;
    // set filter
    OldIndexFieldNames := IndexFieldNames;
    IndexFieldNames := AFieldName;
    Filter := AFilter;
    if Length(AFilter) > 0 then
      Filtered := True;
    // go
    IndexFieldNames := AFieldName;
    Edit;
    FieldValues[AFieldName] := ADelta + FieldValues[AFieldName];
    Post;
    Sort := RecordCount;
    Last;
    while not BOF do
    begin
      Edit;
      FieldValues[AFieldName] := Sort * 10;
      Post;
      Prior;
      Dec(Sort);
    end;
    //restore filter
    Filter := OldFilter;
    Filtered := OldFiltere;
    IndexFieldNames := OldIndexFieldNames;
    // return
    EnableControls;
    Locate(Fields[0].FieldName, Key, [loPartialKey]);
  end;
end;

end.
