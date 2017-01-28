unit frm_ContrastBrightness;

interface

uses
  Windows, Graphics, Forms, LibGfl, ActnList, cxButtons, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxSpinEdit, RzTrkBar, StdCtrls, ExtCtrls,
  cxLookAndFeelPainters, cxMaskEdit, Classes, Controls;

type
  TfrmContrastBrightness = class(TForm)
    Label1: TLabel;
    ImageOrig: TImage;
    Image: TImage;
    Label2: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    RzTrackBar1: TRzTrackBar;
    cxSpinEdit1: TcxSpinEdit;
    Panel4: TPanel;
    mbOk: TcxButton;
    mbCancel: TcxButton;
    ActionList1: TActionList;
    ActionOk: TAction;
    RzTrackBar2: TRzTrackBar;
    cxSpinEdit2: TcxSpinEdit;
    Panel5: TPanel;
    procedure ActionOkExecute(Sender: TObject);
    procedure RzTrackBar1Change(Sender: TObject);
    procedure RzTrackBar2Change(Sender: TObject);
    procedure cxSpinEdit1Click(Sender: TObject);
    procedure cxSpinEdit2Click(Sender: TObject);
    procedure CreateBMP;
    procedure FormDestroy(Sender: TObject);
  private
    FClonBitmap: PGFL_BITMAP;
    FBrightness: Integer;
    FContrast: Integer;
    FOriginalBMP: PGFL_BITMAP;
    Fhbmp: HBitmap;
    procedure SetBrightness(const Value: Integer);
    procedure SetContrast(const Value: Integer);
    function CalSize(var X, Y: Integer; ASize: Integer): Boolean;
    procedure ApplyUpdates;
    procedure Sethbmp(const Value: HBitmap);
  private
    property Brightness: Integer read FBrightness write SetBrightness;
    property Contrast: Integer read FContrast write SetContrast;
  public
    property OriginalBMP: PGFL_BITMAP read FOriginalBMP write FOriginalBMP;
    property hbmp: HBitmap read Fhbmp write Sethbmp;
  end;

function GetContrastBrigthnessForm(var Brigthness: Integer; var Contrast: Integer; gfl_bmp: PGFL_BITMAP): Integer;

implementation

{$R *.dfm}

function GetContrastBrigthnessForm(var Brigthness: Integer; var Contrast: Integer; gfl_bmp: PGFL_BITMAP): Integer;
var
  form: TfrmContrastBrightness;
begin
  form := TfrmContrastBrightness.Create(Application);
  try
    form.OriginalBMP := gfl_bmp;
    form.CreateBMP;
    Result := form.ShowModal;
    if Result = mrOk then
    begin
      Brigthness := form.RzTrackBar1.Position;
      Contrast := form.RzTrackBar2.Position;
    end;
  finally
    form.Free;
  end;
end;

function TfrmContrastBrightness.CalSize(var X, Y: Integer; ASize: Integer): Boolean;
var
  k: Extended;
begin
  k := OriginalBMP.Width / OriginalBMP.Height;
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

  Result := ((OriginalBMP.Width > X) and (OriginalBMP.Height > Y));
end;

procedure TfrmContrastBrightness.ActionOkExecute(Sender: TObject);
begin
  mbOk.SetFocus;
  ModalResult := mrOK;
end;

procedure TfrmContrastBrightness.SetBrightness(const Value: Integer);
begin
  FBrightness := Value;
end;

procedure TfrmContrastBrightness.SetContrast(const Value: Integer);
begin
  FContrast := Value;
end;

procedure TfrmContrastBrightness.ApplyUpdates;
var
  y, ImagePixelFormat: Integer;
  LineSrc: Pointer;
  LineDest: Pointer;
  pvbBitmap: PGFL_BITMAP;
  hbmp: HBitmap;
begin
  cxSpinEdit1.Value := Brightness;
  RzTrackBar1.Position := Brightness;

  cxSpinEdit2.Value := Contrast;
  RzTrackBar2.Position := Contrast;


  pvbBitmap := gflCloneBitmap(FClonBitmap);

  gflBrightness(pvbBitmap, nil, Brightness);
  gflContrast(pvbBitmap, nil, Contrast);

//  if Assigned(Image) then DeleteObject(hbmp);

  hbmp := CreateBitmap(pvbBitmap.Width, pvbBitmap.Height, pvbBitmap.ColorUsed, pvbBitmap.BitsPerComponent, nil);
  gflConvertBitmapIntoDDB(pvbBitmap, hbmp);
  Image.Picture.Bitmap.Handle := hbmp;

end; // procedure ApplyUpdates

procedure TfrmContrastBrightness.RzTrackBar1Change(Sender: TObject);
begin
  Brightness := TRzTrackBar(Sender).Position;
  ApplyUpdates;
end;

procedure TfrmContrastBrightness.RzTrackBar2Change(Sender: TObject);
begin
  Contrast := TRzTrackBar(Sender).Position;
  ApplyUpdates;
end;

procedure TfrmContrastBrightness.cxSpinEdit1Click(Sender: TObject);
begin
  Brightness := TcxSpinEdit(sender).Value;
end;

procedure TfrmContrastBrightness.cxSpinEdit2Click(Sender: TObject);
begin
  Contrast := TcxSpinEdit(sender).Value;
end;

procedure TfrmContrastBrightness.CreateBMP;
var
  W, H: Integer;
  y, ImagePixelFormat: Integer;
  LineSrc: Pointer;
  LineDest: Pointer;
  pvbBitmap: PGFL_BITMAP;
  Bitmap: TBitmap;
begin
  FClonBitmap := gflCloneBitmap(OriginalBMP);
  pvbBitmap := gflCloneBitmap(FClonBitmap);

  CalSize(W, H, Image.Width);
  gflResize(pvbBitmap, nil, W, H, GFL_RESIZE_BILINEAR, 0);

  Panel2.DoubleBuffered := True;

  hbmp := CreateBitmap(pvbBitmap.Width, pvbBitmap.Height, pvbBitmap.ColorUsed, pvbBitmap.BitsPerComponent, nil);
  gflConvertBitmapIntoDDB(pvbBitmap, Fhbmp);
  ImageOrig.Picture.Bitmap.Handle := hbmp;

  gflResize(FClonBitmap, nil, W, H, GFL_RESIZE_BILINEAR, 0);

  ApplyUpdates;
end;

procedure TfrmContrastBrightness.FormDestroy(Sender: TObject);
begin
  DeleteObject(hbmp);
  gflFreeBitmap(FClonBitmap);
end;

procedure TfrmContrastBrightness.Sethbmp(const Value: HBitmap);
begin
  Fhbmp := Value;
end;

end.
