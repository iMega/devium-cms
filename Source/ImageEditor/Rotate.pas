unit Rotate;

interface

uses
  LibGfl, Graphics;

    
//function ImageRotate (gfl_bmp: PGFL_BITMAP; Angle: Integer): TBitmap;

implementation

uses
  Dialogs, mainFrm;
{
function ImageRotate (gfl_bmp: PGFL_BITMAP; Angle: Integer): TBitmap;
var
  bmp: TBitmap;
  y, ImagePixelFormat: Integer;
  LineSrc: Pointer;
  LineDest: Pointer;
var
  color: TGFL_COLOR;
begin
  // белый цвет фота
  color.Red := $FF;
  color.Green := $FF;
  color.Blue := $FF;
  gflRotate(gfl_bmp, nil, Angle, @color);
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


  //Result := RePaintOriginal(gfl_bmp);

  //Result := gfl2bmp(gfl_bmp);
end; }

end.
 