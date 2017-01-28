unit prodPriceForm;

interface

uses
  Forms, QExport3CustomSource, DB, dxmdaset, dxtrprds, QExport3,
  QExport3XLS, Classes, ActnList, Menus, TB2Item, ComCtrls, TB2Dock,
  TB2Toolbar, Controls;

type
  TPriceForm = class(TForm)
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBPopupMenu1: TTBPopupMenu;
    ActionList1: TActionList;
    StatusBar1: TStatusBar;
    XLS: TQExport3XLS;
    Action1: TAction;
    TBItem2: TTBItem;
    Data: TdxDBTreePrintData;
    CustomSource: TqeCustomSource;
    procedure Action1Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CustomSourceGetNextRecord(Sender: TObject; RecNo: Integer;
      var Eof: Boolean);
    procedure CustomSourceGetColumnValue(Sender: TObject; RecNo: Integer;
      Column: TqeCustomColumn; var Value: Variant);
    procedure XLSGetDataParams(Sender: TObject; Sheet, Col, Row: Integer;
      Format: TxlsFormat; var FormatText: String);
  private
    function PropertyValueByName(const PropertyName: String): Variant;
  end;

function GetPriceForm: Integer;
procedure GetPriceFormTmp;

implementation

uses prodMainForm, prodPriceDataSource, cxExportGrid4Link,
  progDataModule, Variants;

{$R *.dfm}

function GetPriceForm: Integer;
var
  Form: TPriceForm;
begin
  Form := TPriceForm.Create(Application);
  try
    Result := Form.ShowModal;
  finally
    Form.Free;
  end;
end;

procedure GetPriceFormTmp;
var
  Form: TPriceForm;
begin
  Form := TPriceForm.Create(Application);
  try
    Form.Action1Execute(nil);
  finally
    Form.Free;
  end;
end;

procedure TPriceForm.Action1Execute(Sender: TObject);
begin
  XLS.Execute;
end;

procedure TPriceForm.FormCreate(Sender: TObject);
begin
  DM.Products.Filter := 'is_printable = 1';
  DM.Products.Filtered := True;
  Data.Open;
  DM.Products.Filtered := False;
end;

procedure TPriceForm.CustomSourceGetNextRecord(Sender: TObject;
  RecNo: Integer; var Eof: Boolean);
begin
  Data.Next;
  Eof := Data.Eof;
end;

procedure TPriceForm.CustomSourceGetColumnValue(Sender: TObject;
  RecNo: Integer; Column: TqeCustomColumn; var Value: Variant);
begin
  case Column.Index of
    0: Value := Data['product_article'];
    1: Value := Data['full_title'];
    2: Value := PropertyValueByName('_price');
  end;
end;

procedure TPriceForm.XLSGetDataParams(Sender: TObject; Sheet, Col,
  Row: Integer; Format: TxlsFormat; var FormatText: String);
begin
  if Data['is_folder'] = 1 then
  begin
    Format.Font.Color := TxlsColor(Data['dx$level']*3);
    Format.Font.Size := 12;
    Format.Font.Style := [xfsBold]; 
  end;
end;

function TPriceForm.PropertyValueByName(
  const PropertyName: String): Variant;
begin
  Result := Null;
  if Data['is_folder'] = 1 then Exit;
  if DM.Properties.Locate('name', PropertyName, []) then
  begin
    if DM.Values.Locate('product_id;property_id',
      VarArrayOf([Data['product_id'], DM.Properties['property_id']]),
      [loPartialKey]) then
      Result := DM.Values['value'];
  end;
end;

end.
