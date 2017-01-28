unit forControlImage;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, LibGfl;


//function IntToPixelFormat(ImagePixelFormat: Integer): TPixelFormat;
{function OpenImage (filename: String): TBitmap;
procedure CloneImage (Original: PGFL_BITMAP);
procedure UndoImage (Original: PGFL_BITMAP);
procedure RedoImage (Original: PGFL_BITMAP);
function RePaintOriginal (Original: PGFL_BITMAP): TBitmap;
function CloneBMP (gfl_bmp: PGFL_BITMAP): TBitmap;
function SaveImageInMem (ImageHandle: Pointer): TBitmap;
function gfl2bmp (gfl_bmp: PGFL_BITMAP): TBitmap;

var GflFilterString : String;
    WidthImage, HeightImage: Integer;
    OriginalBMP, ClonBitmap, UndoBitmap, RedoBitmap: PGFL_BITMAP;
  }
implementation




  {
function OpenImage (filename: String): TBitmap;
var
  finfo: TGFL_FILE_INFORMATION;
  lp: TGFL_LOAD_PARAMS;
  gfl_bmp: PGFL_BITMAP;
  e: GFL_ERROR;
  bmp: TBitmap;
  x, y, k: Integer;
  LineSrc: Pointer;
  LineDest: Pointer;
  //LineIn: PLine1;
  LineOut: PByteArray;
  Mask1: Byte;
  Mask: Byte;
  pal: PLogPalette;
  i, ImagePixelFormat: Integer;
  Arect: TRect;
begin
  gflEnableLZW(GFL_TRUE);
  gflGetDefaultLoadParams(lp);
  lp.ColorModel := GFL_BGR;
  //lp.ColorModel := GFL_BGRA;
  //lp.Flags := GFL_LOAD_FORCE_COLOR_MODEL;
  e := gflLoadBitmap(PChar(filename), gfl_bmp, lp, finfo);

  //ERROR
  if (e <> gfl_no_error) then begin
    MessageDlg('File not readable: ' + string(gflGetErrorString(e)), mtError, [mbOK], 0);
    exit;
  end;

  if (gfl_bmp.Btype = GFL_BINARY) then begin
    ImagePixelFormat := 1;
  end else begin
    ImagePixelFormat := gfl_bmp.BytesPerPixel * 8;
  end;

  if not (ImagePixelFormat in [1, 4, 8, 24, 32]) then begin
    MessageDlg('Only 1, 4, 8, 24 or 32 BitsPerPixel are supported in this demo !', mtError, [mbOK], 0);
    gflFreeBitmap(gfl_bmp);
    exit;
  end;

  // Create Delphi Bitmap. If paletted, minimize memory by setting size after pixel format
  bmp := TBitmap.Create;
  //bmp.PixelFormat := IntToPixelFormat(ImagePixelFormat);
  bmp.Width := gfl_bmp.Width;
  bmp.Height := gfl_bmp.Height;
  WidthImage := gfl_bmp.Width;
  HeightImage := gfl_bmp.Height;
  //NewPalette := 0;

  OriginalBMP := gflCloneBitmap(gfl_bmp);
  //gflBrightness(OriginalBMP, nil, 100);

  case bmp.PixelFormat of
    pf1bit: begin end;
    pf4Bit: begin end;
    pf8Bit: begin end;
    pf24Bit, pf32Bit:
      begin
        for y := 0 to gfl_bmp.Height - 1 do begin
          // get Pointer to Scanlines
          lineSrc  := Pointer(Integer(gfl_bmp.data) + (y * gfl_bmp.BytesPerLine));
          lineDest := bmp.Scanline[y];
          // copy Pixel Data
          move(lineSrc^, lineDest^, gfl_bmp.BytesPerLine);
        end;
        Result := bmp;
      end;
  end; {case pixelformat}
//end;
 {
function SaveImage (filename: String): TBitmap;
var
  finfo: TGFL_FILE_INFORMATION;
  lp: TGFL_LOAD_PARAMS;
  gfl_bmp: PGFL_BITMAP;
  e: GFL_ERROR;
  bmp: TBitmap;
  x, y, k: Integer;
  LineSrc: Pointer;
  LineDest: Pointer;
  //LineIn: PLine1;
  LineOut: PByteArray;
  Mask1: Byte;
  Mask: Byte;
  pal: PLogPalette;
  i, ImagePixelFormat: Integer;
  Arect: TRect;
begin
  gflEnableLZW(GFL_TRUE);
  gflGetDefaultLoadParams(lp);
  lp.ColorModel := GFL_BGR;
  //lp.ColorModel := GFL_BGRA;
  //lp.Flags := GFL_LOAD_FORCE_COLOR_MODEL;
  e := gflLoadBitmap(PChar(filename), gfl_bmp, lp, finfo);

  //ERROR
  if (e <> gfl_no_error) then begin
    MessageDlg('File not readable: ' + string(gflGetErrorString(e)), mtError, [mbOK], 0);
    exit;
  end;

  if (gfl_bmp.Btype = GFL_BINARY) then begin
    ImagePixelFormat := 1;
  end else begin
    ImagePixelFormat := gfl_bmp.BytesPerPixel * 8;
  end; 

  if not (ImagePixelFormat in [1, 4, 8, 24, 32]) then begin
    MessageDlg('Only 1, 4, 8, 24 or 32 BitsPerPixel are supported in this demo !', mtError, [mbOK], 0);
    gflFreeBitmap(gfl_bmp);
    exit;
  end;

  // Create Delphi Bitmap. If paletted, minimize memory by setting size after pixel format
  bmp := TBitmap.Create;
  bmp.PixelFormat := IntToPixelFormat(ImagePixelFormat);
  bmp.Width := gfl_bmp.Width;
  bmp.Height := gfl_bmp.Height;
  WidthImage := gfl_bmp.Width;
  HeightImage := gfl_bmp.Height;
  //NewPalette := 0;

  OriginalBMP := gflCloneBitmap(gfl_bmp);
  //gflBrightness(OriginalBMP, nil, 100);

  case bmp.PixelFormat of
    pf1bit: begin end;
    pf4Bit: begin end;
    pf8Bit: begin end;
    pf24Bit, pf32Bit:
      begin
        for y := 0 to gfl_bmp.Height - 1 do begin
          // get Pointer to Scanlines
          lineSrc  := Pointer(Integer(gfl_bmp.data) + (y * gfl_bmp.BytesPerLine));
          lineDest := bmp.Scanline[y];
          // copy Pixel Data
          move(lineSrc^, lineDest^, gfl_bmp.BytesPerLine);
        end;
        Result := bmp;
      end;
  end;
end;            

procedure CloneImage (Original: PGFL_BITMAP);
begin
  ClonBitmap := gflCloneBitmap(Original);
end;            

procedure UndoImage (Original: PGFL_BITMAP);
begin
  UndoBitmap := gflCloneBitmap(Original);
end;
             }
//  Это не обязательно, можно обойтись только Undo
{procedure RedoImage (Original: PGFL_BITMAP);
begin
  RedoBitmap := gflCloneBitmap(Original);
  RedoBitmap.Width := Original.Width;
  RedoBitmap.Height := Original.Height;
end;

function RePaintOriginal (Original: PGFL_BITMAP): TBitmap;
var
  bmp: TBitmap;
  y, ImagePixelFormat: Integer;
  LineSrc: Pointer;
  LineDest: Pointer;
begin

  if (Original.Btype = GFL_BINARY) then begin
    ImagePixelFormat := 1;
  end else begin
    ImagePixelFormat := Original.BytesPerPixel * 8;
  end;

  if not (ImagePixelFormat in [1, 4, 8, 24, 32]) then begin
    MessageDlg('Only 1, 4, 8, 24 or 32 BitsPerPixel are supported in this demo !', mtError, [mbOK], 0);
    gflFreeBitmap(Original);
    exit;
  end;

  bmp := TBitmap.Create;
  //bmp.PixelFormat := IntToPixelFormat(ImagePixelFormat);
  bmp.Width := Original.Width;
  bmp.Height := Original.Height;

  case bmp.PixelFormat of
    pf1bit: begin end;
    pf4Bit: begin end;
    pf8Bit: begin end;
    pf24Bit, pf32Bit:
      begin
        for y := 0 to Original.Height - 1 do begin
          lineSrc  := Pointer(Integer(Original.data) + (y * Original.BytesPerLine));
          lineDest := bmp.Scanline[y];
          move(lineSrc^, lineDest^, Original.BytesPerLine);
        end;
        Result := bmp;
      end;
  end;
end;


function CloneBMP (gfl_bmp: PGFL_BITMAP): TBitmap;
var
  bmp: TBitmap;
  y, ImagePixelFormat: Integer;
  LineSrc: Pointer;
  LineDest: Pointer;
begin

  if (gfl_bmp.Btype = GFL_BINARY) then begin
    ImagePixelFormat := 1;
  end else begin
    ImagePixelFormat := gfl_bmp.BytesPerPixel * 8;
  end;

  if not (ImagePixelFormat in [1, 4, 8, 24, 32]) then begin
    MessageDlg('Only 1, 4, 8, 24 or 32 BitsPerPixel are supported in this demo !', mtError, [mbOK], 0);
    //gflFreeBitmap(gfl_bmp);
    exit;
  end;

  bmp := TBitmap.Create;
  bmp.PixelFormat := IntToPixelFormat(ImagePixelFormat);
  bmp.Width := gfl_bmp.Width;
  bmp.Height := gfl_bmp.Height;

  case bmp.PixelFormat of
    pf1bit: begin end;
    pf4Bit: begin end;
    pf8Bit: begin end;
    pf24Bit, pf32Bit:
      begin
        for y := 0 to gfl_bmp.Height - 1 do begin
          // get Pointer to Scanlines
          lineSrc  := Pointer(Integer(gfl_bmp.data) + (y * gfl_bmp.BytesPerLine));
          lineDest := bmp.Scanline[y];
          // copy Pixel Data
          move(lineSrc^, lineDest^, gfl_bmp.BytesPerLine);
        end;
        Result := bmp;
      end;
  end;
end;

function SaveImageInMem (ImageHandle: Pointer): TBitmap;
var
  finfo: TGFL_FILE_INFORMATION;
  lp: TGFL_LOAD_PARAMS;
  gfl_bmp: PGFL_BITMAP;
  e: GFL_ERROR;
  bmp: TBitmap;
  x, y, k: Integer;
  LineSrc: Pointer;
  LineDest: Pointer;
  //LineIn: PLine1;
  LineOut: PByteArray;
  Mask1: Byte;
  Mask: Byte;
  pal: PLogPalette;
  i, ImagePixelFormat: Integer;
  Arect: TRect;
begin
  gflEnableLZW(GFL_TRUE);
  gflGetDefaultLoadParams(lp);
  lp.ColorModel := GFL_BGR;
  //lp.ColorModel := GFL_BGRA;
  //lp.Flags := GFL_LOAD_FORCE_COLOR_MODEL;
  e := gflLoadBitmapFromHandle(ImageHandle, gfl_bmp, lp, finfo);

  //ERROR
  if (e <> gfl_no_error) then begin
    MessageDlg('File not readable: ' + string(gflGetErrorString(e)), mtError, [mbOK], 0);
    exit;
  end;

  if (gfl_bmp.Btype = GFL_BINARY) then begin
    ImagePixelFormat := 1;
  end else begin
    ImagePixelFormat := gfl_bmp.BytesPerPixel * 8;
  end; 

  if not (ImagePixelFormat in [1, 4, 8, 24, 32]) then begin
    MessageDlg('Only 1, 4, 8, 24 or 32 BitsPerPixel are supported in this demo !', mtError, [mbOK], 0);
    gflFreeBitmap(gfl_bmp);
    exit;
  end;

  // Create Delphi Bitmap. If paletted, minimize memory by setting size after pixel format
  bmp := TBitmap.Create;
  bmp.PixelFormat := IntToPixelFormat(ImagePixelFormat);
  bmp.Width := gfl_bmp.Width;
  bmp.Height := gfl_bmp.Height;
  WidthImage := gfl_bmp.Width;
  HeightImage := gfl_bmp.Height;
  //NewPalette := 0;

  case bmp.PixelFormat of
    pf1bit: begin end;
    pf4Bit: begin end;
    pf8Bit: begin end;
    pf24Bit, pf32Bit:
      begin
        for y := 0 to gfl_bmp.Height - 1 do begin
          // get Pointer to Scanlines
          lineSrc  := Pointer(Integer(gfl_bmp.data) + (y * gfl_bmp.BytesPerLine));
          lineDest := bmp.Scanline[y];
          // copy Pixel Data
          move(lineSrc^, lineDest^, gfl_bmp.BytesPerLine);
        end;
        Result := bmp;
      end;
  end; {case pixelformat}   {
end;

function gfl2bmp (gfl_bmp: PGFL_BITMAP): TBitmap;
var
  bmp: TBitmap;
  y, ImagePixelFormat: Integer;
  LineSrc: Pointer;
  LineDest: Pointer;
begin
  if (gfl_bmp.Btype = GFL_BINARY) then begin
    ImagePixelFormat := 1;
  end else begin
    ImagePixelFormat := gfl_bmp.BytesPerPixel * 8;
  end;

  if not (ImagePixelFormat in [1, 4, 8, 24, 32]) then begin
    MessageDlg('Only 1, 4, 8, 24 or 32 BitsPerPixel are supported in this demo !', mtError, [mbOK], 0);
    gflFreeBitmap(gfl_bmp);
    exit;
  end;

  bmp := TBitmap.Create;
  bmp.PixelFormat := IntToPixelFormat(ImagePixelFormat);
  bmp.Width := gfl_bmp.Width;
  bmp.Height := gfl_bmp.Height;

  case bmp.PixelFormat of
    pf1bit: begin end;
    pf4Bit: begin end;
    pf8Bit: begin end;
    pf24Bit, pf32Bit:
      begin
        for y := 0 to gfl_bmp.Height - 1 do begin
          lineSrc  := Pointer(Integer(gfl_bmp.data) + (y * gfl_bmp.BytesPerLine));
          lineDest := bmp.Scanline[y];
          move(lineSrc^, lineDest^, gfl_bmp.BytesPerLine);
        end;
        Result := bmp;
      end;
  end;
end;
        }
end.


