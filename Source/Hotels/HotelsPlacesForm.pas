unit HotelsPlacesForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxEdit,
  DB, cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ComCtrls, TB2Dock, TB2Toolbar, TB2Item, cxContainer, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, ActnList;

type
  TPlacesForm = class(TForm)
    StatusBar1: TStatusBar;
    GridDBTableView1: TcxGridDBTableView;
    GridLevel1: TcxGridLevel;
    Grid: TcxGrid;
    TBDock1: TTBDock;
    GridDBTableView1country_id: TcxGridDBColumn;
    GridDBTableView1place_type: TcxGridDBColumn;
    GridDBTableView1name: TcxGridDBColumn;
    GridDBTableView1english_name: TcxGridDBColumn;
    ActionList: TActionList;
    Ins: TAction;
    Copy: TAction;
    Edit: TAction;
    Del: TAction;
    ReFrash: TAction;
    TBToolbar2: TTBToolbar;
    TBSubmenuItem1: TTBSubmenuItem;
    TBItem8: TTBItem;
    TBItem7: TTBItem;
    TBItem6: TTBItem;
    TBItem5: TTBItem;
    TBSeparatorItem2: TTBSeparatorItem;
    TBItem9: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBItem4: TTBItem;
    TBItem3: TTBItem;
    TBItem2: TTBItem;
    TBItem1: TTBItem;
    procedure InsExecute(Sender: TObject);
    procedure EditExecute(Sender: TObject);
    procedure GridDBTableView1DblClick(Sender: TObject);
  private
  public
  end;

function GetPlacesForm: Integer;

implementation

uses HotelsMainForm, HotelsDataModule, HotelsPlaceEditForm;

{$R *.dfm}

function GetPlacesForm: Integer;
var
  Form: TPlacesForm;
begin
  Form := TPlacesForm.Create(Application);
  try
    Result := Form.ShowModal;
  finally
    Form.Free;
  end;
end;

procedure TPlacesForm.InsExecute(Sender: TObject);
begin
  with DM.Places do
  begin
    Append;
    if GetPlaceEditForm() = mrOK then
      Post
    else
      Cancel;
  end;
end;

procedure TPlacesForm.EditExecute(Sender: TObject);
begin
  with DM.Places do
  begin
    Edit;
    if GetPlaceEditForm() = mrOK then
      Post
    else
      Cancel;
  end;
end;

procedure TPlacesForm.GridDBTableView1DblClick(Sender: TObject);
begin
  Edit.Execute;
end;

end.
