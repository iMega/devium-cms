{----------------------------------------------------------------------

   DEVIUM Content Management System
   Copyright (C) 2004 by DEIV Development Team.
   http://www.deiv.com/

   $Header: /devium/Devium\040CMS\0402/Source/PhotoGallery/pgMainForm.pas,v 1.5 2004/04/17 12:19:01 paladin Exp $

------------------------------------------------------------------------}
unit pgMainForm;

interface

uses
  Forms, PluginManagerIntf, Controls, ComCtrls, Classes, ActnList,
  TBSkinPlus, ImgList, TB2Item, TB2Dock, TB2Toolbar, Graphics, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, Dialogs,
  ExtDlgs, Types, Menus, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  IdBaseComponent, IdAntiFreezeBase, IdAntiFreeze, LibGfl;

type
  TMainForm = class(TForm)
    StatusBar: TStatusBar;
    ImageList20: TImageList;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBSubmenuItem1: TTBSubmenuItem;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem5: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBSeparatorItem2: TTBSeparatorItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBItem9: TTBItem;
    ImagesList: TListView;
    TBItem10: TTBItem;
    TBItem11: TTBItem;
    TBItem12: TTBItem;
    TBItem7: TTBItem;
    TBSeparatorItem5: TTBSeparatorItem;
    ProgressBar: TProgressBar;
    ActionList1: TActionList;
    TBSkin: TTBSkin;
    AlbumEdit: TAction;
    ItemAdd: TAction;
    ItemEdit: TAction;
    ItemDel: TAction;
    Refrash: TAction;
    Syn: TAction;
    ImageList150: TImageList;
    PictureDialog: TOpenPictureDialog;
    SelectAll: TAction;
    PopupMenu: TTBPopupMenu;
    LoadImage: TAction;
    TBItem13: TTBItem;
    AntiFreeze: TIdAntiFreeze;
    HTTP: TIdHTTP;
    ShowPhoto: TAction;
    pbDownLoad: TProgressBar;
    SetAsCover: TAction;
    TBItem16: TTBItem;
    GalleryList: TcxComboBox;
    TBControlItem2: TTBControlItem;
    AlbumsList: TcxComboBox;
    TBControlItem1: TTBControlItem;
    GalEdit: TAction;
    TBItem15: TTBItem;
    TBSeparatorItem7: TTBSeparatorItem;
    StatsuBar: TAction;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    TBItem6: TTBItem;
    TBItem8: TTBItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBSeparatorItem8: TTBSeparatorItem;
    TBItem17: TTBItem;
    TBItem18: TTBItem;
    TBSeparatorItem6: TTBSeparatorItem;
    TBItem19: TTBItem;
    TBSeparatorItem9: TTBSeparatorItem;
    TBItem20: TTBItem;
    TBItem21: TTBItem;
    TBItem22: TTBItem;
    TBSeparatorItem10: TTBSeparatorItem;
    TBItem14: TTBItem;
    TBItem23: TTBItem;
    procedure SynExecute(Sender: TObject);
    procedure SynUpdate(Sender: TObject);
    procedure RefrashExecute(Sender: TObject);
    procedure ItemAddExecute(Sender: TObject);
    procedure ItemDelExecute(Sender: TObject);
    procedure SelectAllExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure StatusBarDrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure AlbumsListPropertiesChange(Sender: TObject);
    procedure LoadImageExecute(Sender: TObject);
    procedure ShowPhotoExecute(Sender: TObject);
    procedure HTTPWork(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure HTTPWorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure HTTPWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure ImagesListDblClick(Sender: TObject);
    procedure SetAsCoverExecute(Sender: TObject);
    procedure GalleryListPropertiesChange(Sender: TObject);
    procedure ItemEditExecute(Sender: TObject);
    procedure GalEditExecute(Sender: TObject);
    procedure AlbumEditExecute(Sender: TObject);
    procedure StatsuBarUpdate(Sender: TObject);
    procedure ItemEditUpdate(Sender: TObject);
    procedure ShowPhotoUpdate(Sender: TObject);
    procedure LoadImageUpdate(Sender: TObject);
  private
    FPluginManager: IPluginManager;
    FDataPath: String;
    FAlbumID: Integer;
    FGalleryID: Integer;
    procedure SetPluginManager(const Value: IPluginManager);
    procedure FillData;
    procedure MakeBMP(FileName: String; Bitmap: TBitmap);
    procedure MakeImages(const FileName1, FileName2: String;
      SmallSize, BigSize: Integer; CenterCrop: Boolean);
    function GetNextSortOrder: Integer;
    procedure FillAlbums;
    procedure FillGalleryList;
    procedure EImageProcess(Error: GFL_ERROR; const Descr: String);
    procedure LoadEmptyImage;
    function CalSize(AInfo:TGFL_FILE_INFORMATION; var X, Y: Integer;
      ASize: Integer): Boolean;
    function CalSizeMax(AInfo:TGFL_FILE_INFORMATION; var X, Y: Integer;
      ASize: Integer): Boolean;
  public
    property PluginManager: IPluginManager read FPluginManager write SetPluginManager;
    property DataPath: String read FDataPath write FDataPath;
  end;

function GetMainForm(const PluginManager: IPluginManager; const DataPath: String): Integer;

implementation

uses pgDataModule, SysUtils, DB, Math, DeviumLib,
  StrUtils, DBClient, SettingsIntf, pgViewPictureFrom, pgAddParamsForm,
  pgImageForm, pgGalleryListForm, pgAlbumListForm, Windows;

{$R *.dfm}

const
  Prefix: String = 'small_';
  Suffix: String = '.jpg';

function GetMainForm(const PluginManager: IPluginManager; const DataPath: String): Integer;
var
  Form: TMainForm;
begin
  Form := TMainForm.Create(Application);
  try
    Form.DataPath := DataPath;
    Form.PluginManager := PluginManager;
    Result := Form.ShowModal;
  finally
    Form.Free;
  end;
end;

{ TMainForm }

procedure TMainForm.SetPluginManager(const Value: IPluginManager);
begin
  FPluginManager := Value;
  DM := TDM.Create(Self);
  DM.PluginManager := FPluginManager;
  DM.DataPath := FDataPath;
  DM.Open;
  FillGalleryList;
end;

procedure TMainForm.SynExecute(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    DM.ApplyUpdates;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TMainForm.SynUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := Dm.CanApplyUpdates;
end;

procedure TMainForm.RefrashExecute(Sender: TObject);
begin
  if MessageBox(Handle,
    'При этой операции все изменения, которые быле произведены, будут утеряны.' + #13#10+
    'Вы точно уверены что хотите это делать ?', PChar(Caption),
    MB_ICONQUESTION + MB_YESNO) = IDNO then Exit;

  Screen.Cursor := crHourGlass;
  try
    DM.Refresh;
    FillData;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TMainForm.ItemAddExecute(Sender: TObject);
var
  i, p: Integer;
  s: String;
  OrigFileName, NewName, NewTitle: String;
  SortOrder: Integer;
  SmallSize, BigSize: Integer;
  CenterCrop: Boolean;
begin
  { TODO -oPaladin : Доделать проверку на двойников }
  { TODO -oPaladin : добавление в очередь на закачку }
  if GetAddParamsForm(SmallSize, BigSize, CenterCrop) <> mrOK then Exit;

  with PictureDialog, DM.Photos do
  begin
    PictureDialog.Filter := 'Все (*.jpg)|*.jpg';
    if PictureDialog.Execute then
    begin
      ProgressBar.Max := Files.Count;
      ProgressBar.Position := 0;
      Screen.Cursor := crHourGlass;
      for i := 0 to Files.Count - 1 do
      begin
        OrigFileName := Files[i];
        NewTitle := ExtractFileName(OrigFileName);
        // режем расширение
        p := Pos(ExtractFileExt(NewTitle), NewTitle) - 1;
        NewTitle := Copy(NewTitle, 1, p);
        NewName := TransLiterStr(NewTitle);
        SortOrder := GetNextSortOrder;
        // добавляем запись
        Append;
        FieldValues['album_id'] := FAlbumID;
        FieldValues['name'] := NewName;
        FieldValues['title'] := NewTitle;
        FieldValues['sort_order'] := SortOrder;
        FieldValues['last_update'] := Now();
        FieldValues['is_visible'] := 1;
        Post;
        ForceDirectories(DM.GetFilesPath(DM.Albums));

        // потом треба положить двай фала в папку где лежат все фотки
        s := DM.GetFilesPath(DM.Albums) + NewName + Suffix;
        // обработка фала
        try
          MakeImages(OrigFileName, s, SmallSize, BigSize, CenterCrop);
        except
        end;
        ProgressBar.StepIt;
        Application.ProcessMessages;
      end;
      Screen.Cursor := crDefault;
    end;
  end;
  FillData;
end;


procedure TMainForm.MakeImages(const FileName1, FileName2: String;
  SmallSize, BigSize: Integer;  CenterCrop: Boolean);
var
  load_params: TGFL_LOAD_PARAMS;
  save_params: TGFL_SAVE_PARAMS;
  info: TGFL_FILE_INFORMATION;
  Image: PGFL_BITMAP;
  LWidth, LHeight: Integer;
  s: String;
  Error: Smallint;
  Res: Boolean;
  R: TGFL_RECT;
  k: Extended;
begin
  gflGetDefaultLoadParams(load_params);
  load_params.ColorModel := GFL_BGR;
  load_params.Flags := GFL_LOAD_METADATA + GFL_LOAD_READ_ALL_COMMENT +
    GFL_LOAD_COMMENT;
  gflGetDefaultSaveParams(save_params);
  save_params.Quality := 90;
  save_params.Flags := GFL_SAVE_REPLACE_EXTENSION;
  save_params.FormatIndex := 0; // JPG

  // begin
  gflLoadBitmap(PChar(FileName1), Image, load_params, info);
  Application.ProcessMessages;

  // big
  if CalSize(info, LWidth, LHeight, BigSize) then
    gflResize(Image, nil, LWidth, LHeight, GFL_RESIZE_BILINEAR, 0);
  gflSaveBitmap(PChar(FileName2), Image^, save_params);
  Application.ProcessMessages;

  // small
  if CenterCrop then
    Res := CalSizeMax(info, LWidth, LHeight, SmallSize)
  else
    Res := CalSize(info, LWidth, LHeight, SmallSize);
    
  if Res then
  begin
    gflResize(Image, nil, LWidth, LHeight, GFL_RESIZE_BILINEAR, 0);
    if CenterCrop then
    begin
      k := LWidth / LHeight;
      R.x := Trunc((LWidth/2) - (SmallSize/2)) * Integer((k > 1));
      R.y := Trunc((LHeight/2) - (SmallSize/2)) * Integer((k > 1));
      R.w := SmallSize;
      R.h := SmallSize;      
      gflCrop(Image, nil, R);
    end;
  end;
    
  s := ExtractFilePath(FileName2) + Prefix + ExtractFileName(FileName2);
  Error := gflSaveBitmap(PChar(s), Image^, save_params);
  if Error <> gfl_no_error then
    raise Exception.Create('gflSaveBitmap' + #13#10 + String(gflGetErrorString(Error)));
  // end
  Application.ProcessMessages;
  gflFreeBitmap(Image);
end;

procedure TMainForm.ItemDelExecute(Sender: TObject);
var
  i: Integer;
begin
  with DM.Photos, ImagesList do
  begin
    i := 0;
    while Items.Count > i do
      if Items[i].Selected then
      begin
        Locate('id', Integer(Items[i].Data), []);
        Delete;
        Items[i].Delete;
      end
      else
        Inc(i);
  end;
end;

procedure TMainForm.SelectAllExecute(Sender: TObject);
begin
  ImagesList.SelectAll;
end;

procedure TMainForm.MakeBMP(FileName: String; Bitmap: Graphics.TBitmap);
var
  params: TGFL_LOAD_PARAMS;
  info: TGFL_FILE_INFORMATION;
  Image: PGFL_BITMAP;
  color, line_color: TGFL_COLOR;
  lineSrc, lineDest: Pointer;
  i: Integer;
  err: GFL_ERROR;  
begin
  gflGetDefaultLoadParams(params);
  params.ColorModel := GFL_BGR;
  err := gflLoadBitmap(PChar(FileName), Image, params, info);
  EImageProcess(err, 'gflLoadBitmap');
  try
    // редаем ресизе
    color.Red := $ff;
    color.Green := $ff;
    color.Blue := $ff;
    err := gflResizeCanvas(Image, nil, 150, 150,
      GFL_CANVASRESIZE_CENTER, color);
    EImageProcess(err, 'gflResizeCanvas');
    // рисуем бордер
    line_color.Red := $e0;
    line_color.Green := $e0;
    line_color.Blue := $e0;
    err := gflDrawRectangleColor(
      Image,            //Pointer to a GFL_BITMAP structure.
      0,                // X start
      0,                // Y start
      150,       // Width of the rectangle
      150,       // Height of the rectangle
      nil,             // Pointer of a GFL_COLOR structure. If NULL, no fill.
      1,                // Width of the line (1 to 13).
      @line_color,      // Pointer of a GFL_COLOR structure. If NULL, no fill.
      GFL_LINE_STYLE_SOLID,
      nil);
    EImageProcess(err, 'gflDrawRectangleColor');
    // draw
    Bitmap.PixelFormat := pf24Bit;
    Bitmap.Width := 150;
    Bitmap.Height := 150;
    for i := 0 to Image.Height - 1 do begin
      lineSrc := Pointer(Cardinal(Image.data) + (i * Image.BytesPerLine));
      lineDest := Bitmap.Scanline[i];
      move(lineSrc^, lineDest^, Image.BytesPerLine);
    end;
  finally
    gflFreeBitmap(Image);
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  ProgressBar.Parent := StatusBar;
  pbDownLoad.Parent := StatusBar;
  gflEnableLZW(GFL_TRUE);
end;

procedure TMainForm.StatusBarDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  case Panel.Index of
  1: begin
      ProgressBar.BoundsRect := Rect;
      ProgressBar.PaintTo(StatusBar.Canvas.Handle, Rect.Left, Rect.Top);
     end;
  3: begin
      pbDownLoad.BoundsRect := Rect;
      pbDownLoad.PaintTo(StatusBar.Canvas.Handle, Rect.Left, Rect.Top);
     end;
  end;
end;

function TMainForm.GetNextSortOrder: Integer;
var
  SortOrder: Integer;
begin
  SortOrder := 0;
  with DM.Photos do
  begin
    DisableControls;
    First;
    while not EOF do
    begin
      SortOrder := Max(SortOrder, FieldValues['sort_order']);
      Next;
    end;
    EnableControls;
  end;
  Result := SortOrder + 10;
end;

procedure TMainForm.FillAlbums;
var
  i: Integer;
begin
  with DM.Albums, AlbumsList.Properties do
  begin
    Items.BeginUpdate;
    Items.Clear;
    First;
    while not EOF do
    begin
      Items.AddObject(FieldValues['title'],
        TObject(FieldByName('id').AsInteger));
      Next;
    end;
    Items.EndUpdate;
    AlbumsList.ItemIndex := 0;
    // наебалово
    i := AlbumsList.Properties.Items.Add('');
    AlbumsList.ItemIndex := i;
    AlbumsList.ItemIndex := 0;
    AlbumsList.Properties.Items.Delete(i);
  end;
end;

procedure TMainForm.AlbumsListPropertiesChange(Sender: TObject);
begin
  with Dm.Photos, AlbumsList.Properties do
  begin
    FAlbumID := Integer(Items.Objects[AlbumsList.ItemIndex]);
    DM.Albums.Locate('id', FAlbumID, []);
    Filter := Format('album_id = %d', [FAlbumID]);
    Filtered := True;
  end;
  FillData;
end;

procedure TMainForm.LoadImageExecute(Sender: TObject);
var
  LocalPath, RemotePath: String;
  Settings: ISettings;
  bmp: Graphics.TBitmap;
  i, j: Integer;
  sl: TStringList;

  function DownloadImage(ALocalPath, ARemotePath: String): Boolean;
  var
    Stream: TFileStream;
  begin
    Result := True;
    ForceDirectories(ExtractFileDir(ALocalPath));
    Stream := TFileStream.Create(ALocalPath, fmCreate);
    try
      StatusBar.Panels[2].Text := ExtractFileName(ALocalPath);
      HTTP.Get(ARemotePath, Stream);
      StatusBar.Panels[2].Text := '';
    except
      Result := False;
    end;
    Stream.Free;
    if not Result then SysUtils.DeleteFile(ALocalPath); 
  end;

begin
  if not FPluginManager.GetPlugin(ISettings, Settings) then Exit;

  with DM.Photos, ImagesList do
  begin
    ProgressBar.Max := SelCount;
    Items.BeginUpdate;
    StatusBar.Panels[0].Text := 'Загрузка';
    for i := 0 to Items.Count - 1 do
    begin
      if Items[i].Selected then
      begin
        Locate('id', Integer(ImagesList.Items[i].Data), []);
        sl := TStringList.Create;
        try
          sl.Text := DM.GetFilesPath(DM.Photos);
          for j := 0 to sl.Count - 1 do
          begin
            RemotePath := Settings.HttpRoot + DM.GetRemotePath(sl[j]);
            DownloadImage(sl[j], RemotePath);
          end;
          LocalPath := sl[1];
        finally
          sl.Free;
        end;
        if FileExists(LocalPath) then
        begin
          // подмена картинки
          bmp := Graphics.TBitmap.Create;
          try
            MakeBMP(LocalPath, bmp);
            ImagesList.Items[i].ImageIndex := ImageList150.Add(bmp, nil);
          except
          end;
          bmp.Free;
        end;

        ProgressBar.StepIt;
      end;
    end; // for
    Items.EndUpdate;
    StatusBar.Panels[0].Text := '';
    ProgressBar.Position := 0;
    pbDownLoad.Position := 0;
  end;
end;

procedure TMainForm.ShowPhotoExecute(Sender: TObject);
var
  LFileName: String;
  s, Title: String;
begin
  with DM.Photos do
  begin
    Locate('id', Integer(ImagesList.Selected.Data), []);
    s := FieldValues['name'];
    Title := FieldValues['title'];
  end;
  LFileName := Format('%s/%s%s', [
    DM.GetFilesPath(DM.Albums), s, Suffix]);
  GetViewPictureFrom(Title, LFileName);
end;

procedure TMainForm.FillData;
var
  li: TListItem;
  bmp: Graphics.TBitmap;
  s: String;
  PhotoID: Integer;
  i: Integer;
begin
  PhotoID := 0;
  with ImagesList, DM.Photos do
  begin
    if ItemIndex > 0 then
      PhotoID := Integer(Items.Item[ItemIndex].Data);
    //Items.Clear;
    ProgressBar.Max := RecordCount;
    ProgressBar.Position := 0;
    Items.BeginUpdate;
    ImageList150.Clear;
    LoadEmptyImage;
    Items.Clear;
    First;
    while not EOF do
    begin
      li := Items.Add;
      li.Caption := FieldValues['title'];
      li.Data := Pointer(FieldByName('id').AsInteger);
      li.ImageIndex := 0;
      // add image
      s := Dm.GetFilesPath(DM.Albums) + Prefix + FieldValues['name'] + Suffix;
      if FileExists(s) then
      begin
        bmp := Graphics.TBitmap.Create;
        try
          MakeBMP(s, bmp);
          li.ImageIndex := ImageList150.Add(bmp, nil);
        except
        end;
        bmp.Free;
      end;
      Next;
      ProgressBar.StepIt;
    end;
    Items.EndUpdate;
    // возвран назад
    if PhotoID > 0 then
      for i := 0 to Items.Count - 1 do
      begin
        if Integer(Items[i].Data) = PhotoID then
        begin
          //ItemFocused := Items[i];
          Items[i].MakeVisible(True);
          ItemIndex := i;
          Break;
        end;
      end;
  end;
  ProgressBar.Position := 0;
end;

procedure TMainForm.HTTPWork(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCount: Integer);
begin
  pbDownLoad.Position := AWorkCount;
end;

procedure TMainForm.HTTPWorkBegin(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCountMax: Integer);
begin
  pbDownLoad.Position := 0;
  pbDownLoad.Max := AWorkCountMax;
end;

procedure TMainForm.HTTPWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
begin
  pbDownLoad.Position := pbDownLoad.Max;
end;

procedure TMainForm.EImageProcess(Error: GFL_ERROR; const Descr: String);
begin
  if Error <> gfl_no_error then
    raise Exception.Create(Descr + #13#10 + String(gflGetErrorString(Error)));
end;

procedure TMainForm.ImagesListDblClick(Sender: TObject);
begin
  ShowPhoto.Execute;
end;

procedure TMainForm.SetAsCoverExecute(Sender: TObject);
begin
  with DM.Albums do
  begin
    Locate('id', FAlbumID, []);
    Edit;
    FieldValues['cover_id'] := Integer(ImagesList.Selected.Data);
    Post;
  end;
end;

procedure TMainForm.LoadEmptyImage;
var
  bmp: Graphics.TBitmap;
begin
  bmp := Graphics.TBitmap.Create;
  try
    bmp.LoadFromResourceName(HInstance, 'NOLOCAL_IMAGE');
    ImageList150.Add(bmp, nil);
  except
  end;
  bmp.Free;
end;

function TMainForm.CalSize(AInfo: TGFL_FILE_INFORMATION; var X, Y: Integer;
  ASize: Integer): Boolean;
var
  k: Extended;
begin
  k := AInfo.Width / AInfo.Height;
  if k >= 1 then
  begin
    X := ASize;
    Y := Trunc(ASize / k);
  end
  else
  begin
    X := Trunc(ASize * k);
    Y := ASize;
  end;

  Result := ((AInfo.Width > X) and (AInfo.Height > Y));
end;

// это для того чтобы "хитро обрезать"  
function TMainForm.CalSizeMax(AInfo: TGFL_FILE_INFORMATION; var X,
  Y: Integer; ASize: Integer): Boolean;
var
  k: Extended;
begin
  k := AInfo.Width / AInfo.Height;
  if k >= 1 then
  begin
    X := Trunc(ASize * k);
    Y := ASize;
  end
  else
  begin
    X := ASize;
    Y := Trunc(ASize / k);
  end;

  Result := ((AInfo.Width > X) and (AInfo.Height > Y));
end;

procedure TMainForm.FillGalleryList;
begin
  with GalleryList.Properties, DM.List do
  begin
    Items.BeginUpdate;
    Items.Clear;
    First;
    while not EOF do
    begin
      Items.AddObject(FieldValues['title'],
        TObject(FieldByName('id').AsInteger));
      Next;
    end;
    Items.EndUpdate;
  end;
  GalleryList.ItemIndex := 0;
end;

procedure TMainForm.GalleryListPropertiesChange(Sender: TObject);
begin
  with Dm.Albums, GalleryList.Properties do
  begin
    FGalleryID := Integer(Items.Objects[GalleryList.ItemIndex]);
    Filter := Format('gallery_id = %d', [FGalleryID]);
    Filtered := True;
  end;
  FillAlbums;
end;

procedure TMainForm.ItemEditExecute(Sender: TObject);
var
  Bitmap: Graphics.TBitmap;
//  OldName, NewName, Path: String;
  ImageID: Integer;
begin
  Bitmap := Graphics.TBitmap.Create;
  try
    ImageID := Integer(ImagesList.Selected.Data);
    Dm.Photos.Locate('id', ImageID, []);
//    OldName := Dm.Photos['name'];
    ImageList150.GetBitmap(ImagesList.Selected.ImageIndex, Bitmap);
    Dm.Photos.Edit;  
    if GetImageForm(Bitmap) = mrOK then
    begin
      // заменяем имя
      ImagesList.Selected.Caption := DM.Photos['title'];
      Dm.Photos.Post;
      // rename

{
      NewName := DM.Photos['name'];
      Path := DM.GetFilesPath(DM.Albums);
      if OldName <> NewName then
      begin
        RenameFile(Path + OldName + Suffix, Path + NewName + Suffix);
        DM.RenFile(Path + OldName + Suffix, Path + NewName + Suffix);
        RenameFile(Path + Prefix + OldName + Suffix, Path + Prefix +NewName + Suffix);
        DM.RenFile(Path + Prefix + OldName + Suffix, Path + Prefix +NewName + Suffix);
      end;
}      
    end
    else
      Dm.Photos.Cancel;
  finally
    Bitmap.Free;
  end;
end;

procedure TMainForm.GalEditExecute(Sender: TObject);
begin
  GetGalleryListForm;
end;

procedure TMainForm.AlbumEditExecute(Sender: TObject);
begin
  GetAlbumListForm(FGalleryID);
end;

procedure TMainForm.StatsuBarUpdate(Sender: TObject);
begin
   StatusBar.Panels[0].Text := DM.GetStatsuBarString;
end;

procedure TMainForm.ItemEditUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := Assigned(ImagesList.Selected);
end;

procedure TMainForm.ShowPhotoUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := Assigned(ImagesList.Selected) and
    (ImagesList.Selected.ImageIndex > 0);
end;

procedure TMainForm.LoadImageUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := Assigned(ImagesList.Selected) and
    (ImagesList.Selected.ImageIndex = 0);
end;

end.
