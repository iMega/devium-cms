{----------------------------------------------------------------------

   DEVIUM Content Management System
   Copyright (C) 2004 by DEIV Development Team.
   http://www.deiv.com/

   $Header: /devium/Devium\040CMS\0402/Source/Products/prodProductForm.pas,v 1.7 2004/05/06 15:24:06 paladin Exp $

------------------------------------------------------------------------}
unit prodProductForm;

interface
                                    
uses
  Forms, cxLookAndFeelPainters, dxExEdtr, ExtDlgs, Dialogs, TB2Item, Menus,
  Classes, ActnList, cxCheckBox, cxDBEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, dxInspct, dxInspRw, dxCntner,
  cxMaskEdit, cxMemo, cxControls, cxContainer, cxEdit, cxTextEdit,
  StdCtrls, cxButtons, Controls, ExtCtrls, Graphics, Types,
  PluginManagerIntf, DB;

type
  TProductForm = class(TForm)
    Panel4: TPanel;
    OK: TcxButton;
    Cancel: TcxButton;
    ActionList: TActionList;
    ActionOK: TAction;
    title: TcxDBTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    product_article: TcxDBTextEdit;
    full_title: TcxDBMemo;
    Label5: TLabel;
    Label6: TLabel;
    name: TcxDBMaskEdit;
    Go: TcxButton;
    PricesList: TAction;
    TBPopupMenu1: TTBPopupMenu;
    UnitsList: TAction;
    Action1: TAction;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    Label7: TLabel;
    description: TcxDBMemo;
    EditDescription: TcxButton;
    InspPanel: TPanel;
    Inspector: TdxInspector;
    type_id: TcxDBLookupComboBox;
    is_visible: TcxDBCheckBox;
    is_printable: TcxDBCheckBox;
    Label3: TLabel;
    OpenDialog: TOpenDialog;
    OpenPictureDialog: TOpenPictureDialog;
    InspectorRow1: TdxInspectorTextButtonRow;
    cxButton1: TcxButton;
    procedure UnitsListExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionOKExecute(Sender: TObject);
    procedure InspectorEnter(Sender: TObject);
    procedure InspectorExit(Sender: TObject);
    procedure InspectorDrawValue(Sender: TdxInspectorRow; ACanvas: TCanvas;
      ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor;
      var ADone: Boolean);
    procedure InspectorEdited(Sender: TObject; Node: TdxInspectorNode;
      Row: TdxInspectorRow);
    procedure InspectorGetEditFont(Sender: TdxInspectorRow;
      var AFont: TFont);
    procedure EditDescriptionClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure titlePropertiesEditValueChanged(Sender: TObject);
  private
    FPluginManager: IPluginManager;
    procedure AddStringRow(Row: TdxInspectorRow; DataSet: TDataSet);
    procedure AddIntRow(Row: TdxInspectorRow; DataSet: TDataSet);
    procedure AddBooleanRow(Row: TdxInspectorRow; DataSet: TDataSet);
    procedure AddEnumRow(Row: TdxInspectorRow; DataSet: TDataSet);
    procedure AddSetRow(Row: TdxInspectorRow; DataSet: TDataSet);
    procedure AddTextRow(Row: TdxInspectorRow; DataSet: TDataSet);
    procedure AddUrlRow(Row: TdxInspectorRow; DataSet: TDataSet);
    procedure AddPictureRow(Row: TdxInspectorRow; DataSet: TDataSet);
    procedure AddFileRow(Row: TdxInspectorRow; DataSet: TDataSet);
    //
    procedure SetRowChange(Sender: TObject);
    function GetInspectorRecord(DataSet: TDataSet; const FieldName, KeyName: String): TObject;
    procedure TextRowButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure FileRowButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure PictureRowButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    //
    procedure LoadPrices;
    procedure LoadUnitns;
    procedure LoadProperties(type_id: Integer);
    //
    function AddRecord(DataSet: TDataSet; Row: TdxInspectorRow;
      AddText: Boolean = True): String;
  public
    procedure LoadInspector;
    procedure SaveInspector;
    property PluginManager: IPluginManager read FPluginManager write FPluginManager;
  end;

function GetProductForm(PluginManager: IPluginManager): Integer;

implementation

uses progDataModule, prodMainForm, prodUnitsListForm,
  DBClient, SysUtils, DeviumLib, HTMLEditorIntf, prodTypes, Variants, Math,
  Windows, prodShowImage;

{$R *.dfm}

const
  ABoldFlag = 01;

function GetProductForm;
var
  Form: TProductForm;
begin
  Form := TProductForm.Create(Application);
  try
    Form.PluginManager := PluginManager;
    if DM.Products['is_folder'] = 1 then
      Form.Caption := 'Карточка группы';
    Result := Form.ShowModal;
    if Result = mrOK then
      Form.SaveInspector;
  finally
    Form.Free;
  end;
end;

procedure PrepareValueFont(ARow: TdxInspectorRow; AFont: TFont);
begin
  if ARow.Tag and ABoldFlag <> 0 then
    AFont.Style := AFont.Style + [fsBold];
end;

procedure RowChanged(ARow: TdxInspectorRow);
begin
  ARow.Tag := aRow.Tag or ABoldFlag;
end;

{
procedure GetText(ARow: TdxInspectorTextCheckRow; var AText: string);
begin
  if ARow.GetCheckBoxState(ARow.EditText) = dxExEdtr.cbsChecked then
  begin
    if AText <> '' then
      AText := AText + ', ';
    AText := AText + ARow.Caption;
  end;
end;
}

procedure TProductForm.UnitsListExecute(Sender: TObject);
begin
  GetUnitsListForm;
end;

procedure TProductForm.FormCreate(Sender: TObject);
begin
  LoadInspector;
end;

procedure TProductForm.LoadInspector;
begin
  Inspector.ClearNodes;
  Inspector.ClearRows;
  LoadPrices;
  LoadUnitns;
  if not type_id.DataBinding.Field.IsNull then
    LoadProperties(type_id.DataBinding.Field.Value);
end;

procedure TProductForm.SaveInspector;
var
  i, j: Integer;
  R: TInspectorRecord;
  s: String;
  LFileName, LFilePath, LFileExt: String;
begin
  LFileName := '';
  with DM.Values, Inspector do
  begin
    for i := 0 to Inspector.TotalRowCount - 1 do
      if Assigned(Rows[i].LinkObject) then
      begin
        R := TInspectorRecord(Rows[i].LinkObject);
        if Locate(R.KeyName, R.KeyValue, []) then
        begin
          s := Rows[i].EditText;
          // (copy|delete) file before (save|delete)
          // 1. проверка та тип
          if Rows[i] is TInspectorTextRow then
          begin
            LFilePath := Dm.GetLocalPath(DM.Values);
            if (Length(Trim(s)) = 0)
              and (Length(Trim(FieldValues['value'])) > 0)
              and (FileExists(LFilePath + FieldValues['value']))
            then
               SysUtils.DeleteFile(LFilePath + FieldValues['value']);

            // сравнение на то что это путь
            if Length(ExtractFilePath(s)) > 0 then
            begin
              if FileExists(s) then
              begin
                LFileName := ExtractFileName(s);
                LFileExt := ExtractFileExt(LFileName);
                j := Pos(LFileExt, LFileName);
                LFileName := copy(LFileName, 1, j);
                LFileName := TransLiterStr(LFileName) + LFileExt;
                ForceDirectories(LFilePath);
                if CopyFile(PChar(s), PChar(LFilePath + LFileName), False) then
                  s := LFileName;
              end;
            end;
          end;
          // end
          Edit;
          FieldValues['value'] := s;
          Post;
        end;
      end;
  end;
end;

procedure TProductForm.ActionOKExecute(Sender: TObject);
begin
  OK.SetFocus;
  ModalResult := mrOK;
end;

procedure TProductForm.AddTextRow;
var
  Node: TdxInspectorRowNode;
begin
  Node := Row.Node.AddChildEx(TInspectorTextRow);
  Node.Row.Caption := DataSet['property_title'];
  Node.Row.ReadOnly := True;
  //Node.Row.EditText := '(Текст)';
  AddRecord(DataSet, Node.Row);
  TInspectorTextRow(Node.Row).OnButtonClick := TextRowButtonClick;
end;

procedure TProductForm.AddEnumRow;
var
  Node: TdxInspectorRowNode;
  ARow: TInspectorEnumRow;
begin
  Node := Row.Node.AddChildEx(TInspectorEnumRow);
  ARow := TInspectorEnumRow(Node.Row);
  ARow.PopupBorder := pbFlat;
  ARow.Caption := DataSet['property_title'];
  ARow.DropDownListStyle := True;
  ARow.Items.DelimitedText := DataSet['length_set'];
  AddRecord(DataSet, Node.Row);
end;

procedure TProductForm.AddIntRow;
var
  Node: TdxInspectorRowNode;
begin
  Node := Row.Node.AddChildEx(TInspectorIntRow);
  Node.Row.Caption := DataSet['property_title'];
  AddRecord(DataSet, Node.Row);
end;

procedure TProductForm.AddPictureRow;
var
  Node: TdxInspectorRowNode;
  B: TdxEditButton;
begin
  Node := Row.Node.AddChildEx(TInspectorTextRow);
  Node.Row.Caption := DataSet['property_title'];
  B := TInspectorTextRow(Node.Row).Buttons.Add;
  B.Glyph.LoadFromResourceName(HInstance, 'GLYPH_VIEW');
  B.Kind := dxExEdtr.bkGlyph;
  TInspectorTextRow(Node.Row).OnButtonClick := PictureRowButtonClick;
  AddRecord(DataSet, Node.Row);
end;

procedure TProductForm.AddSetRow;
var
  Node: TdxInspectorRowNode;
  ANode: TdxInspectorRowNode;
  sl, sl_value: TStringList;
  i: Integer;
begin
  Node := Row.Node.AddChildEx(TInspectorStringRow);
  Node.Row.Caption := DataSet['property_title'];
  Node.Row.EditText := AddRecord(DataSet, Node.Row, False);
  Node.Row.ReadOnly := True;
  sl_value := TStringList.Create;
  try
    sl_value.DelimitedText := Node.Row.EditText;
    sl := TStringList.Create;
    try
      sl.DelimitedText := DataSet['length_set'];
      for i := 0 to sl.Count - 1 do
      begin
        ANode :=  Node.AddChildEx(TdxInspectorTextCheckRow);
        ANode.Row.Caption := sl[i];
        ANode.Row.OnChange := SetRowChange;
        if sl_value.IndexOf(sl[i]) > -1 then
          TdxInspectorTextCheckRow(ANode.Row).EditText := 'True';
      end;
      { TODO : Проверить на сложные назавания (содержащие пробел) }
    finally
      sl.Free;
    end;
  finally
    sl_value.Free;
  end;
end;

procedure TProductForm.InspectorEnter(Sender: TObject);
begin
  InspPanel.Color := clActiveCaption;
end;

procedure TProductForm.InspectorExit(Sender: TObject);
begin
  InspPanel.Color := clBtnShadow;
end;

procedure TProductForm.SetRowChange(Sender: TObject);
var
  Row: TdxInspectorRow;
  Node, CNode: TdxInspectorRowNode;
  i: Integer;
  sl: TStringList;
  CheckRow: TdxInspectorTextCheckRow;
begin
  Inspector.PostEditor;
  Row := TdxInspectorRow(Sender);
  Node := TdxInspectorRowNode(Row.Node.Parent);
  sl := TStringList.Create;
  try
    for i := 0 to Node.Count - 1 do
    begin
      CNode := TdxInspectorRowNode(Node[i]);
      CheckRow := TdxInspectorTextCheckRow(CNode.Row);
      if CheckRow.GetCheckBoxState(CheckRow.EditText) = dxExEdtr.cbsChecked then
        sl.Add(CheckRow.Caption);
    end;
    Node.Row.EditText := sl.DelimitedText;
  finally
    sl.Free;
  end;
  RowChanged(Node.Row);
end;

procedure TProductForm.InspectorDrawValue(Sender: TdxInspectorRow;
  ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;
  var AColor: TColor; var ADone: Boolean);
begin
  PrepareValueFont(Sender, AFont);
end;

procedure TProductForm.InspectorEdited(Sender: TObject;
  Node: TdxInspectorNode; Row: TdxInspectorRow);
begin
  RowChanged(Row);
end;

procedure TProductForm.InspectorGetEditFont(Sender: TdxInspectorRow;
  var AFont: TFont);
begin
  PrepareValueFont(Sender, AFont);
end;

{ TInspectorRecord }

function TProductForm.GetInspectorRecord(DataSet: TDataSet;
  const FieldName, KeyName: String): TObject;
var
  R: TInspectorRecord;
begin
  R := TInspectorRecord.Create;
  R.DataSet := DataSet;
  R.FieldName := FieldName;
  R.Value := DataSet[FieldName];
  R.KeyName := KeyName;
  R.KeyValue := DataSet[KeyName];
  Result := R;
end;

procedure TProductForm.TextRowButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  Editor: IHTMLEditor;
  s: String;
  R: TInspectorRecord;
begin
  R := TInspectorRecord(TdxInspectorRow(Sender).LinkObject);
  DM.Values.Locate(R.KeyName, R.KeyValue, []);
  TdxInspectorRow(Sender).Tag := ABoldFlag; // делаем жирным
  if FPluginManager.GetPlugin(IHTMLEditor, Editor) then
  begin
    s := TInspectorTextRow(Sender).EditText;
    Editor.LocalPath := DM.GetLocalPath(DM.Values);
    Editor.RemotePath := DM.GetRemotePath(Editor.LocalPath);
    if Editor.Execute(s) then
    begin
      TInspectorTextRow(Sender).EditText := s;
    end;
  end;
end;

procedure TProductForm.LoadPrices;
var
  Row: TdxInspectorRow;
  Node: TdxInspectorRowNode;
begin
  with DM.Prices do
  begin
    Filter := Format('product_id=%s', [DM.Products['product_id']]);
    Filtered := True;
    if RecordCount > 0 then
    begin
      Row := Inspector.CreateRow(TdxInspectorTextRow);
      Row.Caption := 'Цены';
      Row.ReadOnly := True;
      First;
      while not EOF do
      begin
        Node := Row.Node.AddChildEx(TdxInspectorTextCurrencyRow);
        DM.PriceTypes.Locate('price_type_id', FieldValues['price_type_id'], []);
        Node.Row.Caption := DM.PriceTypes['price_title'];
        Node.Row.EditText := FieldValues['price'];
        //,0.00р'.';-,0.00р'.'
        TdxInspectorTextCurrencyRow(Node.Row).DisplayFormat := ',0.00$;-,0.00$';
        Node.Row.LinkObject := GetInspectorRecord(DM.Prices, 'price', 'price_id');
        Next;
      end;
    end;
    Filtered := False;
  end;
end;

procedure TProductForm.LoadUnitns;
var
  Row: TdxInspectorRow;
  Node: TdxInspectorRowNode;
begin
  with DM.Units do
  begin
    Filter := Format('product_id=%s', [DM.Products['product_id']]);
    Filtered := True;
    if RecordCount > 0 then
    begin
      Row := Inspector.CreateRow(TdxInspectorTextRow);
      Row.Caption := 'Еденицы';
      Row.ReadOnly := True;
      First;
      while not EOF do
      begin
        Node := Row.Node.AddChildEx(TdxInspectorTextSpinRow);
        DM.UnitNames.Locate('unit_name_id', FieldValues['unit_name_id'], []);
        Node.Row.Caption := DM.UnitNames['unit_title'];
        Node.Row.EditText := FieldValues['multiplier'];
        Node.Row.LinkObject := GetInspectorRecord(DM.Units, 'multiplier', 'unit_id');
        Next;
      end;
    end;
    Filtered := False;
  end;
end;

procedure TProductForm.LoadProperties(type_id: Integer);
var
  Row: TdxInspectorRow;
begin
  // Свойства
  with DM.Properties do
  begin
    DM.Types.Locate('type_id', type_id, []);
    Filter := Format('type_id=%d', [type_id]);
    Filtered := True;
    if RecordCount > 0 then
    begin
      Row := Inspector.CreateRow(TdxInspectorTextRow);
      Row.Caption := 'Свойства';
      Row.EditText := DM.Types['type_title'];
      Row.ReadOnly := True;
      First;
      while not EOF do
      begin
        if FieldValues['is_public'] = 1 then
          case GetPropertyIndex(FieldByName('datatype').AsString) of
            1: AddStringRow(Row, DM.Properties);
            2: AddIntRow(Row, DM.Properties);
            3: AddBooleanRow(Row, DM.Properties);
            4: AddEnumRow(Row, DM.Properties);
            5: AddSetRow(Row, DM.Properties);
            6: AddTextRow(Row, DM.Properties);
            7: AddUrlRow(Row, DM.Properties);
            8: AddPictureRow(Row, DM.Properties);
            9: AddFileRow(Row, DM.Properties);
          end;
        Next;
      end;
      Row.Node.Expanded := True;
    end;
    Filtered := False;
  end;
  // будем подниматся выше
  if DM.Types['parent_id'] > 0 then
      LoadProperties(DM.Types['parent_id']);
end;

procedure TProductForm.AddStringRow(Row: TdxInspectorRow;
  DataSet: TDataSet);
var
  Node: TdxInspectorRowNode;
begin
  Node := Row.Node.AddChildEx(TInspectorStringRow);
  Node.Row.Caption := DataSet['property_title'];
  AddRecord(DataSet, Node.Row);
end;

function TProductForm.AddRecord(DataSet: TDataSet; Row: TdxInspectorRow;
  AddText: Boolean): String;
begin
  with DM.Values do
  begin
    if not Locate('product_id;property_id', VarArrayOf([DM.Products['product_id'],
      DataSet['property_id']]), [loPartialKey]) then
    begin
      Append;
      FieldValues['product_id'] := DM.Products['product_id'];
      FieldValues['property_id'] := DataSet['property_id'];
      FieldValues['value'] := DataSet['default_value'];
      Post;
    end;
    Result := Trim(FieldValues['value']);
    if AddText then Row.EditText := Result;
    Row.LinkObject := GetInspectorRecord(DM.Values, 'value', 'value_id');
  end;
end;

procedure TProductForm.AddBooleanRow(Row: TdxInspectorRow;
  DataSet: TDataSet);
var
  Node: TdxInspectorRowNode;
begin
  Node := Row.Node.AddChildEx(TInspectorBooleanRow);
  Node.Row.Caption := DataSet['property_title'];
  AddRecord(DataSet, Node.Row);
end;

procedure TProductForm.AddUrlRow(Row: TdxInspectorRow; DataSet: TDataSet);
var
  Node: TdxInspectorRowNode;
begin
  Node := Row.Node.AddChildEx(TInspectorUrlRow);
  Node.Row.Caption := DataSet['property_title'];
  AddRecord(DataSet, Node.Row);
end;

procedure TProductForm.AddFileRow(Row: TdxInspectorRow; DataSet: TDataSet);
var
  Node: TdxInspectorRowNode;
begin
  Node := Row.Node.AddChildEx(TInspectorTextRow);
  Node.Row.Caption := DataSet['property_title'];
  TInspectorTextRow(Node.Row).OnButtonClick := FileRowButtonClick;
  AddRecord(DataSet, Node.Row);
end;

procedure TProductForm.FileRowButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  if OpenDialog.Execute then
    TInspectorTextRow(Sender).EditText := OpenDialog.FileName;
end;

procedure TProductForm.PictureRowButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  R: TInspectorRecord;
begin
  // select
  if AbsoluteIndex = 0 then
    if OpenPictureDialog.Execute then
      TInspectorTextRow(Sender).EditText := OpenPictureDialog.FileName;
  // show
  if AbsoluteIndex = 1 then
  begin
    R := TInspectorRecord(TdxInspectorRow(Sender).LinkObject);
    DM.Values.Locate(R.KeyName, R.KeyValue, []);
    GetShowImageForm(DM.GetLocalPath(DM.Values) + TInspectorTextRow(Sender).EditText);
  end;
end;

procedure TProductForm.EditDescriptionClick(Sender: TObject);
var
  Editor: IHTMLEditor;
  s: String;
begin
  if FPluginManager.GetPlugin(IHTMLEditor, Editor) then
  begin
    s := description.Text;
    Editor.LocalPath := DM.GetLocalPath(DM.Products);
    Editor.RemotePath := DM.GetRemotePath(Editor.LocalPath);
    if Editor.Execute(s) then
      description.DataBinding.Field.Value := s;
  end;
end;

procedure TProductForm.cxButton1Click(Sender: TObject);
begin
  name.DataBinding.Field.Value := TransLiterStr(title.Text);
end;

procedure TProductForm.titlePropertiesEditValueChanged(Sender: TObject);
begin
  if Trim(full_title.Text) = '' then
    full_title.DataBinding.Field.Value := title.Text;
  if Trim(name.Text) = '' then
    name.DataBinding.Field.Value := TransLiterStr(title.Text);
end;

end.
