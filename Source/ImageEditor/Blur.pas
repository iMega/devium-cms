unit Blur;

interface

uses
  Windows, Graphics, Forms, ComCtrls, LibGfl,
  cxLookAndFeelPainters, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxSpinEdit, ActnList, cxButtons, RzTrkBar, Controls, Classes,
  ExtCtrls, StdCtrls;

type
  TfrmBlur = class(TForm)
    PreViewImage: TImage;
    Panel1: TPanel;
    Panel3: TPanel;
    tbBlur: TRzTrackBar;
    mbCancel: TcxButton;
    mbOk: TcxButton;
    ActionList1: TActionList;
    ActionOk: TAction;
    seBlur: TcxSpinEdit;
    Label1: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    tbSharpen: TRzTrackBar;
    seSharpen: TcxSpinEdit;
    procedure ActionOkExecute(Sender: TObject);
    procedure CreateBMP;
    procedure tbBlurChange(Sender: TObject);
    procedure seBlurClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tbSharpenChange(Sender: TObject);
     procedure seSharpenClick(Sender: TObject);
  private
    FClonBitmap: PGFL_BITMAP;
    FSharpen: Integer;
    FBlur: Integer;
    FOriginalBMP: PGFL_BITMAP;
    Fhbmp: HBitmap;
    procedure ApplyUpdates;
    function CalSize(var X, Y: Integer; ASize: Integer): Boolean;
    procedure SetBlur(const Value: Integer);
    procedure SetSharpen(const Value: Integer);
    procedure SetOriginalBMP(const Value: PGFL_BITMAP);
    procedure Sethbmp(const Value: HBitmap);
  public
     property Blur: Integer read FBlur write SetBlur;
     property Sharpen: Integer read FSharpen write SetSharpen;
     property OriginalBMP: PGFL_BITMAP read FOriginalBMP write SetOriginalBMP;
     property hbmp: HBitmap read Fhbmp write Sethbmp;
  end;

function GetBlurForm(var Sharpen, Blur: Integer; gfl_bmp: PGFL_BITMAP): Integer;

implementation

//uses mainFrm;

{$R *.dfm}

function GetBlurForm(var Sharpen, Blur: Integer; gfl_bmp: PGFL_BITMAP): Integer;
var
  BlurForm: TfrmBlur;
begin
  BlurForm := TfrmBlur.Create(Application);
  try
    BlurForm.OriginalBMP := gfl_bmp;
    BlurForm.CreateBMP;
    Result := BlurForm.ShowModal;
    if Result = mrOK then
    begin
      Blur := BlurForm.Blur;
      Sharpen := BlurForm.tbSharpen.Position;
    end;
  finally
    BlurForm.Free;
  end;
end;

function TfrmBlur.CalSize(var X, Y: Integer; ASize: Integer): Boolean;
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

procedure TfrmBlur.ApplyUpdates;
var
  i: Integer;
  pvbBitmap: PGFL_BITMAP;
begin
  seBlur.Value := Blur;
  tbBlur.Position := Blur;
  seSharpen.Value := Sharpen;
  tbSharpen.Position := Sharpen;

  pvbBitmap := gflCloneBitmap(FClonBitmap);

//  if tbBlur.Position > 0 then
//    for i := 1 to Blur do
  gflBlur(pvbBitmap, nil, Blur);
  //gflSharpen(pvbBitmap, nil, Sharpen);

  hbmp := CreateBitmap(pvbBitmap.Width, pvbBitmap.Height, pvbBitmap.ColorUsed, pvbBitmap.BitsPerComponent, nil);
  gflConvertBitmapIntoDDB(pvbBitmap, Fhbmp);
  PreViewImage.Picture.Bitmap.Handle := hbmp;
  gflFreeBitmap(pvbBitmap);
end; // procedure ApplyUpdates

procedure TfrmBlur.ActionOkExecute(Sender: TObject);
begin
  mbOk.SetFocus;
  ModalResult := mrOK;
end;

procedure TfrmBlur.CreateBMP;
var
  W, H: Integer;
begin
  FClonBitmap := gflCloneBitmap(OriginalBMP);
  CalSize(W, H, PreViewImage.Width);
  Panel1.DoubleBuffered := True;
  gflResize(FClonBitmap, nil, W, H, GFL_RESIZE_BILINEAR, 0);
  ApplyUpdates;
end;

procedure TfrmBlur.tbBlurChange(Sender: TObject);
begin
  Blur := tbBlur.Position;
  ApplyUpdates;
end;

procedure TfrmBlur.seBlurClick(Sender: TObject);
begin
  Blur := seBlur.Value;
  ApplyUpdates;
end;

procedure TfrmBlur.FormDestroy(Sender: TObject);
begin
  DeleteObject(hbmp);
  gflFreeBitmap(FClonBitmap);
end;

procedure TfrmBlur.SetBlur(const Value: Integer);
begin
  FBlur := Value;
  ApplyUpdates;
end;

procedure TfrmBlur.SetSharpen(const Value: Integer);
begin
  FSharpen := Value;
  ApplyUpdates;
end;

procedure TfrmBlur.tbSharpenChange(Sender: TObject);
begin
  Sharpen := tbSharpen.Position;
  ApplyUpdates;
end;

procedure TfrmBlur.seSharpenClick(Sender: TObject);
begin
  Sharpen := seSharpen.Value;
  ApplyUpdates;
end;

procedure TfrmBlur.SetOriginalBMP(const Value: PGFL_BITMAP);
begin
  FOriginalBMP := Value;
end;

procedure TfrmBlur.Sethbmp(const Value: HBitmap);
begin
  Fhbmp := Value;
end;

end.
