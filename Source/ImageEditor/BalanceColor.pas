unit BalanceColor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ExtCtrls, ComCtrls, StdCtrls, LibGfl, RzTrkBar,
  cxLookAndFeelPainters, ActnList, cxButtons, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxSpinEdit;

type
  TfrmBalanceColor = class(TForm)
    Image: TImage;
    Panel1: TPanel;
    tbRed: TRzTrackBar;
    tbGreen: TRzTrackBar;
    tbBlue: TRzTrackBar;
    Panel3: TPanel;
    OK: TcxButton;
    Cancel: TcxButton;
    ActionList1: TActionList;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cxSpinEdit1: TcxSpinEdit;
    cxSpinEdit2: TcxSpinEdit;
    cxSpinEdit3: TcxSpinEdit;
    Label4: TLabel;
    ActionOK: TAction;
    Panel4: TPanel;
    ImageOrig: TImage;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure tbRedChange(Sender: TObject);
    procedure ActionOKExecute(Sender: TObject);
    procedure cxSpinEdit1PropertiesChange(Sender: TObject);
    procedure cxSpinEdit2PropertiesChange(Sender: TObject);
    procedure cxSpinEdit3PropertiesChange(Sender: TObject);
    procedure tbGreenChange(Sender: TObject);
    procedure tbBlueChange(Sender: TObject);
    procedure CreatingBMP;
    procedure FormDestroy(Sender: TObject);
  private
    FClonBitmap: PGFL_BITMAP;
    FColor3: Integer;
    FColor1: Integer;
    FColor2: Integer;
    FOriginalBMP: PGFL_BITMAP;
    Fhbmp: HBitmap;
    FtmBlue: Integer;
    FtmRed: Integer;
    FtmGreen: Integer;
    FColorGreen: Integer;
    FColorRed: Integer;
    FColorBlue: Integer;
    procedure SetColor1(const Value: Integer);
    procedure SetColor2(const Value: Integer);
    procedure SetColor3(const Value: Integer);
    procedure ApplyUpdates;
    function CalSize(var X, Y: Integer; ASize: Integer): Boolean;
    procedure SetOriginalBMP(const Value: PGFL_BITMAP);
    procedure SettmBlue(const Value: Integer);
    procedure SettmGreen(const Value: Integer);
    procedure SettmRed(const Value: Integer);
    procedure SetColorBlue(const Value: Integer);
    procedure SetColorGreen(const Value: Integer);
    procedure SetColorRed(const Value: Integer);
  public
    property ColorRed: Integer read FColorRed write SetColorRed;
    property ColorGreen: Integer read FColorGreen write SetColorGreen;
    property ColorBlue: Integer read FColorBlue write SetColorBlue;
    property OriginalBMP: PGFL_BITMAP read FOriginalBMP write SetOriginalBMP;
    property hbmp: HBitmap read Fhbmp write Fhbmp;
    property tmRed: Integer read FtmRed write SettmRed;
    property tmGreen: Integer read FtmGreen write SettmGreen;
    property tmBlue: Integer read FtmBlue write SettmBlue;
  end;

  function GetBalanceColorForm(var red, blue, green: Integer; gfl_bmp: PGFL_BITMAP): Integer;

implementation

{$R *.dfm}

function GetBalanceColorForm;
var
  form: TfrmBalanceColor;
begin
  form := TfrmBalanceColor.Create(Application);
  try
    form.OriginalBMP := gfl_bmp;
    form.CreatingBMP;
    Result := form.ShowModal;
    if Result = mrOk then
    begin
      red := form.tmRed;
      green := form.tmGreen;
      blue := form.tmBlue;
    end;
  finally
    form.Free;
  end;
end;

procedure TfrmBalanceColor.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmBalanceColor.tbRedChange(Sender: TObject);
begin
  ColorRed := tbRed.Position;
end;

procedure TfrmBalanceColor.ActionOKExecute(Sender: TObject);
begin
  OK.SetFocus;
  ModalResult := mrOK;
end;

procedure TfrmBalanceColor.SetColor1(const Value: Integer);
begin
  FColor1 := Value;
  ApplyUpdates;
end;

procedure TfrmBalanceColor.SetColor2(const Value: Integer);
begin
  FColor2 := Value;
  ApplyUpdates;
end;

procedure TfrmBalanceColor.SetColor3(const Value: Integer);
begin
  FColor3 := Value;
  ApplyUpdates;
end;

procedure TfrmBalanceColor.cxSpinEdit1PropertiesChange(Sender: TObject);
begin
  ColorRed := TcxSpinEdit(Sender).Value;
end;

procedure TfrmBalanceColor.cxSpinEdit2PropertiesChange(Sender: TObject);
begin
  ColorGreen := TcxSpinEdit(Sender).Value;
end;

procedure TfrmBalanceColor.cxSpinEdit3PropertiesChange(Sender: TObject);
begin
  ColorBlue := TcxSpinEdit(Sender).Value;
end;

procedure TfrmBalanceColor.ApplyUpdates; var
  color: TGFL_COLOR;
  y, ImagePixelFormat: Integer;
  LineSrc: Pointer;
  LineDest: Pointer;
  pvbBitmap: PGFL_BITMAP;
  Bitmap: TBitmap;
  b, s,min, i,IMin,{tmRed, tmGreen, tmBlue,} Red, Green, Blue: Integer;
  Cells: array [1..3] of Integer;
begin

  cxSpinEdit1.Value := ColorRed;
  tbRed.Position := ColorRed;
  cxSpinEdit2.Value := ColorGreen;
  tbGreen.Position := ColorGreen;
  cxSpinEdit3.Value := ColorBlue;
  tbBlue.Position := ColorBlue;
  Red := ColorRed;
  Green := ColorGreen;
  Blue := ColorBlue;

  Cells[1] := Red;
  Cells[2] := Green;
  Cells[3] := Blue;

  for s := 1 to 3-1 do
  begin
    min := Cells[s];
    IMin := s;
    for i := s+1 to 3 do
      if Cells[i] < Min then
      begin
        Min := Cells[i];
        IMin := i;
      end;
    Cells[IMin] := Cells[s];
    Cells[S] := Min;
  end;

  {Самое минимальное число совпадает со значением красного}
  if Cells[1] = Red then
  begin
    tmRed := 0;
    for i := 2 to 3 do
    begin
      if Cells[i] = Green then
      begin
        if Cells[i] >= 0 then
          tmGreen := Green - Red
        else
          tmGreen := Green + Abs(Red);
      end;

      if Cells[i] = Blue then
      begin
        if Cells[i] >= 0 then
          tmBlue := Blue - Red
        else
          tmBlue := Blue + Abs(Red);
      end;
    end;
  end;

  if Cells[1] = Green then
  begin
    tmGreen := 0;
    for i := 2 to 3 do
    begin
      if Cells[i] = Red then
      begin
        if Cells[i] >= 0 then
          tmRed := Red - Green
        else
          tmRed := Red + Abs(Green);
      end;

      if Cells[i] = Blue then
      begin
        if Cells[i] >= 0 then
          tmBlue := Blue - Green
        else
          tmBlue := Blue + Abs(Green);
      end;
    end;
  end;

  if Cells[1] = Blue then
  begin
    tmBlue := 0;
    for i := 2 to 3 do
    begin
      if Cells[i] = Red then
      begin
        if Cells[i] >= 0 then
          tmRed := Red - Blue
        else
          tmRed := Red + Abs(Blue);
      end;

      if Cells[i] = Green then
      begin
        if Cells[i] >= 0 then
          tmGreen := Green - Blue
        else
          tmGreen := Green + Abs(Blue);
      end;
    end;
  end;

  color.Red := tmRed;
  color.Green := tmGreen;
  color.Blue := tmBlue;

  pvbBitmap := gflCloneBitmap(FClonBitmap);
  gflBalance(pvbBitmap, nil, color);

  DeleteObject(hbmp);
  hbmp := CreateBitmap(pvbBitmap.Width, pvbBitmap.Height, pvbBitmap.ColorUsed, pvbBitmap.BitsPerComponent, nil);
  gflConvertBitmapIntoDDB(pvbBitmap, Fhbmp);
  Image.Picture.Bitmap.Handle := hbmp;
  
  gflFreeBitmap(pvbBitmap);
end; // procedure TfrmBalanceColor.ApplyUpdates

procedure TfrmBalanceColor.tbGreenChange(Sender: TObject);
begin
  ColorGreen := TRzTrackBar(Sender).Position;
end;

procedure TfrmBalanceColor.tbBlueChange(Sender: TObject);
begin
  ColorBlue := TRzTrackBar(Sender).Position;
end;

function TfrmBalanceColor.CalSize(var X, Y: Integer; ASize: Integer): Boolean;
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

procedure TfrmBalanceColor.CreatingBMP;
var
  W, H: Integer;
  hbmp: HBITMAP;
  pvbBitmap: PGFL_BITMAP;
begin
  FClonBitmap := gflCloneBitmap(OriginalBMP);
  pvbBitmap := gflCloneBitmap(FClonBitmap);
  CalSize(W, H, Image.Width);
  Panel1.DoubleBuffered := True;
  gflResize(pvbBitmap, nil, W, H, GFL_RESIZE_BILINEAR, 0);

  hbmp := CreateBitmap(pvbBitmap.Width, pvbBitmap.Height, pvbBitmap.ColorUsed, pvbBitmap.BitsPerComponent, nil);
  gflConvertBitmapIntoDDB(pvbBitmap, hbmp);
  ImageOrig.Picture.Bitmap.Handle := hbmp;
  gflFreeBitmap(pvbBitmap);

  gflResize(FClonBitmap, nil, W, H, GFL_RESIZE_BILINEAR, 0);
  ApplyUpdates;
end;

procedure TfrmBalanceColor.FormDestroy(Sender: TObject);
begin
  DeleteObject(hbmp);
  gflFreeBitmap(FClonBitmap);
end;

procedure TfrmBalanceColor.SetOriginalBMP(const Value: PGFL_BITMAP);
begin
  FOriginalBMP := Value;
end;

procedure TfrmBalanceColor.SettmBlue(const Value: Integer);
begin
  FtmBlue := Value;
end;

procedure TfrmBalanceColor.SettmGreen(const Value: Integer);
begin
  FtmGreen := Value;
end;

procedure TfrmBalanceColor.SettmRed(const Value: Integer);
begin
  FtmRed := Value;
end;

procedure TfrmBalanceColor.SetColorBlue(const Value: Integer);
begin
  FColorBlue := Value;
  ApplyUpdates;
end;

procedure TfrmBalanceColor.SetColorGreen(const Value: Integer);
begin
  FColorGreen := Value;
  ApplyUpdates;
end;

procedure TfrmBalanceColor.SetColorRed(const Value: Integer);
begin
  FColorRed := Value;
  ApplyUpdates;
end;

end.
