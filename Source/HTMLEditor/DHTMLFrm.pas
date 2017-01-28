unit DHTMLFrm;

interface

uses
  Forms, Menus, TB2Item, Dialogs, ExtDlgs, TBSkinPlus, dcsystem, dcparser,
  ImgList, Controls, Classes, ActnList, ComCtrls, dccommon, dcmemo,
  OleCtrls, DHTMLEDLib, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, TB2Dock, TB2Toolbar, PluginManagerIntf,
  Types, MSHTML, Windows, ActiveX;

type
  TDHTMLState = (dsEdit, dsSource, dsView);

  TDHTMLForm = class(TForm)
    DockTop: TTBDock;
    DockLeft: TTBDock;
    DockRight: TTBDock;
    DockBottom: TTBDock;
    MainToolBar: TTBToolbar;
    MainMenu: TTBToolbar;
    ActionList: TActionList;
    ImageList: TImageList;
    FileOpen: TAction;
    DHTMLEdit: TDHTMLEdit;
    DCMemo: TDCMemo;
    HTMLParser: THTMLParser;
    EditMode: TAction;
    SourceMode: TAction;
    ViewMode: TAction;
    StatusBar: TStatusBar;
    FileItem: TTBSubmenuItem;
    EditItem: TTBSubmenuItem;
    TableItem: TTBSubmenuItem;
    StatndartToolbar: TTBToolbar;
    Bold: TAction;
    Italic: TAction;
    UnderLine: TAction;
    TBItem4: TTBItem;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBSeparatorItem2: TTBSeparatorItem;
    TBItem8: TTBItem;
    TBItem9: TTBItem;
    TBItem10: TTBItem;
    AlignLeft: TAction;
    AlignCenter: TAction;
    AlignRight: TAction;
    AlignByWidth: TAction;
    NumberList: TAction;
    OrderList: TAction;
    TBSeparatorItem3: TTBSeparatorItem;
    TBItem11: TTBItem;
    TBItem12: TTBItem;
    InserImage: TAction;
    TBItem13: TTBItem;
    Cut: TAction;
    Copy: TAction;
    Past: TAction;
    TBItem14: TTBItem;
    TBItem15: TTBItem;
    TBItem16: TTBItem;
    TBSeparatorItem4: TTBSeparatorItem;
    ImageProperty: TAction;
    ShowDetails: TAction;
    TBItem17: TTBItem;
    UnDo: TAction;
    ReDo: TAction;
    TBSeparatorItem5: TTBSeparatorItem;
    TBItem18: TTBItem;
    TBItem19: TTBItem;
    InsTable: TAction;
    TBItem20: TTBItem;
    InsCell: TAction;
    TBItem21: TTBItem;
    InsColumn: TAction;
    InsRow: TAction;
    TBItem22: TTBItem;
    TBItem23: TTBItem;
    DelRow: TAction;
    DelCell: TAction;
    DelColumn: TAction;
    TBItem24: TTBItem;
    TBItem25: TTBItem;
    TBItem26: TTBItem;
    MergesCells: TAction;
    SplitsCells: TAction;
    TBItem27: TTBItem;
    TBItem28: TTBItem;
    SaveAndExit: TAction;
    DnotSaveAndExit: TAction;
    TBItem30: TTBItem;
    TBItem31: TTBItem;
    TBItem32: TTBItem;
    TBSkin: TTBSkin;
    TBSubmenuItem1: TTBSubmenuItem;
    TBItem34: TTBItem;
    TBItem7: TTBItem;
    TBItem1: TTBItem;
    CreateLink: TAction;
    TBItem2: TTBItem;
    OpenPictureDialog: TOpenPictureDialog;
    TBItem33: TTBItem;
    TBItem35: TTBItem;
    TBItem36: TTBItem;
    TBItem37: TTBItem;
    TBItem38: TTBItem;
    TBSeparatorItem7: TTBSeparatorItem;
    HrefProperty: TAction;
    PopupMenu: TTBPopupMenu;
    TBItem3: TTBItem;
    TBItem39: TTBItem;
    TBItem40: TTBItem;
    TBSeparatorItem8: TTBSeparatorItem;
    TBItem41: TTBItem;
    TBItem42: TTBItem;
    TableProperty: TAction;
    TBItem43: TTBItem;
    CellProperty: TAction;
    TBItem45: TTBItem;
    OListProperty: TAction;
    TBItem44: TTBItem;
    UListProperty: TAction;
    TBItem46: TTBItem;
    LIProperty: TAction;
    TBItem47: TTBItem;
    TBToolbar1: TTBToolbar;
    TBItem48: TTBItem;
    TBItem49: TTBItem;
    TBItem50: TTBItem;
    TBItem51: TTBItem;
    TBItem52: TTBItem;
    TBItem53: TTBItem;
    TBItem54: TTBItem;
    TBSeparatorItem9: TTBSeparatorItem;
    TBSeparatorItem10: TTBSeparatorItem;
    TBSeparatorItem11: TTBSeparatorItem;
    TBItem55: TTBItem;
    TBItem56: TTBItem;
    TBSeparatorItem12: TTBSeparatorItem;
    TBItem57: TTBItem;
    TBItem58: TTBItem;
    TBSubmenuItem2: TTBSubmenuItem;
    specLineBreak: TAction;
    specNonBreakenSpace: TAction;
    specLeftQuote: TAction;
    specRightQuote: TAction;
    specEmDash: TAction;
    specPound: TAction;
    specEuro: TAction;
    specYen: TAction;
    specCopyright: TAction;
    specTrademark: TAction;
    TBItem59: TTBItem;
    TBItem60: TTBItem;
    TBItem61: TTBItem;
    TBItem62: TTBItem;
    TBItem63: TTBItem;
    TBItem64: TTBItem;
    TBItem65: TTBItem;
    TBItem66: TTBItem;
    TBSeparatorItem13: TTBSeparatorItem;
    TBSeparatorItem14: TTBSeparatorItem;
    TBItem67: TTBItem;
    TBItem68: TTBItem;
    TBItem69: TTBItem;
    specRegisteredTrademark: TAction;
    specDots: TAction;
    TBItem70: TTBItem;
    TBSeparatorItem15: TTBSeparatorItem;
    ShowBorder: TAction;
    TBSeparatorItem16: TTBSeparatorItem;
    TBItem71: TTBItem;
    INDENT: TAction;
    OUTDENT: TAction;
    TBSeparatorItem17: TTBSeparatorItem;
    TBItem72: TTBItem;
    TBItem73: TTBItem;
    ClearStyles: TAction;
    PageLink: TAction;
    Help: TAction;
    EditorPopupMenu: TTBPopupMenu;
    TBItem75: TTBItem;
    TBControlItem2: TTBControlItem;
    HTMLStyles2: TcxComboBox;
    TBItem76: TTBItem;
    TBSeparatorItem20: TTBSeparatorItem;
    TBSeparatorItem6: TTBSeparatorItem;
    LinkBrowser: TTBSubmenuItem;
    procedure FormCreate(Sender: TObject);
    procedure EditModeExecute(Sender: TObject);
    procedure SourceModeExecute(Sender: TObject);
    procedure ViewModeExecute(Sender: TObject);
    procedure BoldExecute(Sender: TObject);
    procedure ItalicExecute(Sender: TObject);
    procedure UnderLineExecute(Sender: TObject);
    procedure BoldUpdate(Sender: TObject);
    procedure ItalicUpdate(Sender: TObject);
    procedure UnderLineUpdate(Sender: TObject);
    procedure AlignLeftExecute(Sender: TObject);
    procedure AlignCenterExecute(Sender: TObject);
    procedure AlignRightExecute(Sender: TObject);
    procedure AlignRightUpdate(Sender: TObject);
    procedure AlignLeftUpdate(Sender: TObject);
    procedure AlignCenterUpdate(Sender: TObject);
    procedure NumberListExecute(Sender: TObject);
    procedure OrderListExecute(Sender: TObject);
    procedure NumberListUpdate(Sender: TObject);
    procedure OrderListUpdate(Sender: TObject);
    procedure InserImageExecute(Sender: TObject);
    procedure CutExecute(Sender: TObject);
    procedure CopyExecute(Sender: TObject);
    procedure PastExecute(Sender: TObject);
    procedure CutUpdate(Sender: TObject);
    procedure PastUpdate(Sender: TObject);
    procedure DHTMLEditShowContextMenu(ASender: TObject; xPos,
      yPos: Integer);
    procedure ImagePropertyExecute(Sender: TObject);
    procedure ShowDetailsExecute(Sender: TObject);
    procedure ShowDetailsUpdate(Sender: TObject);
    procedure InserImageUpdate(Sender: TObject);
    procedure UnDoExecute(Sender: TObject);
    procedure ReDoExecute(Sender: TObject);
    procedure UnDoUpdate(Sender: TObject);
    procedure ReDoUpdate(Sender: TObject);
    procedure InsTableExecute(Sender: TObject);
    procedure InsCellExecute(Sender: TObject);
    procedure InsCellUpdate(Sender: TObject);
    procedure InsColumnExecute(Sender: TObject);
    procedure InsColumnUpdate(Sender: TObject);
    procedure InsRowExecute(Sender: TObject);
    procedure InsRowUpdate(Sender: TObject);
    procedure DelCellExecute(Sender: TObject);
    procedure DelRowExecute(Sender: TObject);
    procedure DelColumnExecute(Sender: TObject);
    procedure DelCellUpdate(Sender: TObject);
    procedure DelRowUpdate(Sender: TObject);
    procedure DelColumnUpdate(Sender: TObject);
    procedure MergesCellsExecute(Sender: TObject);
    procedure MergesCellsUpdate(Sender: TObject);
    procedure SplitsCellsExecute(Sender: TObject);
    procedure SplitsCellsUpdate(Sender: TObject);
    procedure SaveAndExitExecute(Sender: TObject);
    procedure DnotSaveAndExitExecute(Sender: TObject);
    procedure AlignByWidthExecute(Sender: TObject);
    procedure CreateLinkExecute(Sender: TObject);
    procedure AlignByWidthUpdate(Sender: TObject);
    procedure ImagePropertyUpdate(Sender: TObject);
    procedure HrefPropertyExecute(Sender: TObject);
    procedure HrefPropertyUpdate(Sender: TObject);
    procedure TablePropertyExecute(Sender: TObject);
    procedure CellPropertyExecute(Sender: TObject);
    procedure OListPropertyExecute(Sender: TObject);
    procedure UListPropertyExecute(Sender: TObject);
    procedure LIPropertyExecute(Sender: TObject);
    procedure LIPropertyUpdate(Sender: TObject);
    procedure OListPropertyUpdate(Sender: TObject);
    procedure UListPropertyUpdate(Sender: TObject);
    procedure TablePropertyUpdate(Sender: TObject);
    procedure CellPropertyUpdate(Sender: TObject);
    procedure InsTableUpdate(Sender: TObject);
    procedure specLineBreakExecute(Sender: TObject);
    procedure specNonBreakenSpaceExecute(Sender: TObject);
    procedure specLeftQuoteExecute(Sender: TObject);
    procedure specRightQuoteExecute(Sender: TObject);
    procedure specPoundExecute(Sender: TObject);
    procedure specEmDashExecute(Sender: TObject);
    procedure specEuroExecute(Sender: TObject);
    procedure specYenExecute(Sender: TObject);
    procedure specCopyrightExecute(Sender: TObject);
    procedure specRegisteredTrademarkExecute(Sender: TObject);
    procedure specTrademarkExecute(Sender: TObject);
    procedure specDotsExecute(Sender: TObject);
    procedure ShowBorderExecute(Sender: TObject);
    procedure OUTDENTExecute(Sender: TObject);
    procedure INDENTExecute(Sender: TObject);
    procedure OUTDENTUpdate(Sender: TObject);
    procedure INDENTUpdate(Sender: TObject);
    procedure DHTMLEditDocumentComplete(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ClearStylesExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PageLinkExecute(Sender: TObject);
    procedure DHTMLEditonkeypress(Sender: TObject);
    procedure ClearStylesUpdate(Sender: TObject);
    procedure HTMLStyles2Click(Sender: TObject);
  private
    FState: TDHTMLState;
    pt: TPoint;
    FRemotePath: String;
    FLocalPath: String;
    FFilesList: TStringList;
    FStyles: TStringList;
    FModified: Boolean;
    FPluginManager: IPluginManager;
    FLinksList: TInterfaceList;
    procedure SetText(Value: WideString);
    procedure SetState(const Value: TDHTMLState);
    procedure SwitchToEditMode;
    procedure SwitchToSourceMode;
    procedure SwitchToViewMode;
    function GetText: WideString;
    procedure SetEditCommandState(Sender: TObject; cmdID: DHTMLEDITCMDID);
    function GetDOM: IHTMLDocument2;
    procedure InsertSpecialChar(const Text: String);
    procedure SetLocalPath(const Value: String);
    procedure SetRemotePath(const Value: String);
    procedure SetFilesList(const Value: TStringList);
    procedure GetStyles;
    procedure CMDialogKey(var Message: TCMDialogKey); message CM_DIALOGKEY;
    procedure SetPluginManager(const Value: IPluginManager);
    procedure LinkBrowserClick(Sender: TObject);
  protected
    function FormatHTMLDocument(const HTMLDocument: IHTMLDocument2): String;
  public
    property Text: WideString read GetText write SetText;
    property State: TDHTMLState read FState write SetState;
    property DOM: IHTMLDocument2 read GetDOM;
    //
    property LocalPath: String read FLocalPath write SetLocalPath;
    property RemotePath: String read FRemotePath write SetRemotePath;
    procedure ReplaceAndSaveImages;
    procedure ReplacePath;
    property FilesList: TStringList read FFilesList write SetFilesList;
    property Modified: Boolean read FModified write FModified;
    property PluginManager: IPluginManager read FPluginManager write SetPluginManager;
  end;

var
  DHTMLForm: TDHTMLForm;

implementation

{$R *.dfm}

uses Variants, InsertTableFrm, ComObj, SysUtils, Clipbrd,
  ImagePropertyFrm, StrUtils, CellPropertyFrm, OListPropertyFrm,
  UListPropertyFrm, TablePropertyFrm, AlignUtils, LinkBrowserIntf;


{ TDHTMLForm }

procedure TDHTMLForm.SetState(const Value: TDHTMLState);
var
  s: String;
begin
  if FState <> Value then
  begin
    s := Text;
    FState := Value;
    case FState of
      dsEdit: SwitchToEditMode;
      dsSource: SwitchToSourceMode;
      dsView: SwitchToViewMode;
    end;
    Text := s;
  end;
end;

procedure TDHTMLForm.SetText(Value: WideString);
begin
  case FState of
    dsEdit, dsView:
      begin
        DHTMLEdit.DOM.body.innerHTML := Value;
        //DHTMLEdit.DocumentHTML := Value;
      end;
    dsSource: DCMemo.Text := Value;
  end;
end;

procedure TDHTMLForm.FormCreate(Sender: TObject);
var
  s: OleVariant;
begin
  DHTMLEdit.ControlInterface._AddRef;
  FStyles := TStringList.Create;
  DHTMLEdit.Align := alClient;
  DCMemo.Align := alClient;
  State := dsEdit;
  s := ExtractFilePath(ParamStr(0)) + 'index.htm';
  if FileExists(s) then
    DHTMLEdit.LoadDocument(s)
  else
  begin
    DHTMLEdit.DocumentHTML := '<HTML><BODY></BODY></HTML>';
{    MessageBox(Handle, 'Отсутствует таблица стилей. ХТМЛ текст может отображаться некорректно', PChar(Caption),
      MB_OK + MB_ICONINFORMATION);
}
  end;
  FLinksList := TInterfaceList.Create;  
end;

procedure TDHTMLForm.SwitchToEditMode;
begin
  DHTMLEdit.BrowseMode := False;
  DHTMLEdit.Show;
  DCMemo.Hide;
end;

procedure TDHTMLForm.SwitchToSourceMode;
begin
  DHTMLEdit.Hide;
  DCMemo.Show;
end;

procedure TDHTMLForm.SwitchToViewMode;
begin
  DHTMLEdit.Show;
  DHTMLEdit.BrowseMode := True;
  DCMemo.Hide;
end;

procedure TDHTMLForm.EditModeExecute(Sender: TObject);
begin
  State := dsEdit;
end;

procedure TDHTMLForm.SourceModeExecute(Sender: TObject);
begin
  State := dsSource;
end;

procedure TDHTMLForm.ViewModeExecute(Sender: TObject);
begin
  State := dsView;
end;

function TDHTMLForm.GetText: WideString;
begin
  case FState of
    dsEdit, dsView:
      begin
        Result := DHTMLEdit.DOM.body.innerHTML;
      end;
    dsSource: Result := DCMemo.Text;
  end;
end;

procedure TDHTMLForm.BoldExecute(Sender: TObject);
begin
  DHTMLEdit.ExecCommand(DECMD_BOLD, OLECMDEXECOPT_DODEFAULT);
end;

procedure TDHTMLForm.ItalicExecute(Sender: TObject);
begin
  DHTMLEdit.ExecCommand(DECMD_ITALIC, OLECMDEXECOPT_DODEFAULT);
end;

procedure TDHTMLForm.UnderLineExecute(Sender: TObject);
begin
  DHTMLEdit.ExecCommand(DECMD_UNDERLINE, OLECMDEXECOPT_DODEFAULT);
end;

procedure TDHTMLForm.BoldUpdate(Sender: TObject);
begin
  case State of
    dsEdit: SetEditCommandState(Sender, DECMD_BOLD);
    dsSource, dsView: TAction(Sender).Enabled := False;
  end;
end;

procedure TDHTMLForm.ItalicUpdate(Sender: TObject);
begin
  case State of
    dsEdit: SetEditCommandState(Sender, DECMD_ITALIC);
    dsSource, dsView: TAction(Sender).Enabled := False;
  end;
end;

procedure TDHTMLForm.UnderLineUpdate(Sender: TObject);
begin
  case State of
    dsEdit: SetEditCommandState(Sender, DECMD_UNDERLINE);
    dsSource, dsView: TAction(Sender).Enabled := False;
  end;
end;

procedure TDHTMLForm.AlignLeftExecute(Sender: TObject);
begin
  DHTMLEdit.ExecCommand(DECMD_JUSTIFYLEFT, OLECMDEXECOPT_DODEFAULT);
end;

procedure TDHTMLForm.AlignCenterExecute(Sender: TObject);
begin
  DHTMLEdit.ExecCommand(DECMD_JUSTIFYCENTER, OLECMDEXECOPT_DODEFAULT);
end;

procedure TDHTMLForm.AlignRightExecute(Sender: TObject);
begin
  DHTMLEdit.ExecCommand(DECMD_JUSTIFYRIGHT, OLECMDEXECOPT_DODEFAULT);
end;

procedure TDHTMLForm.AlignRightUpdate(Sender: TObject);
begin
  case State of
    dsEdit: SetEditCommandState(Sender, DECMD_JUSTIFYRIGHT);
    dsSource, dsView: TAction(Sender).Enabled := False;
  end;
end;

procedure TDHTMLForm.AlignLeftUpdate(Sender: TObject);
begin
  case State of
    dsEdit: SetEditCommandState(Sender, DECMD_JUSTIFYLEFT);
    dsSource, dsView: TAction(Sender).Enabled := False;
  end;
end;

procedure TDHTMLForm.AlignCenterUpdate(Sender: TObject);
begin
  case State of
    dsEdit: SetEditCommandState(Sender, DECMD_JUSTIFYCENTER);
    dsSource, dsView: TAction(Sender).Enabled := False;
  end;
end;

procedure TDHTMLForm.NumberListExecute(Sender: TObject);
begin
  DHTMLEdit.ExecCommand(DECMD_ORDERLIST, OLECMDEXECOPT_DODEFAULT);
end;

procedure TDHTMLForm.OrderListExecute(Sender: TObject);
begin
  DHTMLEdit.ExecCommand(DECMD_UNORDERLIST, OLECMDEXECOPT_DODEFAULT);
end;

procedure TDHTMLForm.NumberListUpdate(Sender: TObject);
begin
  case State of
    dsEdit: SetEditCommandState(Sender, DECMD_ORDERLIST);
    dsSource, dsView: TAction(Sender).Enabled := False;
  end;
end;

procedure TDHTMLForm.OrderListUpdate(Sender: TObject);
begin
  case State of
    dsEdit: SetEditCommandState(Sender, DECMD_UNORDERLIST);
    dsSource, dsView: TAction(Sender).Enabled := False;
  end;
end;

procedure TDHTMLForm.InserImageExecute(Sender: TObject);
var
  pInVar: OleVariant;
begin
  OpenPictureDialog.DefaultExt := '';
  OpenPictureDialog.Filter :=
    'Все файлы (*.jpg,*.gif,*.png)|*.JPG;*.GIF;*.PNG|' +
    'JPeg (*.jpg)|*.JPG|' +
    'Gif (*.gif)|*.GIF|' +
    'PNG (*.png)|*.PNG';
  if OpenPictureDialog.Execute then
  begin
    pInVar := OpenPictureDialog.FileName;
    DHTMLEdit.ExecCommand(DECMD_IMAGE, OLECMDEXECOPT_DONTPROMPTUSER, pInVar);
    FModified := True;
  end;
end;

procedure TDHTMLForm.CutExecute(Sender: TObject);
begin
  DHTMLEdit.ExecCommand(DECMD_CUT, OLECMDEXECOPT_DODEFAULT);
end;

procedure TDHTMLForm.CopyExecute(Sender: TObject);
begin
  DHTMLEdit.ExecCommand(DECMD_COPY, OLECMDEXECOPT_DODEFAULT);
end;

procedure TDHTMLForm.PastExecute(Sender: TObject);
{var
  Range: IHTMLTxtRange;
  s: String;
}
begin
{  if Clipboard.HasFormat(CF_TEXT) then
  begin
    Range := DHTMLEdit.DOM.selection.createRange as IHTMLTxtRange;
    s := Clipboard.AsText;
    s := DHTMLEdit.FilterSourceCode(s);
    Range.pasteHTML(s);
  end;
}
  DHTMLEdit.ExecCommand(DECMD_PASTE, OLECMDEXECOPT_DODEFAULT);  
end;

procedure TDHTMLForm.CutUpdate(Sender: TObject);
begin
  case State of
    dsEdit: SetEditCommandState(Sender, DECMD_CUT);
    dsSource, dsView: TAction(Sender).Enabled := False;
  end;
end;

procedure TDHTMLForm.PastUpdate(Sender: TObject);
begin
  case State of
    dsEdit: SetEditCommandState(Sender, DECMD_PASTE);
    dsSource, dsView: TAction(Sender).Enabled := False;
  end;
end;

procedure TDHTMLForm.SetEditCommandState(Sender: TObject;
  cmdID: DHTMLEDITCMDID);
var
  Status: TOleEnum;
begin
  Status := DHTMLEdit.QueryStatus(cmdID);
  case Status of
    DECMDF_ENABLED:
      begin
        TAction(Sender).Enabled := True;
        TAction(Sender).Checked := False;
      end;
    DECMDF_DISABLED:
      begin
        TAction(Sender).Enabled := False;
        TAction(Sender).Checked := False;
      end;
    DECMDF_LATCHED:
      begin
        TAction(Sender).Checked := True;
        TAction(Sender).Enabled := True;
      end;
  end;
end;

procedure TDHTMLForm.DHTMLEditShowContextMenu(ASender: TObject; xPos,
  yPos: Integer);
var
  ptDown: TPoint;
begin
 	pt := Point(xPos, yPos);
  //ptDown := DHTMLEdit.ClientToScreen(pt);
  ptDown := Mouse.CursorPos;
  PopupMenu.Popup(ptDown.X, ptDown.Y);
end;

procedure TDHTMLForm.ImagePropertyExecute(Sender: TObject);
var
  Selection: IHTMLSelectionObject;
  Range: IDispatch;
  Element: IHTMLElement;
  ImgElement: IHTMLImgElement;
  img: TImgElement;
  ControlRange: IHTMLControlRange;
  AnchorElement: IHTMLAnchorElement;
begin
  Selection := DHTMLEdit.DOM.selection;
  Range := Selection.createRange;

  if Supports(Range, IHTMLControlRange, ControlRange) then
  begin
    Element := ControlRange.commonParentElement;
    ImgElement := Element as IHTMLImgElement;
    img.src := ImgElement.src;
    img.alt := ImgElement.alt;
    img.hspace := ImgElement.hspace;
    img.vspace := ImgElement.vspace;
    img.align := Align2RusAlign(ImgElement.align);
    TryStrToInt(ImgElement.border, img.border);
    img.width := ImgElement.width;
    img.height := ImgElement.height;
    // есть родитель link
    if Assigned(Element.parentElement) and
      Supports(Element.parentElement, IHTMLAnchorElement, AnchorElement) then
        img.href := AnchorElement.href;
  end;


  if GetImagePropertyForm(@img) = mrOK then
  begin
    ImgElement.src := img.src;
    ImgElement.alt := img.alt;
    ImgElement.hspace := img.hspace;
    ImgElement.vspace := img.vspace;
    ImgElement.border := img.border;
    ImgElement.width := img.width;
    ImgElement.height := img.height;
    ImgElement.align := RusAlign2Align(img.align);
    if (Length(img.href) > 0) and
      (not Supports(Element.parentElement, IHTMLAnchorElement)) then
    begin
     // Element.parentElement.
//      DHTMLEdit.ExecCommand(DECMD_HYPERLINK, OLECMDEXECOPT_DONTPROMPTUSER);
//      Element.parentElement
    end;
  end;
  
end;

procedure TDHTMLForm.ShowDetailsExecute(Sender: TObject);
begin
  DHTMLEdit.ShowDetails := not DHTMLEdit.ShowDetails;
end;

procedure TDHTMLForm.ShowDetailsUpdate(Sender: TObject);
begin
  case State of
    dsEdit: TAction(Sender).Enabled := True;
    dsSource, dsView: TAction(Sender).Enabled := False;
  end;
end;

procedure TDHTMLForm.InserImageUpdate(Sender: TObject);
begin
  case State of
    dsEdit: SetEditCommandState(Sender, DECMD_IMAGE);
    dsSource, dsView: TAction(Sender).Enabled := False;
  end;
end;

procedure TDHTMLForm.UnDoExecute(Sender: TObject);
begin
  DHTMLEdit.ExecCommand(DECMD_UNDO, OLECMDEXECOPT_DODEFAULT);
end;

procedure TDHTMLForm.ReDoExecute(Sender: TObject);
begin
  DHTMLEdit.ExecCommand(DECMD_REDO, OLECMDEXECOPT_DODEFAULT);
end;

procedure TDHTMLForm.UnDoUpdate(Sender: TObject);
begin
  case State of
    dsEdit: SetEditCommandState(Sender, DECMD_UNDO);
    dsSource, dsView: TAction(Sender).Enabled := False;
  end;
end;

procedure TDHTMLForm.ReDoUpdate(Sender: TObject);
begin
  case State of
    dsEdit: SetEditCommandState(Sender, DECMD_REDO);
    dsSource, dsView: TAction(Sender).Enabled := False;
  end;
end;

procedure TDHTMLForm.InsTableExecute(Sender: TObject);
var
  insertTableParam: DEInsertTableParam;
  ovInsertTableParam: OleVariant;
  NumRows, NumCols: Integer;
  TableAttrs: String;
begin
  if GetInsertTableForm(NumRows, NumCols, TableAttrs) = mrOK then
  begin
    insertTableParam := CreateComObject(Class_DEInsertTableParam) as IDEInsertTableParam;
    insertTableParam.NumRows := NumRows;
    insertTableParam.NumCols := NumCols;
    insertTableParam.TableAttrs := TableAttrs;
    insertTableParam.CellAttrs := '';
    ovInsertTableParam := OleVariant(insertTableParam);
    DHTMLEdit.ExecCommand(DECMD_INSERTTABLE, OLECMDEXECOPT_DODEFAULT, ovInsertTableParam);
    { TODO -oPaladin : Доделать встаку пробелов(&nbsp;) в новую тавблицу }    
  end;
end;

procedure TDHTMLForm.InsCellExecute(Sender: TObject);
begin
  DHTMLEdit.ExecCommand(DECMD_INSERTCELL, OLECMDEXECOPT_DODEFAULT);
end;

procedure TDHTMLForm.InsCellUpdate(Sender: TObject);
begin
  case State of
    dsEdit: SetEditCommandState(Sender, DECMD_INSERTCELL);
    dsSource, dsView: TAction(Sender).Enabled := False;
  end;
end;

procedure TDHTMLForm.InsColumnExecute(Sender: TObject);
begin
  DHTMLEdit.ExecCommand(DECMD_INSERTCOL, OLECMDEXECOPT_DODEFAULT);
end;

procedure TDHTMLForm.InsColumnUpdate(Sender: TObject);
begin
  case State of
    dsEdit: SetEditCommandState(Sender, DECMD_INSERTCOL);
    dsSource, dsView: TAction(Sender).Enabled := False;
  end;
end;

procedure TDHTMLForm.InsRowExecute(Sender: TObject);
begin
  DHTMLEdit.ExecCommand(DECMD_INSERTROW, OLECMDEXECOPT_DODEFAULT);
end;

procedure TDHTMLForm.InsRowUpdate(Sender: TObject);
begin
  case State of
    dsEdit: SetEditCommandState(Sender, DECMD_INSERTROW);
    dsSource, dsView: TAction(Sender).Enabled := False;
  end;
end;

procedure TDHTMLForm.DelCellExecute(Sender: TObject);
begin
  DHTMLEdit.ExecCommand(DECMD_DELETECELLS, OLECMDEXECOPT_DODEFAULT);
end;

procedure TDHTMLForm.DelRowExecute(Sender: TObject);
begin
  DHTMLEdit.ExecCommand(DECMD_DELETEROWS, OLECMDEXECOPT_DODEFAULT);
end;

procedure TDHTMLForm.DelColumnExecute(Sender: TObject);
begin
  DHTMLEdit.ExecCommand(DECMD_DELETECOLS, OLECMDEXECOPT_DODEFAULT);
end;

procedure TDHTMLForm.DelCellUpdate(Sender: TObject);
begin
  case State of
    dsEdit: SetEditCommandState(Sender, DECMD_DELETECELLS);
    dsSource, dsView: TAction(Sender).Enabled := False;
  end;
end;

procedure TDHTMLForm.DelRowUpdate(Sender: TObject);
begin
  case State of
    dsEdit: SetEditCommandState(Sender, DECMD_DELETEROWS);
    dsSource, dsView: TAction(Sender).Enabled := False;
  end;
end;

procedure TDHTMLForm.DelColumnUpdate(Sender: TObject);
begin
  case State of
    dsEdit: SetEditCommandState(Sender, DECMD_DELETECELLS);
    dsSource, dsView: TAction(Sender).Enabled := False;
  end;
end;

procedure TDHTMLForm.MergesCellsExecute(Sender: TObject);
begin
  DHTMLEdit.ExecCommand(DECMD_MERGECELLS, OLECMDEXECOPT_DODEFAULT);
end;

procedure TDHTMLForm.MergesCellsUpdate(Sender: TObject);
begin
  case State of
    dsEdit: SetEditCommandState(Sender, DECMD_MERGECELLS);
    dsSource, dsView: TAction(Sender).Enabled := False;
  end;
end;

procedure TDHTMLForm.SplitsCellsExecute(Sender: TObject);
begin
  DHTMLEdit.ExecCommand(DECMD_SPLITCELL, OLECMDEXECOPT_DODEFAULT);
end;

procedure TDHTMLForm.SplitsCellsUpdate(Sender: TObject);
begin
  case State of
    dsEdit: SetEditCommandState(Sender, DECMD_SPLITCELL);
    dsSource, dsView: TAction(Sender).Enabled := False;
  end;
end;

procedure TDHTMLForm.SaveAndExitExecute(Sender: TObject);
begin
  FModified := False;
  ModalResult := mrOk;
end;

procedure TDHTMLForm.DnotSaveAndExitExecute(Sender: TObject);
begin
  FModified := False;
  ModalResult := mrCancel;
end;

procedure TDHTMLForm.AlignByWidthExecute(Sender: TObject);
begin
  DHTMLEdit.DOM.execCommand('JustifyFull', True, 0)
end;

procedure TDHTMLForm.CreateLinkExecute(Sender: TObject);
begin
  DHTMLEdit.ExecCommand(DECMD_HYPERLINK, OLECMDEXECOPT_DODEFAULT);
end;

procedure TDHTMLForm.AlignByWidthUpdate(Sender: TObject);
begin
  TAction(Sender).Checked := DHTMLEdit.DOM.queryCommandState('JustifyFull');
end;

procedure TDHTMLForm.ImagePropertyUpdate(Sender: TObject);
var
  Range: IDispatch;
  Selection: IHTMLSelectionObject;
  Element: IHTMLElement;
  ControlRange: IHTMLControlRange;
begin
  TAction(Sender).Visible := False;
  Selection := DHTMLEdit.DOM.selection;
  Range := Selection.createRange;
  if Supports(Range, IHTMLControlRange, ControlRange) then
  begin
    Element := ControlRange.commonParentElement;
    TAction(Sender).Visible := Supports(Element, IHTMLImgElement);
  end;
end;

function TDHTMLForm.FormatHTMLDocument(
  const HTMLDocument: IHTMLDocument2): String;
var
  sl: TStringList;
  Level: Integer;
const
  Indent = ' ';

  procedure Go(const Value: IHTMLElement);
  var
    Collection: IHTMLElementCollection;
    Element: IHTMLElement;
    i: Integer;
  begin
    Collection := Value.children as IHTMLElementCollection;
    Inc(Level);
    for i := 0 to Collection.length - 1 do
    begin
      Element := Collection.item(NULL, i) as IHTMLElement;
      sl.Add(Format('%s<%s>   %s', [StringOfChar(Indent, Level), Element.tagName, Element.outerText]));
      if (Element.children as IHTMLElementCollection).length > 0 then
        Go(Element)
      else
        sl.Add(Format('%s%s',
          [StringOfChar(Indent, Level + 1),
           Element.innerText]));

      sl.Add(Format('%s</%s>',
        [StringOfChar(Indent, Level),
         Element.tagName]));
    end;
    Dec(Level);
  end;

begin
  Level := 0;
  sl := TStringList.Create;
  try
    Go(HTMLDocument.body);
  finally
    Result := sl.Text;
    sl.Free;
  end;
end;

procedure TDHTMLForm.HrefPropertyExecute(Sender: TObject);
begin
  DHTMLEdit.ExecCommand(DECMD_HYPERLINK, OLECMDEXECOPT_DODEFAULT);
end;

procedure TDHTMLForm.HrefPropertyUpdate(Sender: TObject);
var
  Range: IDispatch;
  Selection: IHTMLSelectionObject;
  Element: IHTMLElement;
  TxtRange: IHTMLTxtRange;
begin
  TAction(Sender).Visible := False;
  Selection := DHTMLEdit.DOM.selection;
  Range := Selection.createRange;
  if Supports(Range, IHTMLTxtRange, TxtRange) then
  begin
    Element := TxtRange.parentElement;
    TAction(Sender).Visible := Supports(Element, IHTMLAnchorElement);
  end;
end;

procedure TDHTMLForm.TablePropertyExecute(Sender: TObject);
var
  Element: IHTMLElement;
  Table: IHTMLTable;
begin
  Element := DHTMLEdit.DOM.elementFromPoint(pt.X, pt.Y);

  if Supports(Element, IHTMLTableCell) then
    if Supports(Element.parentElement.parentElement.parentElement, IHTMLTable, Table) then
      GetTablePropertyForm(Table);

  if Supports(Element, IHTMLTable, Table) then
  begin
    GetTablePropertyForm(Table);
  end;
end;

procedure TDHTMLForm.CellPropertyExecute(Sender: TObject);
var
  Element: IHTMLElement;
  Cell: IHTMLTableCell;
begin
  Element := DHTMLEdit.DOM.elementFromPoint(pt.X, pt.Y);
  if Supports(Element, IHTMLTableCell, Cell) then
  begin
    // передача параметров
    if GetCellPropertyForm(Cell) = mrOK then
    begin
    end;
  end;
end;

procedure TDHTMLForm.OListPropertyExecute(Sender: TObject);
var
  Element: IHTMLElement;
  OList: IHTMLOListElement;
  _start: Integer;
  _type: String;
begin
  Element := DHTMLEdit.DOM.elementFromPoint(pt.X, pt.Y);
  if Supports(Element.parentElement, IHTMLOListElement, OList) then
  begin
    // передача параметров
    _start := OList.Start;
    _type := OList.type_;
    if GetOListPropertyForm(_start, _type, False) = mrOk then
    begin
      // сохранение значений
      OList.Start := _start;
      OList.type_ := _type;
    end;
  end;
end;

procedure TDHTMLForm.UListPropertyExecute(Sender: TObject);
var
  Element: IHTMLElement;
  UList: IHTMLUListElement;
  _type: String;
begin
  Element := DHTMLEdit.DOM.elementFromPoint(pt.X, pt.Y);
  if Supports(Element.parentElement, IHTMLUListElement, UList) then
  begin
    // передача параметров
    _type := UList.type_;
    if GetUListPropertyForm( _type, False) = mrOk then
    begin
      // сохранение значений
      UList.type_ := _type;
    end;
  end;
end;

procedure TDHTMLForm.LIPropertyExecute(Sender: TObject);
var
  Element: IHTMLElement;
  LI: IHTMLLIElement ;
  _type: String;
  _value: Integer;
begin
  Element := DHTMLEdit.DOM.elementFromPoint(pt.X, pt.Y);
  if Supports(Element, IHTMLLIElement, LI) then
  begin
    // передача параметров
    _type := LI.type_;
    _value := LI.value;
    
    // определение типа элемента
    // нумерованный список
    if Supports(Element.parentElement, IHTMLOListElement) then
      if GetOListPropertyForm(_value, _type, True) = mrOk then
      begin
        // сохранение значений
        LI.type_ := _type;
        LI.value := _value;
      end;
    // список маркеров
    if Supports(Element.parentElement, IHTMLUListElement) then
      if GetUListPropertyForm(_type, True) = mrOk then
      begin
        // сохранение значений
        LI.type_ := _type;
      end;

  end;
end;

procedure TDHTMLForm.LIPropertyUpdate(Sender: TObject);
var
  Element: IHTMLElement;
begin
  Element := DHTMLEdit.DOM.elementFromPoint(pt.X, pt.Y);
  TAction(Sender).Visible := Supports(Element, IHTMLLIElement);
end;

procedure TDHTMLForm.OListPropertyUpdate(Sender: TObject);
var
  Element: IHTMLElement;
begin
  Element := DHTMLEdit.DOM.elementFromPoint(pt.X, pt.Y);
  TAction(Sender).Visible := Supports(Element.parentElement, IHTMLOListElement);
end;

procedure TDHTMLForm.UListPropertyUpdate(Sender: TObject);
var
  Element: IHTMLElement;
begin
  Element := DHTMLEdit.DOM.elementFromPoint(pt.X, pt.Y);
  TAction(Sender).Visible := Supports(Element.parentElement, IHTMLUListElement);
end;

procedure TDHTMLForm.TablePropertyUpdate(Sender: TObject);
var
  Element: IHTMLElement;
begin
  Element := DHTMLEdit.DOM.elementFromPoint(pt.X, pt.Y);
  TAction(Sender).Visible := Supports(Element, IHTMLTable);
end;

procedure TDHTMLForm.CellPropertyUpdate(Sender: TObject);
var
  Element: IHTMLElement;
begin
  Element := DHTMLEdit.DOM.elementFromPoint(pt.X, pt.Y);
  TAction(Sender).Visible := Supports(Element, IHTMLTableCell);
end;

procedure TDHTMLForm.InsTableUpdate(Sender: TObject);
begin
  case State of
    dsEdit: SetEditCommandState(Sender, DECMD_INSERTTABLE);
    dsSource, dsView: TAction(Sender).Enabled := False;
  end;
end;

function TDHTMLForm.GetDOM: IHTMLDocument2;
begin
  Result := DHTMLEdit.DOM;
end;

procedure TDHTMLForm.specLineBreakExecute(Sender: TObject);
begin
  InsertSpecialChar('<br>');
end;

procedure TDHTMLForm.InsertSpecialChar(const Text: String);
var
  TxtRange: IHTMLTxtRange;
begin
  TxtRange := DOM.selection.createRange as IHTMLTxtRange;
  TxtRange.pasteHTML(Text);
end;

procedure TDHTMLForm.specNonBreakenSpaceExecute(Sender: TObject);
begin
  InsertSpecialChar('&nbsp;');
end;

procedure TDHTMLForm.specLeftQuoteExecute(Sender: TObject);
begin
  InsertSpecialChar('&laquo;');
end;

procedure TDHTMLForm.specRightQuoteExecute(Sender: TObject);
begin
  InsertSpecialChar('&raquo;');
end;

procedure TDHTMLForm.specPoundExecute(Sender: TObject);
begin
  InsertSpecialChar('&pound;');
end;

procedure TDHTMLForm.specEmDashExecute(Sender: TObject);
begin
  InsertSpecialChar('&#8212;');
end;

procedure TDHTMLForm.specEuroExecute(Sender: TObject);
begin
  InsertSpecialChar('&euro;');
end;

procedure TDHTMLForm.specYenExecute(Sender: TObject);
begin
  InsertSpecialChar('&yen;');
end;

procedure TDHTMLForm.specCopyrightExecute(Sender: TObject);
begin
  InsertSpecialChar('&copy;');
end;

procedure TDHTMLForm.specRegisteredTrademarkExecute(Sender: TObject);
begin
  InsertSpecialChar('&reg;');
end;

procedure TDHTMLForm.specTrademarkExecute(Sender: TObject);
begin
  InsertSpecialChar('&#8482;');
end;

procedure TDHTMLForm.specDotsExecute(Sender: TObject);
begin
  InsertSpecialChar('&#8230;');
end;

procedure TDHTMLForm.ShowBorderExecute(Sender: TObject);
begin
  DHTMLEdit.ShowBorders := not DHTMLEdit.ShowBorders; 
end;

procedure TDHTMLForm.OUTDENTExecute(Sender: TObject);
begin
  DHTMLEdit.ExecCommand(DECMD_OUTDENT, OLECMDEXECOPT_DODEFAULT);
end;

procedure TDHTMLForm.INDENTExecute(Sender: TObject);
begin
  DHTMLEdit.ExecCommand(DECMD_INDENT, OLECMDEXECOPT_DODEFAULT);
end;

procedure TDHTMLForm.OUTDENTUpdate(Sender: TObject);
begin
  case State of
    dsEdit: SetEditCommandState(Sender, DECMD_OUTDENT);
    dsSource, dsView: TAction(Sender).Enabled := False;
  end;
end;

procedure TDHTMLForm.INDENTUpdate(Sender: TObject);
begin
  case State of
    dsEdit: SetEditCommandState(Sender, DECMD_INDENT);
    dsSource, dsView: TAction(Sender).Enabled := False;
  end;
end;

procedure TDHTMLForm.SetLocalPath(const Value: String);
begin
  FLocalPath := Value;
end;

procedure TDHTMLForm.SetRemotePath(const Value: String);
begin
  FRemotePath := Value;
end;

procedure TDHTMLForm.ReplaceAndSaveImages;
var
  i: Integer;
  img: IHTMLImgElement;
  name, index: OleVariant;
  s, s2: String;
  //sl: TStringList;
  sr: TSearchRec;
  Flag: Boolean;
begin
  if (DOM.images.length > 0) and (not DirectoryExists(FLocalPath)) then
    ForceDirectories(FLocalPath);

  // Цикл по списку файлов в папке
  if FindFirst(FLocalPath + '*.*', faAnyFile, sr) = 0 then
  begin
    repeat
      // Цикл по картинкам проверка что нужно удалить
      Flag := True;
      for i := 0 to DOM.images.length - 1 do
      begin
        name := i;
        index := 0;
        img := DOM.images.item(name, index) as IHTMLImgElement;
        if AnsiCompareText(ExtractFileName(img.src), sr.Name) = 0 then
        begin
          Flag := False;
          Break;
        end;
      end;
      if Flag then
        DeleteFile(FLocalPath + sr.Name);
    until FindNext(sr) <> 0;
    FindClose(sr);
  end;

  for i := 0 to DOM.images.length - 1 do
  begin
    name := i;
    index := 0;
    img := DOM.images.item(name, index) as IHTMLImgElement;
    // составление списка файлов
    if Assigned(FFilesList) then
    begin
      s := ExtractFileName(img.src);
      //sl := TStringList.Create;
      //sl.Add(s);
      //s := FLocalPath + s;
      //sl.Add(IntToStr(FileAge(s)));
      //FFilesList.Add(sl.DelimitedText);
      FFilesList.Add(s);
      //sl.Free;
    end;
    // Удаление такое хрени как 'file://'
    s2 := AnsiReplaceStr(img.src, 'file://', '');
    if Pos(FLocalPath, img.src) = 0 then
    begin
      // файл не лежит в папке
      //попытка скопировать локально
      s := ExtractFileName(s2);
      if CopyFile(PChar(s2), PChar(FLocalPath + s), False) then
        img.src := FRemotePath + s;
    end else
    begin
      // замена локальног пути на WEB
      s2 := AnsiReplaceText(s2, FLocalPath, FRemotePath);
      img.src := s2;
    end;
  end;
end;

procedure TDHTMLForm.SetFilesList(const Value: TStringList);
begin
  FFilesList := Value;
end;

procedure TDHTMLForm.DHTMLEditDocumentComplete(Sender: TObject);
begin
  GetStyles;
  HTMLStyles2.Properties.Items.AddStrings(FStyles);
end;

procedure TDHTMLForm.FormDestroy(Sender: TObject);
begin
  FStyles.Free;
  FLinksList.Free;
end;

procedure TDHTMLForm.GetStyles;
var
  s,v: OLEVariant;
  i: integer;
  FmtNames: TDEGetBlockFmtNamesParam;
begin
  FStyles.Clear;
  FmtNames := TDEGetBlockFmtNamesParam.Create(Application);
  try
    v := FmtNames.DefaultInterface;
    DHTMLEdit.ExecCommand(DECMD_GETBLOCKFMTNAMES,OLECMDEXECOPT_DODEFAULT, v);
    s := v.Names;
    for i := VarArrayLowBound(s, 1) to VarArrayHighBound(s, 1) do
      FStyles.Add(s[i]);
  finally
    FmtNames.Free;
  end;
end;

procedure TDHTMLForm.ClearStylesExecute(Sender: TObject);
var
  DOM: IHTMLDocument2;
  element: OleVariant;
  pvarIndex: OleVariant;
  HTMLElement: IHTMLElement;
  name, s: String;
  MarkupServices: IMarkupServices;
begin
  DOM := DHTMLEdit.DOM;
  Supports(DHTMLEdit.DOM, IMarkupServices, MarkupServices);
  pvarIndex := 0;
  while (pvarIndex < DOM.all.length) do
  begin
    element := DOM.all.item(pvarIndex, pvarIndex);
    if Supports(element, IHTMLElement, HTMLElement) then
    begin
      name := HTMLElement.tagName;
      HTMLElement.removeAttribute('className', 0);
      HTMLElement.removeAttribute('style', 0);
      if (name <> UpperCase(name)) or (AnsiCompareText(name, 'FONT') = 0) or (AnsiCompareText(name, 'SPAN') = 0) then
          MarkupServices.RemoveElement(HTMLElement)
      else
        pvarIndex := pvarIndex + 1;
      if Assigned(HTMLElement.parentElement) then
        if AnsiContainsText(HTMLElement.parentElement.tagName, 'TR') then
        begin
          HTMLElement.innerText := Trim(HTMLElement.innerText);
        end;
    end;
  end;
  s := DHTMLEdit.DOM.body.innerHTML;
  s := AnsiReplaceText(s, '<P>&nbsp;</P></TD>', '&nbsp;</TD>');
  s := AnsiReplaceText(s, '<P>&nbsp;</P>', '<BR>');
  s := AnsiReplaceText(s, '<P', '<DIV');
  s := AnsiReplaceText(s, '</P>', '</DIV>');
  DHTMLEdit.DOM.body.innerHTML := s;
end;

procedure TDHTMLForm.CMDialogKey(var Message: TCMDialogKey);
begin
  with Message do
    if CharCode = VK_ESCAPE then
      ModalResult := mrCancel
    else
      inherited;
end;

procedure TDHTMLForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
  if FModified then
  begin
    i := MessageBox(Handle, 'Хотите сохранить изменения?',
      PChar(Caption), MB_YESNOCANCEL + MB_ICONQUESTION);
    case i of
      IDYES: ModalResult := mrOK;
      IDNO: ModalResult := mrCancel;
      IDCANCEL: Action := caNone;
    end;
  end;
end;

procedure TDHTMLForm.ReplacePath;
var
  s: String;
begin
  s := Text;
  s := AnsiReplaceText(s, FRemotePath, FLocalPath);
  Text := s;
end;

procedure TDHTMLForm.PageLinkExecute(Sender: TObject);
{
var
  Selection: IHTMLSelectionObject;
  SiteTree: ISiteTree;
  Id, PageID: Integer;
  Range: IDispatch;
  TxtRange: IHTMLTxtRange;
  S: string;
}  
begin
{
  if FPluginManager.GetPlugin(ISiteTree, SiteTree) then
  begin
    if SiteTree.GetTree(id, PageId) then
    begin
      Selection := DOM.selection;
      Range := Selection.createRange;
      if Supports(Range, IHTMLTxtRange, TxtRange) then
      begin
        //Element := TxtRange.parentElement;
        s := TxtRange.htmlText;
        s := Format('<a href="index.php?id=%d&pageid=%d">%s</a>',
          [id, PageID, s]);
        TxtRange.pasteHTML(s);
      end;
    end;
  end;
}
end;


procedure TDHTMLForm.SetPluginManager(const Value: IPluginManager);
var
  i, j: Integer;
  LBrowser: ILinkBrowser;
  tb: TTBItem;
begin
  FPluginManager := Value;

  // Поиск плагинов с интрфейсрм ILinkBrowser
  LinkBrowser.Clear;
  j := 0;
  for i := 0 to FPluginManager.Plugins.Count - 1 do
    if Supports(FPluginManager.Plugins[i], ILinkBrowser, LBrowser) then
    begin
      tb := TTBItem.Create(LinkBrowser);
      tb.Tag := 500 + j;
      Inc(j);
      tb.Caption := LBrowser.Name;
      FLinksList.Add(LBrowser);
      tb.OnClick := LinkBrowserClick;
      LinkBrowser.Add(tb);
    end;
end;

procedure TDHTMLForm.DHTMLEditonkeypress(Sender: TObject);
begin
  FModified := True;
end;

procedure TDHTMLForm.ClearStylesUpdate(Sender: TObject);
var
  BlockFormat: OleVariant;
begin
  BlockFormat := DHTMLEdit.ExecCommand(DECMD_GETBLOCKFMT, OLECMDEXECOPT_DODEFAULT);
  HTMLStyles2.Text := BlockFormat;
end;

procedure TDHTMLForm.HTMLStyles2Click(Sender: TObject);
var
  BlockFormat: OleVariant;
begin
  BlockFormat := TcxComboBox(Sender).Text;
  DHTMLEdit.ExecCommand(DECMD_SETBLOCKFMT, OLECMDEXECOPT_DODEFAULT, BlockFormat);
end;

procedure TDHTMLForm.LinkBrowserClick(Sender: TObject);
var
  LinkBrowser: ILinkBrowser;
  Selection: IHTMLSelectionObject;
  Range: IDispatch;
  TxtRange: IHTMLTxtRange;
  S, S2, S3: string;
begin
  //LinkBrowser :=
  LinkBrowser := FLinksList[TTbItem(Sender).Tag - 500] as ILinkBrowser;

  if LinkBrowser.Execute(S) then
  begin
    Selection := DOM.selection;
    Range := Selection.createRange;
    if Supports(Range, IHTMLTxtRange, TxtRange) then
    begin
      //Element := TxtRange.parentElement;
      s2 := TxtRange.htmlText;
      s3 := Format('<a href="%s">%s</a>', [S, S2]);
      TxtRange.pasteHTML(s3);
    end;
  end;
end;

initialization
  OleInitialize(nil);

finalization
  OleUninitialize;

end.
