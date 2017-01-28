unit prodPriceDataSource;

interface

uses Classes, cxCustomData;
  
type
  TPriceItem = class(TCollectionItem)
  private
    FTitle: String;
  public
    property Title: String read FTitle write FTitle;
  end;

  TPriceDataSource = class(TcxCustomDataSource)
  private
    FPrice: TCollection;
  protected
    function GetRecordCount: Integer; override;
    function GetValue(ARecordHandle: TcxDataRecordHandle;
      AItemHandle: TcxDataItemHandle): Variant; override;
  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses progDataModule, DB, cxGridCustomTableView, Variants;

{ TPriceDataSource }

constructor TPriceDataSource.Create;
var
  p: TPriceItem;
begin
  FPrice := TCollection.Create(TPriceItem);
  with DM.Products do
  begin
    DisableControls;
    Filter := 'is_folder=0 and is_printable=1';
    Filtered := True;
    First;
    while not EOF do
    begin
      p := TPriceItem(FPrice.Add);
      p.Title := FieldValues['title'];
      Next;
    end;
    Filtered := False;
    EnableControls;
  end;
end;

destructor TPriceDataSource.Destroy;
begin
  FPrice.Free;
  inherited;
end;

function TPriceDataSource.GetRecordCount: Integer;
begin
  Result := FPrice.Count;
end;

function TPriceDataSource.GetValue(ARecordHandle: TcxDataRecordHandle;
  AItemHandle: TcxDataItemHandle): Variant;
var
  PriceItem: TPriceItem;
begin
  Result := Null;
  
{  //Get column’s DataBinding based on the index
  ADataBinding := GetDataBinding(Integer(AItemHandle));
  //Get a specific record from the FCustomers list
  ACustomer := FCustomers[Integer(ARecordHandle)];
  //Return a value according to DataBinding.Data
}  
  PriceItem := TPriceItem(FPrice.Items[Integer(ARecordHandle)]);
  case Integer(AItemHandle) of
    0: Result := PriceItem.Title;
  else
    Result := Null;
  end;
end;

end.
