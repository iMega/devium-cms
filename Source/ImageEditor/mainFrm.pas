{-------------------------------------------------------------------------------
   DEVIUM Content Management System
   Copyright (C) 2004 by DEIV Development Team.
   http://www.deiv.com/

   Image Editor

   Жалобы и предложения кидать сюда:
   ICQ:    177439483
   e-mail: irvis@deiv.com
-------------------------------------------------------------------------------}

unit MainFrm;

interface

uses
  Windows, SysUtils, Forms, ExtDlgs, Menus, TB2Item, Dialogs, Classes, ActnList,
  ImgList, Controls, TBSkinPlus, ExtCtrls, ComCtrls, TB2Dock, TB2Toolbar,
  imgImageSelect, Messages, LibGfl, Graphics;

type
  TRotateActions = (raLeft, raRight, raTransport, raFlipVert, raFlipHor);

type
  TImgSel = record
    Left: Integer;
    Top: Integer;
    Width: Integer;
    Height: Integer;
  end;

type

  TMainForm = class(TForm)
    TBDock: TTBDock;
    Toolbar: TTBToolbar;
    TBSkin1: TTBSkin;
    TBSubmenuItem1: TTBSubmenuItem;
    StatusBar: TStatusBar;
    ImageList: TImageList;
    ActionList: TActionList;
    ScrollBox: TScrollBox;
    Image: TImage;
    TBSeparatorItem1: TTBSeparatorItem;
    TBItem1: TTBItem;
    mnOpen: TAction;
    TBItem2: TTBItem;
    OpenDialog: TOpenDialog;
    mnContrastBrightness: TAction;
    TBSubmenuItem2: TTBSubmenuItem;
    TBSubmenuItem3: TTBSubmenuItem;
    TBItem3: TTBItem;
    mnResize: TAction;
    TBItem4: TTBItem;
    TBSeparatorItem2: TTBSeparatorItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBItem5: TTBItem;
    mnCrop: TAction;
    mnRotateLeft: TAction;
    mnRotateRight: TAction;
    mnFlipHorizontal: TAction;
    mnFlipVertical: TAction;
    TBSubmenuItem4: TTBSubmenuItem;
    TBItem6: TTBItem;
    TBItem7: TTBItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBItem8: TTBItem;
    TBItem9: TTBItem;
    mnUndo: TAction;
    mnRedo: TAction;
    TBItem10: TTBItem;
    TBSeparatorItem5: TTBSeparatorItem;
    TBItem11: TTBItem;
    mnGamma: TAction;
    mnAdjust: TAction;
    mnNegative: TAction;
    mnLogCorrection: TAction;
    mnNormalize: TAction;
    mnEqualize: TAction;
    mnEqualizeOnLuminance: TAction;
    mnBalance: TAction;
    mnSwapColors: TAction;
    mnSepia: TAction;
    TBItem12: TTBItem;
    TBItem13: TTBItem;
    TBItem14: TTBItem;
    TBItem15: TTBItem;
    TBItem16: TTBItem;
    TBItem17: TTBItem;
    TBItem18: TTBItem;
    TBItem19: TTBItem;
    TBItem20: TTBItem;
    TBItem21: TTBItem;
    mnAverange: TAction;
    mnSoften: TAction;
    mnBlur: TAction;
    mnGaussianBlur: TAction;
    mnMaximum: TAction;
    mnMinimum: TAction;
    mnMedianBox: TAction;
    mnMedianCross: TAction;
    mnSharpen: TAction;
    mnEnhanceDetail: TAction;
    mnEncahceFocus: TAction;
    mnFocusRestoration: TAction;
    mnEdgeDetectLight: TAction;
    mnEdgeDetectMedium: TAction;
    mnEdgeDetectHeavy: TAction;
    mnEmboss: TAction;
    mnEmbossMore: TAction;
    mnConvolve: TAction;
    TBSubmenuItem5: TTBSubmenuItem;
    TBItem22: TTBItem;
    TBItem23: TTBItem;
    TBItem24: TTBItem;
    TBItem25: TTBItem;
    TBItem26: TTBItem;
    TBItem27: TTBItem;
    TBItem28: TTBItem;
    TBItem29: TTBItem;
    TBItem30: TTBItem;
    TBItem31: TTBItem;
    TBItem32: TTBItem;
    TBItem33: TTBItem;
    TBItem34: TTBItem;
    TBItem35: TTBItem;
    TBItem36: TTBItem;
    TBItem37: TTBItem;
    TBItem38: TTBItem;
    TBItem39: TTBItem;
    mnModeHand: TAction;
    mnSelect: TAction;
    mnSave: TAction;
    mnSaveAs: TAction;
    TBItem40: TTBItem;
    TBItem41: TTBItem;
    mnZoomIn: TAction;
    mnZoomOut: TAction;
    TBSubmenuItem6: TTBSubmenuItem;
    TBItem42: TTBItem;
    TBItem43: TTBItem;
    TBSeparatorItem6: TTBSeparatorItem;
    TBSeparatorItem7: TTBSeparatorItem;
    TBItem44: TTBItem;
    mnHelp: TAction;
    mnAbout: TAction;
    TBItem45: TTBItem;
    TBItem46: TTBItem;
    TBItem47: TTBItem;
    TBSeparatorItem8: TTBSeparatorItem;
    TBItem48: TTBItem;
    TBItem49: TTBItem;
    TBSeparatorItem9: TTBSeparatorItem;
    TBItem50: TTBItem;
    TBItem51: TTBItem;
    TBSeparatorItem10: TTBSeparatorItem;
    TBItem52: TTBItem;
    TBItem53: TTBItem;
    TBItem54: TTBItem;
    TBSeparatorItem11: TTBSeparatorItem;
    TBItem55: TTBItem;
    TBItem56: TTBItem;
    TBItem57: TTBItem;
    TBSeparatorItem12: TTBSeparatorItem;
    TBItem58: TTBItem;
    TBItem59: TTBItem;
    TBItem60: TTBItem;
    TBSeparatorItem13: TTBSeparatorItem;
    TBItem61: TTBItem;
    TBPopupMenu1: TTBPopupMenu;
    TBItem62: TTBItem;
    TBItem63: TTBItem;
    TBSeparatorItem14: TTBSeparatorItem;
    mnRotateTranspor: TAction;
    TBSeparatorItem16: TTBSeparatorItem;
    TBItem66: TTBItem;
    TBItem67: TTBItem;
    TBSeparatorItem15: TTBSeparatorItem;
    SaveDialog: TSaveDialog;
    OpenDialog11: TOpenPictureDialog;
    procedure FormCreate(Sender: TObject);
    procedure mnOpenExecute(Sender: TObject);
    procedure MainMenuItemsEnabled (Status: Boolean);
    procedure mnContrastBrightnessExecute(Sender: TObject);
    procedure TBItem5Click(Sender: TObject);
    procedure ImageSelectCoord;
    procedure mnResizeExecute(Sender: TObject);
    procedure ImageSelectDblClick(Sender: TObject);
    procedure mnCropExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ImageMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mnModeHandExecute(Sender: TObject);
    procedure ImageAlignCenter;
    procedure Rotate(Action: TRotateActions);
    procedure mnUndoExecute(Sender: TObject);
    procedure mnBalanceExecute(Sender: TObject);
    procedure mnBlurExecute(Sender: TObject);
    procedure mnRotateLeftExecute(Sender: TObject);
    procedure mnRotateRightExecute(Sender: TObject);
    procedure mnRotateTransporExecute(Sender: TObject);
    procedure mnFlipHorizontalExecute(Sender: TObject);
    procedure mnFlipVerticalExecute(Sender: TObject);
    procedure ZoomDelay (Zoom: Integer);
    procedure mnZoomOutExecute(Sender: TObject);
    procedure mnZoomInExecute(Sender: TObject);
    procedure mnRedoExecute(Sender: TObject);
    procedure mnSaveExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure mnSaveAsExecute(Sender: TObject);
    procedure UndoImage (Original: PGFL_BITMAP);
    procedure mnSelectExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FImageSelect: TImageSelect;
    FOriginalBMP: PGFL_BITMAP;
    FRedoBitmap: PGFL_BITMAP;
    FUndoBitmap: PGFL_BITMAP;
    Fhbmp: HBITMAP;
    FZoom: Integer;
    FModified: Boolean;
    FDragingImage: Boolean;
    FKeySpase: Boolean;
    FmbDownY: Integer;
    FmbDownX: Integer;
    Ffilename: String;
    FGflFilterString: String;
    FImgSel: TImgSel;
    FZoomArray: array [0..4] of Integer;
    procedure WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo); message wm_GetMinMaxInfo;
    procedure SetOriginalBMP(const Value: PGFL_BITMAP);
    procedure SetRedoBitmap(const Value: PGFL_BITMAP);
    procedure SetUndoBitmap(const Value: PGFL_BITMAP);
    procedure Sethbmp(const Value: HBITMAP);
    procedure SetZoom(const Value: Integer);
    procedure SetDragingImage(const Value: Boolean);
    procedure Setfilename(const Value: String);
    procedure SetGflFilterString(const Value: String);
    procedure SetImgSel(const Value: TImgSel);
    procedure SetKeySpase(const Value: Boolean);
    procedure SetmbDownX(const Value: Integer);
    procedure SetmbDownY(const Value: Integer);
    procedure SetModified(const Value: Boolean);
    procedure ImageSelMove(Sender: TObject);
  public
    property ImageSelect: TImageSelect read FImageSelect write FImageSelect;
    property OriginalBMP: PGFL_BITMAP read FOriginalBMP write SetOriginalBMP;
    property UndoBitmap: PGFL_BITMAP read FUndoBitmap write SetUndoBitmap;
    property RedoBitmap: PGFL_BITMAP read FRedoBitmap write SetRedoBitmap;
    property Zoom: Integer read FZoom write SetZoom;
    property hbmp: HBITMAP read Fhbmp write Sethbmp;
    property mbDownX: Integer read FmbDownX write SetmbDownX;
    property mbDownY: Integer read FmbDownY write SetmbDownY;
    property Modified: Boolean read FModified write SetModified;
    property KeySpase: Boolean read FKeySpase write SetKeySpase;
    property DragingImage: Boolean read FDragingImage write SetDragingImage;
    property filename: String read Ffilename write Setfilename;
    property ImgSel: TImgSel read FImgSel write SetImgSel;
  published

  end;

var MainForm: TMainForm;

const
  crHand = 50;
  crGivehand = 51;

function GetMainForm: Integer;

implementation

uses
  frm_ContrastBrightness, Resize, BalanceColor, Blur;

{$R *.dfm}
{$R hand_cursors.res}

function GetMainForm: Integer;
var
  Form: TMainForm;
begin
  Form := TMainForm.Create(Application);
  try
    Result := Form.ShowModal;
  finally
    Form.Free;
  end;
end;  //function GetMainForm

procedure TMainForm.FormCreate(Sender: TObject);
begin
  // Двойная буферизация
  ScrollBox.DoubleBuffered := True;
  Width := 700;
  Height := 500;

  Screen.Cursors[crHand] := LoadCursor(HInstance, 'HAND');
  Screen.Cursors[crGiveHand] := LoadCursor(HInstance, 'GIVEHAND');

  FZoomArray[0] := 25;
  FZoomArray[1] := 50;
  FZoomArray[2] := 100;
  FZoomArray[3] := 200;
  FZoomArray[4] := 400;
  Zoom := 2;

  with ScrollBox do
  begin
    Color := clWhite;
    VertScrollBar.Tracking := True;
    HorzScrollBar.Tracking := True;
  end;

  Modified := False;
  KeySpase := False;  
  DragingImage := False;
  MainMenuItemsEnabled (False);
end; //procedure FormCreate

procedure TMainForm.WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);
begin
  Msg.MinMaxInfo^.ptMinTrackSize.Y := 300;
  Msg.MinMaxInfo^.ptMinTrackSize.X := ToolBar.Width + 10;
end; //procedure WMGetMinMaxInfo

procedure TMainForm.MainMenuItemsEnabled (Status: Boolean);
begin
  mnSave.Enabled := Status;
  mnSaveAs.Enabled := Status;
  mnCrop.Enabled := Status;
  mnResize.Enabled := Status;
  mnZoomIn.Enabled := Status;
  mnZoomOut.Enabled := Status;
  mnModeHand.Enabled := Status;
  mnContrastBrightness.Enabled := Status;
  mnRotateLeft.Enabled := Status;
  mnRotateRight.Enabled := Status;
  mnRotateTranspor.Enabled := Status;
  mnFlipHorizontal.Enabled := Status;
  mnFlipVertical.Enabled := Status;
  mnBalance.Enabled := Status;
  mnBlur.Enabled := Status;
end; //procedure MainMenuItemsEnabled

procedure TMainForm.UndoImage (Original: PGFL_BITMAP);
begin
  gflFreeBitmap(UndoBitmap);
  UndoBitmap := gflCloneBitmap(Original);
end; //procedure UndoImage

procedure TMainForm.mnOpenExecute(Sender: TObject);
var
  lp: TGFL_LOAD_PARAMS;
  err: GFL_ERROR;
  info: TGFL_FILE_INFORMATION;
  hbmp: HBITMAP;
begin
  if Assigned (ImageSelect) then ImageSelect.Hide;

  if not OpenDialog.Execute then exit;
  filename := OpenDialog.Filename;
  with Image do
  begin
    gflEnableLZW(GFL_TRUE);
    gflGetDefaultLoadParams(lp);
    if Assigned (FOriginalBMP) then gflFreeBitmap(FOriginalBMP); // Освобождаю память если уже была открыта картинка
    lp.ColorModel := GFL_BGR;
    err := gflLoadBitmap(PChar(filename), FOriginalBMP, lp, info);
    if (err <> gfl_no_error) then
    begin
      MessageBox (Handle, 'Файл не открыть, возможно файл поврежден или данный тип файла неподдерживается.', 'Ошибка открытия файла', MB_OK+MB_ICONERROR);
      exit;
    end;





    hbmp := CreateBitmap(OriginalBMP.Width, OriginalBMP.Height, OriginalBMP.ColorUsed, OriginalBMP.BitsPerComponent, nil);
    gflConvertBitmapIntoDDB(OriginalBMP, hbmp);
    Image.Picture.Bitmap.Handle := hbmp;

    Caption := 'Редактирование изображения: ' + ExtractFileName(filename);

    //gflFreeBitmap(UndoBitmap);
    //gflFreeBitmap(RedoBitmap);
    mnUndo.Enabled := False;
    mnRedo.Enabled :=False;
  end;

  MainMenuItemsEnabled (True);

  {Масштаб 100%}
  Zoom := 2;
  ZoomDelay(FZoomArray[Zoom]);
  mnZoomIn.Enabled := True;
  mnZoomOut.Enabled := True;

  ImageAlignCenter;
end; // mnOpenExecute

procedure TMainForm.mnContrastBrightnessExecute(Sender: TObject);
var
  Brightness, Contrast: Integer;
  y, ImagePixelFormat: Integer;
  LineSrc: Pointer;
  LineDest: Pointer;
  Bitmap: TBitmap;
begin
  if Assigned (ImageSelect) then ImageSelect.Hide;

  if GetContrastBrigthnessForm(Brightness, Contrast, OriginalBMP) = mrOk then
  begin
    {Отмена последнего действия}
    UndoImage(OriginalBMP);
    mnUndo.Enabled := True;
    mnRedo.Enabled :=False;

    gflBrightness(OriginalBMP, nil, Brightness);
    gflContrast(OriginalBMP, nil, Contrast);

    hbmp := CreateBitmap(OriginalBMP.Width, OriginalBMP.Height, OriginalBMP.ColorUsed, OriginalBMP.BitsPerComponent, nil);
    gflConvertBitmapIntoDDB(FOriginalBMP, Fhbmp);
    Image.Picture.Bitmap.Handle := hbmp;

    Modified := True;
  end;

  {Масштаб 100%}
  Zoom := 2;
  ZoomDelay(FZoomArray[Zoom]);
  mnZoomIn.Enabled := True;
  mnZoomOut.Enabled := True;
end; // mnContrastBrightnessExecute

procedure TMainForm.TBItem5Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.ImageSelectCoord;
begin
  if Assigned(ImageSelect) then
  begin
    with ImageSelect do
    begin
      StartX := Image.Left;
      StartY := Image.Top;

      if StartX <= 0
        then MaxWidth := Image.Width - Abs (Image.Left)
        else MaxWidth := Image.Width + Abs (Image.Left);

      if StartY <= 0
        then MaxHeight := Image.Height - Abs (Image.Top)
        else MaxHeight := Image.Height + Abs (Image.Top);
    end;
  end;
end; // ImageSelectCoord

procedure TMainForm.mnResizeExecute(Sender: TObject);
var
  Height, Width: Integer;
begin
  if Assigned (ImageSelect) then ImageSelect.Hide;

  {Отмена последнего действия}
  UndoImage(OriginalBMP);
  mnUndo.Enabled := True;
  mnRedo.Enabled :=False;

  Height := OriginalBMP.Height;
  Width := OriginalBMP.Width;
  if GetResizeForm(Width, Height, Method) = mrOK then
  begin
    gflResize(OriginalBMP, nil, Width, Height, Method, 0);

    hbmp := CreateBitmap(OriginalBMP.Width, OriginalBMP.Height, OriginalBMP.ColorUsed, OriginalBMP.BitsPerComponent, nil);
    gflConvertBitmapIntoDDB(OriginalBMP, Fhbmp);
    Image.Picture.Bitmap.Handle := hbmp;

    Image.Height := Height;
    Image.Width := Width;

    {Масштаб 100%}
    Zoom := 2;
    ZoomDelay(FZoomArray[Zoom]);
    mnZoomIn.Enabled := True;
    mnZoomOut.Enabled := True;

    Modified := True;
    ImageAlignCenter;
  end;
end;

procedure TMainForm.ImageSelectDblClick(Sender: TObject);
var
  cLeft, cTop, cWidth, cHeight: Integer;
  StartX, StartY: Integer;
  ARect: TGFL_RECT;
  Bitmap: TBitmap;
begin
  UndoImage(OriginalBMP);
  mnUndo.Enabled := True;
  mnRedo.Enabled := False;

  with Image do begin
    StartX := Left;
    StartY := Top;
    end;

  case Zoom of
    0 : begin
          cLeft := (ImageSelect.Left - StartX) * 4;
          cWidth := ImageSelect.Width * 4;
          cTop := (ImageSelect.Top - StartY) * 4;
          cHeight := ImageSelect.Height * 4;
        end;
    1 : begin
          cLeft := (ImageSelect.Left - ABS(StartX)) * 2;
          cWidth := ImageSelect.Width * 2;
          cTop := (ImageSelect.Top - ABS(StartY)) * 2;
          cHeight := ImageSelect.Height * 2;
        end;
    2 : begin
          cLeft := ImageSelect.Left - Image.Left;
          cWidth := ImageSelect.Width;
          cTop := ImageSelect.Top - Image.Top;
          cHeight := ImageSelect.Height;
        end;
    3 : begin
          cLeft := (ImageSelect.Left + ABS(StartX) + 1) div 2;
          cWidth := ImageSelect.Width div 2;
          cTop := (ImageSelect.Top + ABS(StartY) + 1) div 2;
          cHeight := ImageSelect.Height div 2;
        end;
    4 : begin
          cLeft := (ImageSelect.Left + ABS(StartX)+ 2) div 4;
          cWidth := (ImageSelect.Width + 4) div 4;
          cTop := (ImageSelect.Top + ABS(StartY)+ 2) div 4;
          cHeight := (ImageSelect.Height + 4) div 4;
        end;
  end;

  ARect.x := cLeft;
  ARect.y := cTop;
  ARect.w := cWidth;
  ARect.h := cHeight;

  gflCrop(OriginalBMP, nil, ARect);

  ImageSelect.Hide;
  Image.Width := OriginalBMP.Width;
  Image.Height := OriginalBMP.Height;

  Modified := True;

  hbmp := CreateBitmap(OriginalBMP.Width, OriginalBMP.Height, OriginalBMP.ColorUsed, OriginalBMP.BitsPerComponent, nil);
  gflConvertBitmapIntoDDB(OriginalBMP, Fhbmp);
  Image.Picture.Bitmap.Handle := hbmp;

  mnCrop.Checked := False;

  {Масштаб 100%}
  Zoom := 2;
  ZoomDelay(FZoomArray[Zoom]);
  mnZoomIn.Enabled := True;
  mnZoomOut.Enabled := True;

  ImageAlignCenter; // Выравнять по центру
end;  // ImageSelectDblClick

procedure TMainForm.mnCropExecute(Sender: TObject);
begin
{ Создание обрезки }
  if not Assigned(ImageSelect) then
  begin
    ImageSelect := TImageSelect.Create(ScrollBox);

    with ImageSelect do
    begin
      Parent := ScrollBox;
      ColorLineSelect := clLime;
      HotColorLineSelect := clSilver;
      ShowHint := True;
      Hint := 'Все что находится за выделенной областью будет удалено.';
      OnDblClick := ImageSelectDblClick;
      OnMove := ImageSelMove;
      ImageSelectCoord;

      if Image.Width > ScrollBox.ClientRect.Right then
        Left := 0
        else
          Left := Image.Left;
      if Image.Height > ScrollBox.ClientRect.Bottom then
        Top := 0
        else
          Top := Image.Top;

      Height := 100;
      Width := 100;

      if Height > Image.Height then
        Height := Image.Height;
      if Width > Image.Width then
        Width := Image.Width;
    end;

  end
  else
  begin
    with ImageSelect do
    begin
      ImageSelectCoord;

      if Image.Width > ScrollBox.ClientRect.Right then
        Left := 0
      else
        Left := Image.Left;

      if Image.Height > ScrollBox.ClientRect.Bottom then
        Top := 0
      else
        Top := Image.Top;

      Height := 100;
      Width := 100;

      if Height > Image.Height then
        Height := Image.Height;
      if Width > Image.Width then
        Width := Image.Width;
    end;
  end;

  if mnCrop.Checked then
  begin
    mnCrop.Checked := False;
    ImageSelect.Hide;
  end
  else
  begin
    mnCrop.Checked := True;
    ImageSelect.Show;
  end;
end;  // mnCropExecute

procedure TMainForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_Space) and (ScrollBox.Width < Image.Width) and
     (ScrollBox.Height < Image.Height) then
  begin
    mnModeHand.Checked := True;
    mnModeHandExecute(Sender);
  end;
end; // FormKeyDown

procedure TMainForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Space then
  begin
    mnModeHand.Checked := False;
    mnModeHandExecute(Sender);
  end;

  if (ssCtrl in Shift) then
  begin
    case Key of
      VK_LEFT : if Assigned (OriginalBMP) then mnRotateLeftExecute(Sender);
      VK_RIGHT: if Assigned (OriginalBMP) then mnRotateRightExecute(Sender);
      VK_UP:    if mnZoomIn.Enabled then
                  if Assigned (OriginalBMP) then mnZoomInExecute(Sender);
      VK_DOWN:  if mnZoomOut.Enabled then
                  if Assigned (OriginalBMP) then mnZoomOutExecute(Sender);
    end;
  end;

end; // FormKeyUp

procedure TMainForm.ImageMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  PosX, PosY, zX, zY: Integer;
begin
  ImageSelectCoord;

  PosX := ScrollBox.HorzScrollBar.Position;
  PosY := ScrollBox.VertScrollBar.Position;
  if DragingImage and KeySpase then
    begin
      PosX := PosX + (mbDownX - X);
      PosY := PosY + (mbDownY - Y);
    end;
  ScrollBox.HorzScrollBar.Position := PosX;
  ScrollBox.VertScrollBar.Position := PosY;

  { Координаты курсора над Image с учетом масштаба }
  case Zoom of
    0: begin zX := X * 4; zY := Y * 4; end;
    1: begin zX := X * 2; zY := Y * 2; end;
    2: begin zX := X; zY := Y; end;
    3: begin zX := X div 2; zY := Y div 2; end;
    4: begin zX := X div 4; zY := Y div 4; end;
  end;

  if not mnCrop.Checked then
    StatusBar.Panels[0].Text := Format('X: %d, Y: %d', [zX, zY]);

end; // ImageMouseMove

procedure TMainForm.ImageMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  mbDownX := X;
  mbDownY := Y;
  DragingImage := True;
  if mnModeHand.Checked then Screen.Cursor := crGivehand;
end; // ImageMouseDown

procedure TMainForm.ImageMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  mbDownX := X;
  mbDownY := Y;
  DragingImage := False;
  if mnModeHand.Checked then Screen.Cursor := crHand;
end; // ImageMouseUp

procedure TMainForm.mnModeHandExecute(Sender: TObject);
begin
  if mnModeHand.Checked then
  begin
    if not DragingImage then Screen.Cursor := crHand;
    KeySpase := True;
  end
  else
  begin
    Screen.Cursor := crDefault;
    KeySpase := False;
  end;
end; // mnModeHandExecute

procedure TMainForm.ImageAlignCenter;
begin
  ImageSelectCoord;
  
  Image.Left := ScrollBox.HorzScrollBar.Position * (-1);
  Image.Top := ScrollBox.VertScrollBar.Position * (-1);
  with ScrollBox do
  begin
    VertScrollBar.Range := Image.Height;
    HorzScrollBar.Range := Image.Width;
    if Image.Width <= ClientRect.Right then
    begin
      Image.Left := ((ClientRect.Right div 2) - (Image.Width div 2));
    end;

    if Image.Height <= ClientRect.Bottom then
    begin
      Image.Top := ((ClientRect.Bottom div 2) - (Image.Height div 2));
    end;
  end;
  
{ ====================================
  Это было бы размеры ImageSelect в масштабе
  
  if Assigned(ImageSelect) then
  begin
    case Zoom of
      0: ImageSelect.Left := ImgSel.Left div 4 + Image.Left;
      1: ImageSelect.Left := ImgSel.Left div 2 + Image.Left;
      2: ImageSelect.Left := ImgSel.Left;
      3: ImageSelect.Left := ImgSel.Left * 2;
      4: ImageSelect.Left := ImgSel.Left * 4;
    end;
  end;
  if Assigned(ImageSelect) then
  begin
    case Zoom of
      0: ImageSelect.Top := ImgSel.Top div 4 + Image.Top;
      1: ImageSelect.Top := ImgSel.Top div 2 + Image.Top;
      2: ImageSelect.Top := ImgSel.Top;
      3: ImageSelect.Top := ImgSel.Top * 2;
      4: ImageSelect.Top := ImgSel.Top * 4;
    end;
  end;
  =============================================}
  if Assigned(OriginalBMP) then
    StatusBar.Panels[2].Text := IntToStr (OriginalBMP.Width) + ' x ' + IntToStr (OriginalBMP.Height);
end; // ImageAlignCenter

procedure TMainForm.Rotate(Action: TRotateActions);
var
  color: TGFL_COLOR;
begin
  {Отмена последнего действия}
  UndoImage(OriginalBMP);
  mnUndo.Enabled := True;
  mnRedo.Enabled :=False;

  color.Red := $FF;
  color.Green := $FF;
  color.Blue := $FF;

  case Action of
    raLeft:      gflRotate(OriginalBMP, nil, -90, color);
    raRight:     gflRotate(OriginalBMP, nil, 90, color);
    raTransport: gflRotate(OriginalBMP, nil, 180, color);
    raFlipHor:   gflFlipHorizontal(OriginalBMP, nil);
    raFlipVert:  gflFlipVertical(OriginalBMP, nil);
  end;

  Image.Width := OriginalBMP.Width;
  Image.Height := OriginalBMP.Height;

  DeleteObject(hbmp);

  hbmp := CreateBitmap(OriginalBMP.Width, OriginalBMP.Height, OriginalBMP.ColorUsed, OriginalBMP.BitsPerComponent, nil);
  gflConvertBitmapIntoDDB(OriginalBMP, Fhbmp);
  Image.Picture.Bitmap.Handle := hbmp;

  {Масштаб 100%}
  Zoom := 2;
  ZoomDelay(FZoomArray[Zoom]);
  mnZoomIn.Enabled := True;
  mnZoomOut.Enabled := True;

  Modified := True;

  ImageAlignCenter;
end; // Rotate

procedure TMainForm.mnUndoExecute(Sender: TObject);
begin
  if Assigned (ImageSelect) then ImageSelect.Hide;
  
  Image.Width := UndoBitmap.Width;
  Image.Height := UndoBitmap.Height;
  mnUndo.Enabled := False;
  mnRedo.Enabled := True;

  RedoBitmap := gflCloneBitmap(OriginalBMP);
  gflFreeBitmap(OriginalBMP);
  OriginalBMP := gflCloneBitmap(UndoBitmap);
  //gflFreeBitmap(UndoBitmap);

  hbmp := CreateBitmap(OriginalBMP.Width, OriginalBMP.Height, OriginalBMP.ColorUsed, OriginalBMP.BitsPerComponent, nil);
  gflConvertBitmapIntoDDB(OriginalBMP, Fhbmp);
  Image.Picture.Bitmap.Handle := hbmp;

  ImageAlignCenter;
  Modified := True;
end;  // mnUndoExecute

procedure TMainForm.mnBalanceExecute(Sender: TObject);
var
  red, blue, green: Integer;
  color: TGFL_COLOR;
begin
  if Assigned (ImageSelect) then ImageSelect.Hide;

  if GetBalanceColorForm(red, blue, green, OriginalBMP) = mrOk then
  begin
    mnUndo.Enabled := True;
    mnRedo.Enabled := False;
    UndoImage(OriginalBMP);

    color.Red := red;
    color.Blue := blue;
    color.Green := green;

    gflBalance(OriginalBMP, nil, color);

    hbmp := CreateBitmap(OriginalBMP.Width, OriginalBMP.Height, OriginalBMP.ColorUsed, OriginalBMP.BitsPerComponent, nil);
    gflConvertBitmapIntoDDB(OriginalBMP, Fhbmp);
    Image.Picture.Bitmap.Handle := hbmp;

    Modified := True;
  end;

end;  // mnBalanceExecute

procedure TMainForm.mnBlurExecute(Sender: TObject);
var
  i, Sharpen, Blur: Integer;
begin
  if Assigned (ImageSelect) then ImageSelect.Hide;

  if GetBlurForm(Sharpen, Blur, OriginalBMP) = mrOK then
  begin
    {Отмена последнего действия}
    UndoImage(OriginalBMP);
    mnUndo.Enabled := True;
    mnRedo.Enabled :=False;  

    for i := 1 to Blur do gflBlur(OriginalBMP, nil, 50);
    gflSharpen(OriginalBMP, nil, Sharpen);
    
    hbmp := CreateBitmap(OriginalBMP.Width, OriginalBMP.Height, OriginalBMP.ColorUsed, OriginalBMP.BitsPerComponent, nil);
    gflConvertBitmapIntoDDB(OriginalBMP, Fhbmp);
    Image.Picture.Bitmap.Handle := hbmp;

    Modified := True;

  end;
end; // mnBlurExecute

procedure TMainForm.mnRotateLeftExecute(Sender: TObject);
begin
  if Assigned (ImageSelect) then ImageSelect.Hide;

  Rotate(raLeft);
end;

procedure TMainForm.mnRotateRightExecute(Sender: TObject);
begin
  if Assigned (ImageSelect) then ImageSelect.Hide;
  
  Rotate(raRight);
end;

procedure TMainForm.mnRotateTransporExecute(Sender: TObject);
begin
  Rotate(raTransport);
end;

procedure TMainForm.mnFlipHorizontalExecute(Sender: TObject);
begin
  if Assigned (ImageSelect) then ImageSelect.Hide;
  
  Rotate(raFlipVert);
end;

procedure TMainForm.mnFlipVerticalExecute(Sender: TObject);
begin
  if Assigned (ImageSelect) then ImageSelect.Hide;
  Rotate(raFlipHor);
end;

procedure TMainForm.ZoomDelay(Zoom: Integer);
begin
  case Zoom of
    25 : begin
          Image.Width :=  OriginalBMP.Width div 4;
          Image.Height := OriginalBMP.Height div 4;
          //ImageSelect.Width := ImgSel.Width div 4;
          //ImageSelect.Height := ImgSel.Height div 4;
         end;
    50 : begin
           Image.Width := OriginalBMP.Width div 2;
           Image.Height := OriginalBMP.Height div 2;
           //ImageSelect.Width := ImgSel.Width div 2;
           //ImageSelect.Height := ImgSel.Height div 2;
         end;
    100 : begin
            Image.Width := OriginalBMP.Width;
            Image.Height := OriginalBMP.Height;
            //ImageSelect.Width := ImgSel.Width;
            //ImageSelect.Height := ImgSel.Height;
          end;
    200 : begin
            Image.Width := OriginalBMP.Width * 2;
            Image.Height := OriginalBMP.Height * 2;
            //ImageSelect.Width := ImgSel.Width * 2;
            //ImageSelect.Height := ImgSel.Height * 2;
          end;
    400 : begin
            Image.Width := OriginalBMP.Width * 4;
            Image.Height := OriginalBMP.Height * 4;
            //ImageSelect.Width := ImgSel.Width * 4;
            //ImageSelect.Height := ImgSel.Height * 4;
          end;
  end;

  StatusBar.Panels[1].Text := IntToStr (Zoom) + '%';
  ScrollBox.HorzScrollBar.Range := Image.Width;
  ScrollBox.VertScrollBar.Range := Image.Height;
  ImageAlignCenter;
end;

procedure TMainForm.mnZoomOutExecute(Sender: TObject);
begin
  if Assigned (ImageSelect) then ImageSelect.Hide;
  Zoom := Zoom - 1;
  ZoomDelay(FZoomArray[Zoom]);
  if Zoom = 0
    then
      begin
        mnZoomOut.Enabled := False;
        mnZoomIn.Enabled := True;
      end
    else
      begin
        mnZoomIn.Enabled := True;
        mnZoomOut.Enabled := True;
      end;
end;

procedure TMainForm.mnZoomInExecute(Sender: TObject);
begin
  if Assigned (ImageSelect) then ImageSelect.Hide;

  Zoom := Zoom + 1;
  ZoomDelay(FZoomArray[Zoom]);

  if Zoom = 4
    then
      begin
        mnZoomIn.Enabled := False;
        mnZoomOut.Enabled := True;
      end
    else
      begin
        mnZoomIn.Enabled := True;
        mnZoomOut.Enabled := True;
      end;
end;

procedure TMainForm.mnRedoExecute(Sender: TObject);
var
  y, ImagePixelFormat: Integer;
  LineSrc: Pointer;
  LineDest: Pointer;
  Bitmap: TBitmap;
begin
  if Assigned (ImageSelect) then ImageSelect.Hide;
  
  Image.Width := RedoBitmap.Width;
  Image.Height := RedoBitmap.Height;
  mnUndo.Enabled := True;
  mnRedo.Enabled := False;

  UndoBitmap := gflCloneBitmap(OriginalBMP);
  gflFreeBitmap(OriginalBMP);
  OriginalBMP := gflCloneBitmap(RedoBitmap);
  gflFreeBitmap(RedoBitmap);

  hbmp := CreateBitmap(OriginalBMP.Width, OriginalBMP.Height, OriginalBMP.ColorUsed, OriginalBMP.BitsPerComponent, nil);
    gflConvertBitmapIntoDDB(OriginalBMP, Fhbmp);
    Image.Picture.Bitmap.Handle := hbmp;

  ImageAlignCenter;
  Modified := True;
end;  // procedure TMainForm.mnRedoExecute

procedure TMainForm.mnSaveExecute(Sender: TObject);
var Path: String;
  save_params: TGFL_SAVE_PARAMS;
begin
  Path := ExtractFileDir(ParamStr(0))+'\temp';
  CreateDir(Path);

  gflGetDefaultSaveParams(save_params);
  save_params.Quality := 70;
  save_params.Flags := GFL_SAVE_REPLACE_EXTENSION;
  save_params.FormatIndex := 0; // JPG

  Path := Path + '\' + ExtractFileName(filename);

  gflSaveBitmap(PChar(Path), OriginalBMP^, save_params);

  gflFreeBitmap(UndoBitmap);
  gflFreeBitmap(RedoBitmap);
  mnUndo.Enabled := False;
  mnRedo.Enabled := False;

end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  fn, formatStr: string;
begin
  fn := ExtractFileName(filename);
  if fn <> '' then
    begin
      formatStr := Format('Изображение "%s" было изменено.%sСохранить изменения ?', [fn, #10#13]);
      if Modified then
        begin
          case MessageBox (Handle, PChar(formatStr), 'Подтвердите действие', MB_YESNOCANCEL+MB_ICONQUESTION) of
            IDYES    : begin
                         mnSaveAsExecute(Sender);
                         CanClose := True;
                       end;
           IDNO     : begin
                         CanClose := True;
                       end;
            IDCANCEL : CanClose := False;
          end; //case
        end;
    end; 
end;

procedure TMainForm.mnSaveAsExecute(Sender: TObject);
var
  save_params: TGFL_SAVE_PARAMS;
  FormatIndex: Integer;
  Str, StrExt: String;
begin
  SaveDialog.FileName := ExtractFileName(filename);

  if SaveDialog.Execute then
  begin
    //gflGetDefaultSaveParams(save_params);

    case SaveDialog.FilterIndex of
      //1: FormatIndex := 0;  // Сохранить в томже формате
      2:begin
          FormatIndex := 0;  // jpg
          StrExt := '.jpg';
        end;
      3:begin
          FormatIndex := 4;  // bmp
          StrExt := '.bmp';
        end;
      4:begin
          FormatIndex := 8;  // png
          StrExt := '.png';
        end;
      5:begin
          FormatIndex := 10; // gif
          StrExt := '.gif';
        end;
    end;

    with save_params do
    begin
      Quality := 70;
      Flags := GFL_SAVE_ANYWAY;

      Progressive := 255;
//      Compression :=
      FormatIndex := FormatIndex;
    end;

    Str := SaveDialog.FileName + StrExt;
    gflSaveBitmap(PChar(Str), OriginalBMP^, save_params);

    gflFreeBitmap(UndoBitmap);
    gflFreeBitmap(RedoBitmap);
    mnUndo.Enabled := False;
    mnRedo.Enabled := False;
  end;
end;

procedure TMainForm.mnSelectExecute(Sender: TObject);
begin
  if Assigned(ImageSelect) then
  begin
    ImageSelect.Left := ImgSel.Left div 2 + Image.Left;
  end;
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  ImageAlignCenter;
end;

procedure TMainForm.SetOriginalBMP(const Value: PGFL_BITMAP);
begin
  FOriginalBMP := Value;
end;

procedure TMainForm.SetRedoBitmap(const Value: PGFL_BITMAP);
begin
  FRedoBitmap := Value;
end;

procedure TMainForm.SetUndoBitmap(const Value: PGFL_BITMAP);
begin
  FUndoBitmap := Value;
end;

procedure TMainForm.Sethbmp(const Value: HBITMAP);
begin
  Fhbmp := Value;
end;

procedure TMainForm.SetZoom(const Value: Integer);
begin
  FZoom := Value;
end;

procedure TMainForm.SetDragingImage(const Value: Boolean);
begin
  FDragingImage := Value;
end;

procedure TMainForm.Setfilename(const Value: String);
begin
  Ffilename := Value;
end;

procedure TMainForm.SetGflFilterString(const Value: String);
begin
  FGflFilterString := Value;
end;

procedure TMainForm.SetImgSel(const Value: TImgSel);
begin
  FImgSel := Value;
end;

procedure TMainForm.SetKeySpase(const Value: Boolean);
begin
  FKeySpase := Value;
end;

procedure TMainForm.SetmbDownX(const Value: Integer);
begin
  FmbDownX := Value;
end;

procedure TMainForm.SetmbDownY(const Value: Integer);
begin
  FmbDownY := Value;
end;

procedure TMainForm.SetModified(const Value: Boolean);
begin
  FModified := Value;
end;


procedure TMainForm.FormDestroy(Sender: TObject);
begin
  DeleteObject(hbmp);
end;

procedure TMainForm.ImageSelMove(Sender: TObject);
begin
  with TImageSelect(Sender) do
  begin
    StatusBar.Panels[0].Text :=
      Format ('X: %d, Y: %d; W: %d, H: %d' , [sbLeft, sbTop, sbRight, sbBottom]);
  end;
end;

end.
