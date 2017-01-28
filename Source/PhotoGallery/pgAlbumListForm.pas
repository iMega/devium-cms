{----------------------------------------------------------------------

   DEVIUM Content Management System
   Copyright (C) 2004 by DEIV Development Team.
   http://www.deiv.com/

   $Header: /devium/Devium\040CMS\0402/Source/PhotoGallery/pgAlbumListForm.pas,v 1.1 2004/05/06 07:15:42 paladin Exp $

------------------------------------------------------------------------}
unit pgAlbumListForm;

interface

uses
  Forms, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxEdit, DB,
  cxDBData, Classes, ActnList, Menus, TB2Item, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, ComCtrls, TB2Dock, TB2Toolbar,
  Controls, DBClient;

type
  TAlbumListForm = class(TForm)
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBPopupMenu1: TTBPopupMenu;
    StatusBar: TStatusBar;
    TBSubmenuItem1: TTBSubmenuItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    ActionList: TActionList;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    is_visible: TcxGridDBColumn;
    last_update: TcxGridDBColumn;
    title: TcxGridDBColumn;
    AlbumEdit: TAction;
    AlbumDel: TAction;
    AlbumAdd: TAction;
    TBItem4: TTBItem;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem7: TTBItem;
    TBSeparatorItem2: TTBSeparatorItem;
    SortUp: TAction;
    SortDown: TAction;
    TBSeparatorItem3: TTBSeparatorItem;
    TBItem8: TTBItem;
    TBItem9: TTBItem;
    TBItem10: TTBItem;
    procedure AlbumAddExecute(Sender: TObject);
    procedure AlbumEditExecute(Sender: TObject);
    procedure AlbumDelExecute(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure AlbumEditUpdate(Sender: TObject);
    procedure SortUpUpdate(Sender: TObject);
    procedure SortUpExecute(Sender: TObject);
    procedure SortDownExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FGalleryId: Integer;
    function GetNextSortOrder(DataSet: TDataSet; FieldName: String): Integer;
    procedure ReSortDataSet(DataSet: TClientDataSet; FieldName: String;
      ADelta: Integer);
  public
    property GalleryId: Integer read FGalleryId write FGalleryId;
  end;

function GetAlbumListForm(GalleryId: Integer): Integer;

implementation

uses pgMainForm, pgDataModule, pgAlbumForm, Windows, SysUtils, Math;

{$R *.dfm}

function GetAlbumListForm;
var
  Form: TAlbumListForm;
begin
  Form := TAlbumListForm.Create(Application);
  try
    Form.GalleryId := GalleryId;
    Result := Form.ShowModal;
  finally
    Form.Free;
  end;
end;

procedure TAlbumListForm.AlbumAddExecute(Sender: TObject);
var
  SortOrder: Integer;
begin
  with DM.Albums do
  begin
    SortOrder := GetNextSortOrder(DM.Albums, 'sort_order');
    Append;
    FieldValues['sort_order'] := SortOrder;
    FieldValues['gallery_id'] := FGalleryId;
    if GetAlbumForm = mrOK then
      Post
    else
      Cancel;
  end;
end;

procedure TAlbumListForm.AlbumEditExecute(Sender: TObject);
var
  OldName: String;
  s1, s2: String;
begin
  with DM.Albums do
  begin
    OldName := FieldValues['name'];
    Edit;
    if GetAlbumForm = mrOK then
    begin
      Post;
      if OldName <> FieldValues['name'] then
      begin
        s1 := DM.GetFilesPath(DM.Albums);
        s2 := DM.GetFilesPath(DM.List) + OldName;
        RenameFile(s2, s1);
        DM.RenDir(s2, s1);        
      end;
    end
    else
      Cancel;
  end;
end;

procedure TAlbumListForm.AlbumDelExecute(Sender: TObject);
begin
  if MessageBox(Handle, 'Вы точно уверенны что хотите это сделать?'  + #13#10 +
    'Удаление альбомаприбедет к удалению всех фотографий.',
    PChar(Caption),
    MB_YESNO + MB_ICONQUESTION) = IDNO then Exit;
  { TODO :  }
  while DM.Photos.Locate('album_id', DM.Albums['id'], []) do
    DM.Photos.Delete;
  DM.Albums.Delete;
end;

procedure TAlbumListForm.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  AlbumEdit.Execute;
end;

procedure TAlbumListForm.AlbumEditUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := DM.Albums.RecordCount > 0;
end;

procedure TAlbumListForm.SortUpUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := DM.Albums.RecordCount > 1;
end;

procedure TAlbumListForm.SortUpExecute(Sender: TObject);
begin
  ReSortDataSet(DM.Albums, 'sort_order', -15);
end;

procedure TAlbumListForm.SortDownExecute(Sender: TObject);
begin
  ReSortDataSet(DM.Albums, 'sort_order', 15);
end;

procedure TAlbumListForm.FormCreate(Sender: TObject);
begin
  cxGrid1DBTableView1.DataController.DataSource := DM.dsAlbums;
end;

function TAlbumListForm.GetNextSortOrder(DataSet: TDataSet; FieldName: String): Integer;
var
   SavePlace: TBookmark;
begin
  Result := 0;
  with DataSet do
  begin
    DisableControls;
    SavePlace := GetBookmark;
    try
      First;
      while not EOF do
      begin
        Result := Max(Result, FieldValues[FieldName]);
        Next;
      end;
      GotoBookmark(SavePlace);
    finally
      FreeBookmark(SavePlace);
    end;
    EnableControls;
  end;
  Result := Result + 10;
end;

procedure TAlbumListForm.ReSortDataSet(DataSet: TClientDataSet; FieldName: String;
  ADelta: Integer);
var
   SavePlace: TBookmark;
   n: Integer;
   OldIndexFieldNames: String;
begin
  with DataSet do
  begin
    DisableControls;
    Edit;
    DataSet[FieldName] := DataSet[FieldName] + ADelta;
    Post;
    OldIndexFieldNames := IndexFieldNames;
    IndexFieldNames := FieldName;
    SavePlace := GetBookmark;
    try
      n := RecordCount;
      Last;
      while not BOF do
      begin
        Edit;
        FieldValues[FieldName] := n * 10;
        Post;
        Dec(n);
        Prior;
      end;
      GotoBookmark(SavePlace);
    finally
      FreeBookmark(SavePlace);
    end;
    IndexFieldNames := OldIndexFieldNames;
    EnableControls;
  end;
end;

end.
