unit imgImageSelect;

interface

uses Classes, Controls, Types, Messages, Graphics;

type
  TImageSelect = class(TGraphicControl)
  private
    xDown: Integer;
    yDown: Integer;
    ptDown: TPoint;
    dragging: Integer;
    wDrag: Integer;
    rcDown: TRect;
    rcDrag: Array [0..7] of TRect;
    rcCursor: Array [0..8] of TCursor;
    FColorLineSelect: TColor;
    FHotColorLineSelect: TColor;
    FScrollPositionX: Integer;
    FScrollPositionY: Integer;
    FGlobalWidth: Integer;
    FGlobalHeight: Integer;
    FsbTop: Integer;
    FsbBottom: integer;
    FsbLeft: Integer;
    FsbRight: Integer;
    FMaxHeight: Integer;
    FStartY: Integer;
    FStartX: Integer;
    FMaxWidth: Integer;
    FOnMove: TNotifyEvent;
    procedure SetGlobalHeight(const Value: Integer);
    procedure SetGlobalWidth(const Value: Integer);
    procedure SetsbBottom(const Value: integer);
    procedure SetsbLeft(const Value: Integer);
    procedure SetsbRight(const Value: Integer);
    procedure SetsbTop(const Value: Integer);
    procedure SetMaxHeight(const Value: Integer);
    procedure SetMaxWidth(const Value: Integer);
    procedure SetStartX(const Value: Integer);
    procedure SetStartY(const Value: Integer);
  protected
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;
    destructor Destroy; override;
    property OnDblClick;
    property ParentShowHint;
    property ShowHint;
    property PopupMenu;
    property ColorLineSelect: TColor read FColorLineSelect write FColorLineSelect;
    property HotColorLineSelect: TColor read FHotColorLineSelect write FHotColorLineSelect;
    property MaxWidth: Integer read FMaxWidth write SetMaxWidth;
    property MaxHeight: Integer read FMaxHeight write SetMaxHeight;
    property StartX: Integer read FStartX write SetStartX;
    property StartY: Integer read FStartY write SetStartY;
    property ScrollPositionX: Integer read FScrollPositionX write FScrollPositionX;
    property ScrollPositionY: Integer read FScrollPositionY write FScrollPositionY;
    property GlobalWidth: Integer read FGlobalWidth write SetGlobalWidth;
    property GlobalHeight: Integer read FGlobalHeight write SetGlobalHeight;
    property sbLeft: Integer read FsbLeft write SetsbLeft;
    property sbTop: Integer read FsbTop write SetsbTop;
    property sbRight: Integer read FsbRight write SetsbRight;
    property sbBottom: integer read FsbBottom write SetsbBottom;
    property OnMove: TNotifyEvent read FOnMove write FOnMove;
  end;

implementation

{ TImageSelect }

constructor TImageSelect.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Canvas.Brush.Style := bsClear;
  dragging := -1;
  wDrag := 5;

  ParentColor := True;

  rcCursor[0] := crSizeNWSE;
  rcCursor[1] := crSizeNS;
  rcCursor[2] := crSizeNESW;
  rcCursor[3] := crSizeWE;
  rcCursor[4] := crSizeNWSE;
  rcCursor[5] := crSizeNS;
  rcCursor[6] := crSizeNESW;
  rcCursor[7] := crSizeWE;
  rcCursor[8] := crSizeAll;
end;

destructor TImageSelect.Destroy;
begin

  inherited;
end;

procedure TImageSelect.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  i: Integer;
  pt: TPoint;
begin
  inherited;
  pt := Point(X,Y);
  ptDown := ClientToScreen(pt);
  xDown := X;
  yDown := Y;
  rcDown := Rect(left,top,left+Width,top+Height);
  dragging := -1;
  for i := 0 to 7 do
    if PtInRect(rcDrag[i],pt) then
      dragging := i;
   if dragging <> -1 then
    Cursor := rcCursor[dragging]
  else
    if Cursor <> crArrow then
      Cursor := crArrow;
  Invalidate;
end;

procedure TImageSelect.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  i: Integer;
  pt: TPoint;
  xDif, yDif: Integer;

  procedure SetW(leftOff,topOff,rightOff,bottomOff: Integer);
  var
    rc: TRect;
    nLeft, nTop, nRight, nBottom: integer;
  begin
    rc := rcDown;

    Inc(rc.Left,leftOff);
    Inc(rc.Top,topOff);
    Inc(rc.Right,rightOff);
    Inc(rc.Bottom,bottomOff);

    // Координаты обрезки
    sbLeft := ABS (StartX) + rc.Left;
    sbTop := ABS (StartY) + rc.Top;
    sbRight := rc.Right - rc.Left;
    sbBottom := rc.Bottom - rc.Top;

    if sbLeft < 0 then sbLeft := 0;
    if sbTop < 0 then sbTop := 0;

    if rc.Top + 10 > rc.Bottom
      then
        begin
          if topOff = 0 then rc.Bottom := rc.Top + 10;
          if bottomOff = 0 then rc.Top := rc.Bottom - 10;
        end;

    if rc.Left + 10 > rc.Right
      then
        begin
          if leftOff = 0 then rc.Right := rc.Left + 10;
          if rightOff = 0 then rc.Left := rc.Right - 10;
        end;

    if (rc.Top < StartY)
      then
        begin
          nTop := StartY;
          rc.Bottom := nTop + Height;
        end
      else nTop := rc.Top;
    //Блокирование ухода селкта левее, чем картинка
    if (rc.Left < StartX)
      then
        begin
          nLeft := StartX;
          rc.Right := nLeft + Width;
        end
      else nLeft := rc.Left;
    //Блокирование ухода селкта правее, чем картинка
    if (rc.Right > MaxWidth)
      then
        begin
          nRight := MaxWidth;
          nLeft := nRight - width;
        end
      else nRight := rc.Right;
    //Блокирование ухода селкта ниже, чем картинка
    if (rc.Bottom > MaxHeight)
      then
        begin
          nBottom := MaxHeight;
          nTop := nBottom - Height;
        end
      else nBottom := rc.Bottom;

    SetBounds(nLeft, nTop, nRight-nLeft, nBottom-nTop);
    // Передаю координаты ImageSelect
    if Assigned(FOnMove) then FOnMove(Self);
  end;

begin
  inherited;
  pt := ClientToScreen(Point(X,Y));
  xDif := pt.X - ptDown.X;
  yDif := pt.Y - ptDown.Y;

  if ssLeft in Shift then
    case dragging of
      -1: SetW(xDif,yDif,xDif,yDif);
      0:  SetW(xDif,yDif,0,0);
      1:  SetW(0,yDif,0,0);
      2:  SetW(0,yDif,xDif,0);
      3:  SetW(0,0,xDif,0);
      4:  SetW(0,0,xDif,yDif);
      5:  SetW(0,0,0,yDif);
      6:  SetW(xDif,0,0,yDif);
      7:  SetW(xDif,0,0,0);
    end
  else
  begin
    pt := Point(X,Y);
    Cursor := rcCursor[8];
    for i := 0 to 7 do
      if PtInRect(rcDrag[i],pt) then
        Cursor := rcCursor[i];
  end;

end;

procedure TImageSelect.MouseUp(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
  dragging := -1;
  Invalidate;
end;

procedure TImageSelect.Paint;
var
  rc: TRect;
  i,w: Integer;
begin
  with Canvas do
  begin

    Pen.Style := psDot;
    if dragging = -1 then
      Pen.Color := FColorLineSelect
    else
      Pen.Color := FHotColorLineSelect;

    rc := GetClientRect;
    w := wDrag div 2;

    Rectangle(w-2, w-2, rc.right-w+2, rc.bottom-w+2);

    Brush.Style := bsSolid;
    Brush.Color := Pen.Color;
    Pen.Style := psSolid;
    for i := 0 to 7 do
      Rectangle(rcDrag[i].Left,rcDrag[i].Top,rcDrag[i].Right,rcDrag[i].Bottom);

    Brush.Style := bsClear;
  end;
end;

procedure TImageSelect.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
var
  r,b,r2,b2: Integer;
  wDrag2: Integer;
begin
  r := AWidth;
  b := AHeight;
  r2:= r div 2;
  b2 := b div 2;
  wDrag2 := wDrag div 2;
  // Кубики толщина
  rcDrag[0] := Rect(0,0,wDrag,wDrag);
  rcDrag[1] := Rect(r2-wDrag2,0,r2+wDrag2,wDrag);
  rcDrag[2] := Rect(r-wDrag+1,0,r,wDrag);
  rcDrag[3] := Rect(r-wDrag+1,b2-wDrag2,r,b2+wDrag2);
  rcDrag[4] := Rect(r-wDrag+1,b-wDrag,r,b);
  rcDrag[5] := Rect(r2-wDrag2,b-wDrag,r2+wDrag2,b);
  rcDrag[6] := Rect(0,b-wDrag,wDrag,b);
  rcDrag[7] := Rect(0,b2-wDrag2,wDrag,b2+wDrag2);

  inherited SetBounds(ALeft,ATop,AWidth,AHeight);
end;

procedure TImageSelect.SetGlobalHeight(const Value: Integer);
begin
  FGlobalHeight := Value;
end;

procedure TImageSelect.SetGlobalWidth(const Value: Integer);
begin
  FGlobalWidth := Value;
end;

procedure TImageSelect.SetMaxHeight(const Value: Integer);
begin
  FMaxHeight := Value;
end;

procedure TImageSelect.SetMaxWidth(const Value: Integer);
begin
  FMaxWidth := Value;
end;

procedure TImageSelect.SetsbBottom(const Value: integer);
begin
  FsbBottom := Value;
end;

procedure TImageSelect.SetsbLeft(const Value: Integer);
begin
  FsbLeft := Value;
end;

procedure TImageSelect.SetsbRight(const Value: Integer);
begin
  FsbRight := Value;
end;

procedure TImageSelect.SetsbTop(const Value: Integer);
begin
  FsbTop := Value;
end;

procedure TImageSelect.SetStartX(const Value: Integer);
begin
  FStartX := Value;
end;

procedure TImageSelect.SetStartY(const Value: Integer);
begin
  FStartY := Value;
end;

end.
