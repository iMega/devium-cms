unit DHTMLFrm;

interface

uses
  Forms, Menus, TB2Item, Dialogs, ExtDlgs, TBSkinPlus, ImgList, Controls,
  Classes, ActnList, ComCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, TB2Dock, TB2Toolbar;

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
    TBItem29: TTBItem;
    Help: TAction;
    EditorPopupMenu: TTBPopupMenu;
    TBItem75: TTBItem;
    TBControlItem2: TTBControlItem;
    HTMLStyles2: TcxComboBox;
    TBItem76: TTBItem;
    TBSeparatorItem20: TTBSeparatorItem;
    TBSeparatorItem6: TTBSeparatorItem;
  private
    FPluginManager: IPluginManager;
  public
    property PluginManager: IPluginManager read FPluginManager write FPluginManager;
  end;

var
  DHTMLForm: TDHTMLForm;

implementation

{$R *.dfm}


end.
