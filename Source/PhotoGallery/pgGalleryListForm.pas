{----------------------------------------------------------------------

   DEVIUM Content Management System
   Copyright (C) 2004 by DEIV Development Team.
   http://www.deiv.com/

   $Header: /devium/Devium\040CMS\0402/Source/PhotoGallery/pgGalleryListForm.pas,v 1.4 2004/04/17 12:19:01 paladin Exp $

------------------------------------------------------------------------}
unit pgGalleryListForm;

interface

uses
  Forms, Menus, TB2Item, TB2Dock, TB2Toolbar, Classes, Controls, TBSkinPlus,
  ComCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxEdit,
  DB, cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ActnList;

type
  TGalleryListForm = class(TForm)
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBPopupMenu1: TTBPopupMenu;
    StatusBar: TStatusBar;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    is_visible: TcxGridDBColumn;
    title: TcxGridDBColumn;
    TBSubmenuItem1: TTBSubmenuItem;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    ActionList1: TActionList;
    GalEdit: TAction;
    GalNew: TAction;
    GalDel: TAction;
    MoveUp: TAction;
    MoveDown: TAction;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBItem7: TTBItem;
    TBSeparatorItem2: TTBSeparatorItem;
    TBItem8: TTBItem;
    TBItem9: TTBItem;
    TBItem10: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBItem11: TTBItem;
    TBItem12: TTBItem;
    TBItem13: TTBItem;
    TBItem14: TTBItem;
    TBItem15: TTBItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBSeparatorItem5: TTBSeparatorItem;
    procedure GalNewExecute(Sender: TObject);
    procedure GalEditExecute(Sender: TObject);
    procedure GalDelExecute(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure GalEditUpdate(Sender: TObject);
    procedure MoveUpUpdate(Sender: TObject);
    procedure MoveUpExecute(Sender: TObject);
    procedure MoveDownExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function GetGalleryListForm: Integer;

implementation

uses pgMainForm, pgDataModule, pgGalleryForm, Windows, DeviumLib;

{$R *.dfm}

function GetGalleryListForm: Integer;
var
  Form: TGalleryListForm;
begin
  Form := TGalleryListForm.Create(Application);
  try
    Result := Form.ShowModal;
  finally
    Form.Free;
  end;
end;

procedure TGalleryListForm.GalNewExecute(Sender: TObject);
begin
  with DM.List do
  begin
    Append;
    if GetGalleryForm = mrOK then
      Post
    else
      Cancel;
  end;
end;

procedure TGalleryListForm.GalEditExecute(Sender: TObject);
begin
  with DM.List do
  begin
    Edit;
    if GetGalleryForm = mrOK then
      Post
    else
      Cancel;
  end;
end;

procedure TGalleryListForm.GalDelExecute(Sender: TObject);
var
  s: String;
begin
  if MessageBox(Handle, 'Вы точно уверенны что хотите это сделать?'  + #13#10 +
    'Удаление галереии прибедет к удалению всех альбомов.',
    PChar(Caption),
    MB_YESNO + MB_ICONQUESTION) = IDNO then Exit;
  { TODO :  }
  s := DM.GetFilesPath(DM.List);
  ForceDeleteDir(s);
  while DM.Albums.Locate('gallery_id', DM.List['id'], []) do
  begin
    while DM.Photos.Locate('album_id', DM.Albums['id'], []) do
      DM.Photos.Delete;
    DM.Albums.Delete;
  end;
  DM.List.Delete;
end;

procedure TGalleryListForm.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  GalEdit.Execute;
end;

procedure TGalleryListForm.GalEditUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := DM.List.RecordCount > 0;
end;

procedure TGalleryListForm.MoveUpUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := DM.List.RecordCount > 1;
end;

procedure TGalleryListForm.MoveUpExecute(Sender: TObject);
begin
{ TODO :  }
end;

procedure TGalleryListForm.MoveDownExecute(Sender: TObject);
begin
{ TODO :  }
end;

procedure TGalleryListForm.FormCreate(Sender: TObject);
begin
  cxGrid1DBTableView1.DataController.DataSource := DM.dsList;
end;

end.
