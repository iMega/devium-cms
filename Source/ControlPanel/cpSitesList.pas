{----------------------------------------------------------------------

   DEVIUM Content Management System
   Copyright (C) 2004 by DEIV Development Team.
   http://www.deiv.com/

   $Header: /devium/Devium\040CMS\0402/Source/ControlPanel/cpSitesList.pas,v 1.3 2004/04/17 12:17:05 paladin Exp $

------------------------------------------------------------------------}
{$WARNINGS OFF}
unit cpSitesList;

interface

uses Classes;

type
  TSite = class(TCollectionItem)
  private
    FName: String;
    FRoot: String;
    function GetPath: String;
    procedure SetRoot(const Value: String);
    procedure SetName(const Value: String);
  public
    property Name: String read FName write SetName;
    property Path: String read GetPath;
    property Root: String read FRoot write SetRoot;
  end;

  TSitesList = class(TCollection)
  private
    FPath: String;
    procedure SetPath(const Value: String);
    function GetItem(Index: Integer): TSite;
    procedure SetItem(Index: Integer; const Value: TSite);
  public
    constructor Create(const APath: String);
    destructor Destroy; override;
    function Add: TSite;
    procedure Load;
    procedure AddSite(const AName: String);
    property Path: String read FPath write SetPath;
    property Items[Index: Integer]: TSite read GetItem write SetItem; default;
  end;
  
implementation

uses SysUtils;

{ TSitesList }

function TSitesList.Add: TSite;
begin
  Result := TSite(inherited Add);
end;

procedure TSitesList.AddSite(const AName: String);
begin
  CreateDir(FPath + AName);
  Load;
end;

constructor TSitesList.Create;
begin
  inherited Create(TSite);
  Path := APath;
  Load;
end;

destructor TSitesList.Destroy;
begin
  inherited;
end;

function TSitesList.GetItem(Index: Integer): TSite;
begin
  Result := TSite(inherited GetItem(Index));
end;

procedure TSitesList.Load;
var
  sr: TSearchRec;
  Site: TSite;
begin
  Clear;
  if FindFirst(FPath + '*.*', faAnyFile, sr) = 0 then
  begin
    repeat
      if (sr.Name <> '..') and (sr.Name <> '.')
        and ((sr.Attr and faHidden) <> faHidden)
        and ((sr.Attr and faDirectory) = faDirectory) then
      begin
        Site := Add;
        Site.Name := sr.Name;
        Site.Root := FPath;
      end;
    until FindNext(sr) <> 0;
    FindClose(sr);
  end;
end;

procedure TSitesList.SetItem(Index: Integer; const Value: TSite);
begin
  inherited SetItem(Index, Value);
end;

procedure TSitesList.SetPath(const Value: String);
begin
  if FPath <> Value then
  begin
    FPath := Value;
    FPath := IncludeTrailingPathDelimiter(FPath);
  end;
end;

{ TSite }

function TSite.GetPath: String;
begin
  Result := FRoot + FName;
  Result := IncludeTrailingPathDelimiter(Result);
end;

procedure TSite.SetName(const Value: String);
begin
  if FName <> Value then
  begin
    if FName <> '' then
      RenameFile(FName, Value);
    FName := Value
  end;
end;

procedure TSite.SetRoot(const Value: String);
begin
  if FRoot <> Value then
  begin
    FRoot := Value;
    FRoot := IncludeTrailingPathDelimiter(FRoot);
  end;
end;

end.
