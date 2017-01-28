unit prodTypes;

interface

uses Classes, dxInspct, DB, dxInspRw;

type
  TPropertyType = record
    Index: Integer;
    Name: String;
  end;

const
  IndexOfString   = 1;
  IndexOfInt      = 2;
  IndexOfBoolean  = 3;
  IndexOfEnum     = 4;
  IndexOfSet      = 5;
  IndexOfText     = 6;
  IndexOfUrl      = 7;
  IndexOfPicture  = 8;
  IndexOfFile     = 9;

  PROPERTY_COUNT = 9;
  PropertyTypes: array[1..PROPERTY_COUNT] of TPropertyType = (
    (Index: IndexOfString;    Name: 'STRING'),
    (Index: IndexOfInt;       Name: 'INT'),
    (Index: IndexOfBoolean;   Name: 'BOOLEAN'),
    (Index: IndexOfEnum;      Name: 'ENUM'),
    (Index: IndexOfSet;       Name: 'SET'),
    (Index: IndexOfText;      Name: 'TEXT'),
    (Index: IndexOfUrl;       Name: 'URL'),
    (Index: IndexOfPicture;   Name: 'PICTURE'),
    (Index: IndexOfFile;      Name: 'FILE')
  );

type
  TInspectorRecord = class(TObject)
  private
    FDataSet: TDataSet;
    FFieldName: String;
    FKeyName: String;
    FKeyValue: Variant;
    FValue: Variant;
  public
    property DataSet: TDataSet read FDataSet write FDataSet;
    property FieldName: String read FFieldName write FFieldName;
    property KeyName: String read FKeyName write FKeyName;
    property KeyValue: Variant read FKeyValue write FKeyValue;
    property Value: Variant read FValue write FValue;
  end;

  { TInspectorStringRow }
  TInspectorStringRow = class(TdxInspectorTextRow)
  private
    FObject: TObject;
  protected
    function GetLinkObject: TObject; override;
    procedure SetLinkObject(Value: TObject); override;
  public
    destructor Destroy; override;
  end;

  { TInspectorIntRow }
  TInspectorIntRow = class(TdxInspectorTextSpinRow)
  private
    FObject: TObject;
  protected
    function GetLinkObject: TObject; override;
    procedure SetLinkObject(Value: TObject); override;
  public
    destructor Destroy; override;
  end;

  { TInspectorBooleanRow }
  TInspectorBooleanRow = class(TdxInspectorTextCheckRow)
  private
    FObject: TObject;
  protected
    function GetLinkObject: TObject; override;
    procedure SetLinkObject(Value: TObject); override;
  public
    destructor Destroy; override;
  end;

  { TInspectorEnumRow }
  TInspectorEnumRow = class(TdxInspectorTextPickRow)
  private
    FObject: TObject;
  protected
    function GetLinkObject: TObject; override;
    procedure SetLinkObject(Value: TObject); override;
  public
    destructor Destroy; override;
  end;

  { TInspectorTextRow }
  TInspectorTextRow = class(TdxInspectorTextButtonRow)
  private
    FObject: TObject;
  protected
    function GetLinkObject: TObject; override;
    procedure SetLinkObject(Value: TObject); override;
  public
    destructor Destroy; override;
  end;

  { TInspectorUrlRow }
  TInspectorUrlRow = class(TdxInspectorTextHyperLinkRow)
  private
    FObject: TObject;
  protected
    function GetLinkObject: TObject; override;
    procedure SetLinkObject(Value: TObject); override;
  public
    destructor Destroy; override;
  end;

  { TInspectorPictureRow }
  TInspectorPictureRow = class(TdxInspectorTextBlobRow)
  private
    FObject: TObject;
  protected
    function GetLinkObject: TObject; override;
    procedure SetLinkObject(Value: TObject); override;
  public
    destructor Destroy; override;
  end;


function GetPropertyIndex(const Name: String): Integer;

implementation

uses SysUtils, StrUtils;

function GetPropertyIndex(const Name: String): Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := 1 to PROPERTY_COUNT do
    if AnsiContainsText(PropertyTypes[i].Name, Name) then
    begin
      Result := i;
      Break;
    end;
end;

{ TdxInspectorStringRow }

destructor TInspectorStringRow.Destroy;
begin
  if Assigned(FObject) then FObject.Free;
  inherited;
end;

function TInspectorStringRow.GetLinkObject: TObject;
begin
  Result := FObject;
end;

procedure TInspectorStringRow.SetLinkObject(Value: TObject);
begin
  FObject := Value;
end;

{ TdxInspectorIntRow }

destructor TInspectorIntRow.Destroy;
begin
  if Assigned(FObject) then FObject.Free;
  inherited;
end;

function TInspectorIntRow.GetLinkObject: TObject;
begin
  Result := FObject;
end;

procedure TInspectorIntRow.SetLinkObject(Value: TObject);
begin
  FObject := Value;
end;

{ TInspectorBooleanRow }

destructor TInspectorBooleanRow.Destroy;
begin
  if Assigned(FObject) then FObject.Free;
  inherited;
end;

function TInspectorBooleanRow.GetLinkObject: TObject;
begin
  Result := FObject;
end;

procedure TInspectorBooleanRow.SetLinkObject(Value: TObject);
begin
  FObject := Value;
end;

{ TInspectorEnumRow }

destructor TInspectorEnumRow.Destroy;
begin
  if Assigned(FObject) then FObject.Free;
  inherited;
end;

function TInspectorEnumRow.GetLinkObject: TObject;
begin
  Result := FObject;
end;

procedure TInspectorEnumRow.SetLinkObject(Value: TObject);
begin
  FObject := Value;
end;

{ TInspectorTextRow }

destructor TInspectorTextRow.Destroy;
begin
  if Assigned(FObject) then FObject.Free;
  inherited;
end;

function TInspectorTextRow.GetLinkObject: TObject;
begin
  Result := FObject;
end;

procedure TInspectorTextRow.SetLinkObject(Value: TObject);
begin
  FObject := Value;
end;

{ TInspectorUrlRow }

destructor TInspectorUrlRow.Destroy;
begin
  if Assigned(FObject) then FObject.Free;
  inherited;
end;

function TInspectorUrlRow.GetLinkObject: TObject;
begin
  Result := FObject;
end;

procedure TInspectorUrlRow.SetLinkObject(Value: TObject);
begin
  FObject := Value;
end;

{ TInspectorPictureRow }

destructor TInspectorPictureRow.Destroy;
begin
  if Assigned(FObject) then FObject.Free;
  inherited;
end;

function TInspectorPictureRow.GetLinkObject: TObject;
begin
  Result := FObject;
end;

procedure TInspectorPictureRow.SetLinkObject(Value: TObject);
begin
  FObject := Value;
end;

end.
