{----------------------------------------------------------------------

   DEVIUM Content Management System
   Copyright (C) 2004 by DEIV Development Team.
   http://www.deiv.com/

   $Header: /devium/Devium\040CMS\0402/Source/Common/FilesLib.pas,v 1.4 2004/04/10 07:12:30 paladin Exp $

------------------------------------------------------------------------}
unit FilesLib;

interface

uses Classes;

type
  TFile = class(TCollectionItem)
  private
    FLocalPath: String;
    FRemotePath: String;
    FAction: Integer;
  public
    property Action: Integer read FAction write FAction;
    property LocalPath: String read FLocalPath write FLocalPath;
    property RemotePath: String read FRemotePath write FRemotePath;
  end;

  TFiles = class(TCollection)
  private
    FURL: String;
    function GetItem(Index: Integer): TFile;
    procedure SetItem(Index: Integer; const Value: TFile);
  public
    constructor Create;
    function Add: TFile;
    property Items[Index: Integer]: TFile read GetItem write SetItem; default;
    property URL: String read FURL write FURL;
  end;

const
  // магические номера
  POST_FILE     = 1;
  GET_FILE      = 2;
  DELETE_DIR    = 3;
  DELETE_FILE   = 4;
  RENAME_FILE   = 5;
  RENAME_DIR    = 6;
  GET_FILE_INFO = 7;
  
implementation

{ TFiles }

function TFiles.Add: TFile;
begin
  result := TFile(inherited Add);
end;

constructor TFiles.Create;
begin
  inherited Create(TFile);
end;

function TFiles.GetItem(Index: Integer): TFile;
begin
  Result := TFile(inherited GetItem(Index));
end;

procedure TFiles.SetItem(Index: Integer; const Value: TFile);
begin
  inherited SetItem(Index, Value);
end;

end.
