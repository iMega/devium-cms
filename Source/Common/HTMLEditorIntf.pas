{----------------------------------------------------------------------

   DEVIUM Content Management System
   Copyright (C) 2004 by DEIV Development Team.
   http://www.deiv.com/

   $Header: /devium/Devium\040CMS\0402/Source/Common/HTMLEditorIntf.pas,v 1.2 2004/04/07 10:33:59 paladin Exp $

------------------------------------------------------------------------}
unit HTMLEditorIntf;

interface

uses Classes;

type
  IHTMLEditor = interface(IInterface)
  ['{B69F0902-1F72-4800-8058-6A3E33F404FA}']
    function Execute(var Text: String): Boolean;
    function GetLocalPath: String;
    function GetRemotePath: String;
    function GetFilesList: TStringList;
    procedure SetLocalPath(const Value: String);
    procedure SetRemotePath(const Value: String);
    procedure SetFilesList(const Valye: TStringList);
    property LocalPath: String read GetLocalPath write SetLocalPath;
    property RemotePath: String read GetRemotePath write SetRemotePath;
    property FilesList: TStringList read GetFilesList write SetFilesList;
  end;

implementation

end.
