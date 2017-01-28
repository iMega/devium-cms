{----------------------------------------------------------------------

   DEVIUM Content Management System
   Copyright (C) 2004 by DEIV Development Team.
   http://www.deiv.com/

   $Header: /devium/Devium\040CMS\0402/Source/PhotoGallery/pgAlbumForm.pas,v 1.1 2004/05/06 07:15:42 paladin Exp $

------------------------------------------------------------------------}
unit pgAlbumForm;

interface

uses
  Forms, cxLookAndFeelPainters, Classes, ActnList, cxDropDownEdit,
  cxCalendar, cxCheckBox, cxMemo, cxMaskEdit, cxControls, cxContainer,
  cxEdit, cxTextEdit, StdCtrls, cxButtons, Controls, ExtCtrls,
  Graphics, cxDBEdit;

type
  TAlbumForm = class(TForm)
    Panel2: TPanel;
    ActionList: TActionList;
    ActionOK: TAction;
    OK: TcxButton;
    Cancel: TcxButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    Label4: TLabel;
    title: TcxDBTextEdit;
    name: TcxDBMaskEdit;
    text: TcxDBMemo;
    last_update: TcxDBDateEdit;
    is_visible: TcxDBCheckBox;
    procedure ActionOKExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  end;

function GetAlbumForm: Integer;

implementation

uses pgDataModule, DB;

{$R *.dfm}

function GetAlbumForm;
var
  Form: TAlbumForm;
begin
  Form := TAlbumForm.Create(Application);
  try
    Result := Form.ShowModal;
  finally
    Form.Free;
  end;
end;

{ TImageForm }

procedure TAlbumForm.ActionOKExecute(Sender: TObject);
begin
  Ok.SetFocus;
  ModalResult := mrOK;
end;

procedure TAlbumForm.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TcxDBTextEdit then
      TcxDBTextEdit(Components[i]).DataBinding.DataSource := DM.dsAlbums;
    if Components[i] is TcxDBMaskEdit then
      TcxDBMaskEdit(Components[i]).DataBinding.DataSource := DM.dsAlbums;
    if Components[i] is TcxDBMemo then
      TcxDBMemo(Components[i]).DataBinding.DataSource := DM.dsAlbums;
    if Components[i] is TcxDBDateEdit then
      TcxDBDateEdit(Components[i]).DataBinding.DataSource := DM.dsAlbums;
    if Components[i] is TcxDBCheckBox then
      TcxDBCheckBox(Components[i]).DataBinding.DataSource := DM.dsAlbums;
  end;
end;

end.
