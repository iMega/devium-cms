unit artArticle;

interface

uses
  Forms, PluginManagerIntf, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxEdit, DB, cxDBData, cxDBEdit, Menus,
  TB2Item, Dialogs, ExtDlgs, Classes, ActnList, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, TB2Dock, TB2Toolbar, cxCheckBox,
  cxDropDownEdit, cxCalendar, cxMemo, cxMaskEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxContainer, cxTextEdit, StdCtrls,
  cxButtons, Controls, ExtCtrls;

type
  TArticleForm = class(TForm)
    Panel1: TPanel;
    OK: TcxButton;
    Cancel: TcxButton;
    title: TcxDBTextEdit;
    category_id: TcxDBLookupComboBox;
    announcement: TcxDBMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    date: TcxDBDateEdit;
    Label4: TLabel;
    is_visible: TcxDBCheckBox;
    Panel2: TPanel;
    TBToolbar1: TTBToolbar;
    ActionList: TActionList;
    ItemNew: TAction;
    ItemCopy: TAction;
    ItemEdit: TAction;
    ItemDelete: TAction;
    ItemUp: TAction;
    ItemDown: TAction;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem7: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    Label6: TLabel;
    ImgLoad: TAction;
    ImgClear: TAction;
    AutoAnons: TAction;
    GridT1: TcxGridDBTableView;
    GridL1: TcxGridLevel;
    Grid: TcxGrid;
    GridT1title: TcxGridDBColumn;
    OpenPicture: TOpenPictureDialog;
    TBPopupMenu: TTBPopupMenu;
    TBItem1: TTBItem;
    TBItem8: TTBItem;
    TBItem9: TTBItem;
    TBItem10: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBItem14: TTBItem;
    ItemRename: TAction;
    TBItem15: TTBItem;
    TBItem16: TTBItem;
    TBSeparatorItem4: TTBSeparatorItem;
    Label7: TLabel;
    name: TcxDBMaskEdit;
    ReSetName: TcxButton;
    Label5: TLabel;
    author: TcxDBTextEdit;
    GridT1is_visible: TcxGridDBColumn;
    procedure ItemNewExecute(Sender: TObject);
    procedure ItemDeleteExecute(Sender: TObject);
    procedure ItemUpExecute(Sender: TObject);
    procedure ItemDownExecute(Sender: TObject);
    procedure ItemCopyExecute(Sender: TObject);
    procedure OKClick(Sender: TObject);
    procedure ItemCopyUpdate(Sender: TObject);
    procedure ItemRenameExecute(Sender: TObject);
    procedure GridT1DblClick(Sender: TObject);
    procedure titlePropertiesEditValueChanged(Sender: TObject);
    procedure ReSetNameClick(Sender: TObject);
    procedure ItemEditExecute(Sender: TObject);
  private
    FPluginManager: IPluginManager;
  public
    property PluginManager: IPluginManager read FPluginManager write FPluginManager;
  end;

function GetArticleForm(const APluginManager: IPluginManager): Integer;

implementation

uses artDataModule, artMainFrm, HTMLEditorIntf, SysUtils,
  artPageNameEditFrm, DeviumLib;

{$R *.dfm}

function GetArticleForm;
var
  Form: TArticleForm;
begin
  Form := TArticleForm.Create(Application);
  try
    Form.PluginManager := APluginManager;
    Result := Form.ShowModal;
  finally
    Form.Free;
  end;
end;

procedure TArticleForm.ItemNewExecute(Sender: TObject);
var
  Sort: Integer;
begin
  with DM.Pages do
  begin
    Sort := DM.GetNextSortOrder(DM.Pages, 'sort_order');
    Append;
    FieldValues['title'] := 'РќРѕРІР°СЏ СЃС‚СЂР°РЅРёС†Р°';
    FieldValues['name'] := TransLiterStr(FieldValues['title']);
    FieldValues['is_visible'] := 1;
    FieldValues['sort_order'] := Sort;
    Post;
  end;
end;

procedure TArticleForm.ItemDeleteExecute(Sender: TObject);
begin
  Dm.Pages.Delete;
end;

procedure TArticleForm.ItemUpExecute(Sender: TObject);
begin
  Dm.ReSort(Dm.Pages, 'sort_order', -15);
end;

procedure TArticleForm.ItemDownExecute(Sender: TObject);
begin
  Dm.ReSort(Dm.Pages, 'sort_order', 15);
end;

procedure TArticleForm.ItemCopyExecute(Sender: TObject);
var
  Sort: Integer;
  Title, Text: String;
begin
  with DM.Pages do
  begin
    Sort := DM.GetNextSortOrder(DM.Pages, 'sort_order');
    Title := FieldValues['title'];
    Text := FieldValues['text'];
    Append;
    FieldValues['title'] := Title + ' (РљРѕРїРёСЏ)';
    FieldValues['name'] := TransLiterStr(FieldValues['title']);
    FieldValues['sort_order'] := Sort;
    FieldValues['text'] := text;
    Post;
  end;
end;

procedure TArticleForm.OKClick(Sender: TObject);
begin
  OK.SetFocus;
  ModalResult := mrOK;
end;

procedure TArticleForm.ItemCopyUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := DM.Pages.RecordCount > 0;
end;

procedure TArticleForm.ItemRenameExecute(Sender: TObject);
begin
  with DM.Pages do
  begin
    Edit;
    if GetPageNameEditForm = mrOK then
      Post
    else
      Cancel;
  end;
end;

procedure TArticleForm.GridT1DblClick(Sender: TObject);
begin
  ItemEdit.Execute;
end;

procedure TArticleForm.titlePropertiesEditValueChanged(Sender: TObject);
begin
  if Length(name.Text) = 0 then
    ReSetNameClick(nil);
end;

procedure TArticleForm.ReSetNameClick(Sender: TObject);
begin
  name.DataBinding.Field.Value := TransLiterStr(Trim(title.Text));
end;

procedure TArticleForm.ItemEditExecute(Sender: TObject);
var
  Editor: IHTMLEditor;
  s: String;
begin
  if not FPluginManager.GetPlugin(IHTMLEditor, Editor) then Exit;
  with DM.Pages, DM do
  begin
    s := FieldValues['text'];
    Editor.LocalPath := GetLocalPath(DM.Pages);
    Editor.RemotePath := GetRemotePath(Editor.LocalPath);
    if Editor.Execute(s) then
    begin
      Edit;
      FieldValues['text'] := s;
      Post;
    end;
  end;
end;

end.
