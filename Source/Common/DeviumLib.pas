{----------------------------------------------------------------------

   DEVIUM Content Management System
   Copyright (C) 2004 by DEIV Development Team.
   http://www.deiv.com/

   $Header: /devium/Devium\040CMS\0402/Source/Common/DeviumLib.pas,v 1.5 2004/05/14 09:38:10 paladin Exp $

------------------------------------------------------------------------}
unit DeviumLib;

interface

uses DBClient, Classes, Windows;

procedure OpenDataSet(DataSet: TClientDataSet; const Prefix, Path: String);

function TransLiterStr(const Value: String): String;
function LowerCaseRus(const S: string): string;

procedure ApplyUpdates(DM: TDataModule);
function CanApplyUpdates(DM: TDataModule): Boolean;
procedure Close(DM: TDataModule);
procedure Open(DM: TDataModule; const DataBasePrefix, DataPath: String);
procedure SoapConnectionAfterExecute(const MethodName: String;
  SOAPResponse: TStream);
procedure DeleteDataFiles(DM: TDataModule);

function UnixPathToDosPath(const Path: string): string;
function DosPathToUnixPath(const Path: string): string;

// files
function ForceDeleteDir(const AName: String): Boolean;
function ForceDeleteDirOrFile(const AName: String): Boolean;

// Unix timestamp
// введена из-за проблем с часовыми поясами
function DateTimeToUnixPHP(const AValue: TDateTime): Int64;
function UnixToDateTimePHP(const AValue: Int64): TDateTime;
  
implementation

uses StrUtils, XMLDoc, ZLIBEX, EncdDecd, SysUtils, DateUtils;

function DateTimeToUnixPHP(const AValue: TDateTime): Int64;
var
  lpUniversalTime, lpLocalTime: TSystemTime;
  lpFileTime, lpFileTimeUTC: TFileTime;
begin
  DateTimeToSystemTime(AValue, lpLocalTime);
  SystemTimeToFileTime(lpLocalTime, lpFileTime);
  LocalFileTimeToFileTime(lpFileTime, lpFileTimeUTC);
  FileTimeToSystemTime(lpFileTimeUTC, lpUniversalTime);
  Result := DateTimeToUnix(SystemTimeToDateTime(lpUniversalTime));
end;

function UnixToDateTimePHP(const AValue: Int64): TDateTime;
var
  lpTimeZoneInformation: TIME_ZONE_INFORMATION;
  lpUniversalTime, lpLocalTime: TSystemTime;
begin
  GetTimeZoneInformation(lpTimeZoneInformation);
  DateTimeToSystemTime(UnixToDateTime(AValue), lpUniversalTime);
  SystemTimeToTzSpecificLocalTime(@lpTimeZoneInformation,
    lpUniversalTime,lpLocalTime);
  Result := SystemTimeToDateTime(lpLocalTime);
end;

function ForceDeleteDir(const AName: String): Boolean;
var
  sr: TSearchRec;
  Name, FullPath: String;
begin
  Name := IncludeTrailingPathDelimiter(AName);
  if FindFirst(Name + '*.*', faAnyFile, sr) = 0 then
  begin
    repeat
      if ((sr.Name <> '.') and (sr.Name <> '..')) then
      begin
        FullPath := Name + sr.Name;
        if ((sr.Attr and faDirectory) = faDirectory) then
          ForceDeleteDir(FullPath)
        else
          DeleteFile(FullPath);
      end;
    until FindNext(sr) <> 0;
    FindClose(sr);
  end;
  Result := RemoveDir(Name)
end;

function ForceDeleteDirOrFile(const AName: String): Boolean;
begin
  if FileExists(AName) then
    Result := DeleteFile(AName)
  else
    Result := ForceDeleteDir(AName)
end;

procedure DeleteDataFiles(DM: TDataModule);
var
  DataSet: TClientDataSet;
  i: Integer;
begin
  for i := 0 to DM.ComponentCount - 1 do
  begin
    if (DM.Components[i] is TClientDataSet) then
    begin
      DataSet := TClientDataSet(DM.Components[i]);
      if Assigned(DataSet.RemoteServer) then
        DeleteFile(DataSet.FileName);
    end;
  end;
end;

function TranslateChar(const Str: string; FromChar, ToChar: Char): string;
var
  I: Integer;
begin
  Result := Str;
  for I := 1 to Length(Result) do
    if Result[I] = FromChar then
      Result[I] := ToChar
    else
      if Result[I] = '?' then Break;
end;

function UnixPathToDosPath(const Path: string): string;
begin
  Result := TranslateChar(Path, '/', '\');
end;

function DosPathToUnixPath(const Path: string): string;
begin
  Result := TranslateChar(Path, '\', '/');
end;

procedure SoapConnectionAfterExecute(const MethodName: String;
  SOAPResponse: TStream);
var
  s: String;
  XMLDocument: TXMLDocument;
begin
  if MethodName = 'AS_ApplyUpdates' then Exit;
  XMLDocument := TXMLDocument.Create(nil);
  try
    SOAPResponse.Position := 0;
    XMLDocument.LoadFromStream(SOAPResponse);
    while not XMLDocument.IsEmptyDoc do ;
    s := XMLDocument.DocumentElement.ChildNodes[0].ChildNodes[0].ChildNodes[0].Text;
    s := DecodeString(s);
    s := ZDecompressStr(s);
    s := EncodeString(s);
    XMLDocument.DocumentElement.ChildNodes[0].ChildNodes[0].ChildNodes[0].Text := s;
    SOAPResponse.Size := 0;
    XMLDocument.SaveToStream(SOAPResponse);
  finally
    XMLDocument.Free;    
  end;
end;

procedure Open(DM: TDataModule; const DataBasePrefix, DataPath: String);
var
  DataSet: TClientDataSet;
  i: Integer;
begin
  for i := 0 to DM.ComponentCount - 1 do
  begin
    if (DM.Components[i] is TClientDataSet) then
    begin
      DataSet := TClientDataSet(DM.Components[i]);
      if Assigned(DataSet.RemoteServer) then
        OpenDataSet(DataSet, DataBasePrefix, DataPath)
    end;
  end;
end;

procedure Close(DM: TDataModule);
var
  i: Integer;
begin
  for i := 0 to DM.ComponentCount - 1 do
  begin
    if (DM.Components[i] is TClientDataSet) then
      TClientDataSet(DM.Components[i]).Close;
  end;
end;

function CanApplyUpdates(DM: TDataModule): Boolean;
var
  DataSet: TClientDataSet;
  i: Integer;
begin
  Result := False;
  for i := 0 to DM.ComponentCount - 1 do
  begin
    if (DM.Components[i] is TClientDataSet) then
    begin
      DataSet := TClientDataSet(DM.Components[i]);
      if Assigned(DataSet.RemoteServer) then
        Result := Result or (DataSet.ChangeCount > 0);
    end;
  end;
end;

procedure ApplyUpdates(DM: TDataModule);
var
  DataSet: TClientDataSet;
  i: Integer;
begin
  for i := 0 to DM.ComponentCount - 1 do
  begin
    if (DM.Components[i] is TClientDataSet) then
    begin
      DataSet := TClientDataSet(DM.Components[i]);
      if Assigned(DataSet.RemoteServer) and (DataSet.ChangeCount > 0) then
        DataSet.ApplyUpdates(-1);
    end;
  end;
end;

procedure OpenDataSet(DataSet: TClientDataSet; const Prefix, Path: String);
begin
  DataSet.ProviderName := Prefix + DataSet.ProviderName;
  DataSet.FileName := Path + DataSet.ProviderName + '.xml';
  DataSet.Open;
  DataSet.SaveToFile();
end;

function LowerCaseRus(const S: string): string;
var
  Ch: Char;
  L: Integer;
  Source, Dest: PChar;
begin
  L := Length(S);
  SetLength(Result, L);
  Source := Pointer(S);
  Dest := Pointer(Result);
  while L <> 0 do
  begin
    Ch := Source^;
    if (Ch >= 'А') and (Ch <= 'Я') then Inc(Ch, 32);
    Dest^ := Ch;
    Inc(Source);
    Inc(Dest);
    Dec(L);
  end;
  Result := LowerCase(Result);
end;

function TransLiterStr(const Value: String): String;
var
  i:Integer;
  S: String;
begin
  Result := '';
  S := LowerCaseRus(AnsiReplaceText(Value, ' ', '_'));
  for i:=1 to Length(S) do
  case S[i] Of
    'а':Result  :=  Result  +'a';
    'б':Result  :=  Result  +'b';
    'в':Result  :=  Result  +'v';
    'г':Result  :=  Result  +'g';
    'д':Result  :=  Result  +'d';
    'е':Result  :=  Result  +'e';
    'ё':Result  :=  Result  +'yo';
    'ж':Result  :=  Result  +'zh';
    'з':Result  :=  Result  +'z';
    'и':Result  :=  Result  +'i';
    'й':Result  :=  Result  +'y';
    'к':Result  :=  Result  +'k';
    'л':Result  :=  Result  +'l';
    'м':Result  :=  Result  +'m';
    'н':Result  :=  Result  +'n';
    'о':Result  :=  Result  +'o';
    'п':Result  :=  Result  +'p';
    'р':Result  :=  Result  +'r';
    'с':Result  :=  Result  +'s';
    'т':Result  :=  Result  +'t';
    'у':Result  :=  Result  +'u';
    'ф':Result  :=  Result  +'f';
    'х':Result  :=  Result  +'h';
    'ц':Result  :=  Result  +'c';
    'ч':Result  :=  Result  +'ch';
    'ш':Result  :=  Result  +'sh';
    'щ':Result  :=  Result  +'sch';
    'ы':Result  :=  Result  +'i';
    'э':Result  :=  Result  +'e';
    'ю':Result  :=  Result  +'yu';
    'я':Result  :=  Result  +'ya';
  else
    Result := Result + S[i];
  end;
  //[a-z_0-9-]+
  s := Result;
  Result := '';
  for i:=1 to Length(S) do
  case S[i] Of
    'a'..'z', '0'..'9', '_', '-': Result := Result + S[i];
  end;
end;

end.
