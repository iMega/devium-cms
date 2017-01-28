unit pgPhotosForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxEdit,
  DB, cxDBData, ComCtrls, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid;

type
  TPhotosForm = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    StatusBar: TStatusBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function GetPhotosForm: Integer;

implementation

uses pgDataModule;

{$R *.dfm}

function GetPhotosForm;
var
  Form: TPhotosForm;
begin
  Form := TPhotosForm.Create(Application);
  try
    Result := Form.ShowModal;
  finally
    Form.Free;
  end;
end;

end.
