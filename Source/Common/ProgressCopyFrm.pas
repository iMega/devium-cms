{----------------------------------------------------------------------

   DEVIUM Content Management System
   Copyright (C) 2004 by DEIV Development Team.
   http://www.deiv.com/

   $Header: /devium/Devium\040CMS\0402/Source/Common/ProgressCopyFrm.pas,v 1.6 2004/05/14 09:38:10 paladin Exp $

------------------------------------------------------------------------}
unit ProgressCopyFrm;

interface

uses
  Forms, cxLookAndFeelPainters, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, IdBaseComponent, IdAntiFreezeBase, IdAntiFreeze, ComCtrls,
  Controls, StdCtrls, cxButtons, Classes, FilesLib, IdLogFile, IdIntercept,
  IdLogBase, IdLogEvent;

type
  TProgressCopyForm = class(TForm)
    AntiFreeze: TIdAntiFreeze;
    Cancel: TcxButton;
    pbCurrent: TProgressBar;
    Animate: TAnimate;
    pbMain: TProgressBar;
    Label1: TLabel;
    lbAction: TLabel;
    HTTP: TIdHTTP;
    IdLogFile: TIdLogFile;
    procedure HTTPWorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure HTTPWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure HTTPWork(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure CancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FFilses: TFiles;
    { Private declarations }
    procedure PostFiles(const RemotePath, LocalPath: String);
    procedure DeleteFile(const RemotePath: String);
    procedure DeleteDir(const RemotePath: String);
  public
    { Public declarations }
    procedure Execute;
    property Filses: TFiles read FFilses write FFilses;
  end;

function GetProgressCopyForm(Filses: TFiles): Integer;

implementation

{$R *.dfm}

uses IdMultipartFormData, IdGlobal, SysUtils, DeviumLib;

function GetProgressCopyForm;
var
  Form: TProgressCopyForm;
begin
  Form := TProgressCopyForm.Create(Application);
  try
    Form.Filses := Filses;
    Form.Show;
    Form.Update;
    Form.Execute;
    Result := Form.ModalResult;
  finally
    Form.Free;
  end;
end;

{ TProgressCopyForm }

procedure TProgressCopyForm.Execute;
var
  i: Integer;
begin
  Animate.Active := True;
  pbMain.Position := 0;
  pbMain.Max := FFilses.Count;
  for i := 0 to FFilses.Count - 1 do
  begin
    case FFilses[i].Action of
      POST_FILE: PostFiles(FFilses[i].RemotePath, FFilses[i].LocalPath);
      DELETE_FILE: DeleteFile(FFilses[i].RemotePath);
      DELETE_DIR: DeleteDir(FFilses[i].RemotePath);
    end;
    lbAction.Caption := '';
    pbMain.StepIt;
  end;
  Animate.Active := False;
  ModalResult := mrOK;
end;

procedure TProgressCopyForm.HTTPWorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
  pbCurrent.Max := AWorkCountMax;
  pbCurrent.Position := 0;
end;

procedure TProgressCopyForm.HTTPWorkEnd(Sender: TObject;
  AWorkMode: TWorkMode);
begin
  pbCurrent.Position := pbCurrent.Max;
end;

procedure TProgressCopyForm.HTTPWork(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCount: Integer);
begin
  pbCurrent.Position := AWorkCount;
end;

procedure TProgressCopyForm.CancelClick(Sender: TObject);
begin
  HTTP.Disconnect;
end;

procedure TProgressCopyForm.PostFiles(const RemotePath, LocalPath: String);
var
  FormData, FormData2: TIdMultiPartFormDataStream;
  s: String;
  d: TDateTime;
begin
  /// Р·Р°РєР°С‡РєР°
  if not FileExists(LocalPath) then Exit;

  // Р—Р°РїСЂРѕСЃ РЅР° СЃСЂР°РІРЅРµРЅРёРµ РґР»РёРЅС‹ Рё РІСЂРµРјРµРЅРё
  FormData2 := TIdMultiPartFormDataStream.Create;
  try
    FormData2.AddFormField('action', IntToStr(GET_FILE_INFO));
    FormData2.AddFormField('remote_path', RemotePath);
    d := GetFileCreationTime(LocalPath);
    FormData2.AddFormField('file_datetime', IntToStr(DateTimeToUnixPHP(d)));
    FormData2.AddFormField('file_size', IntToStr(FileSizeByName(LocalPath)));
    lbAction.Caption := Format('Р”РµР№СЃС‚РІРёРµ: РїСЂРѕРІРµСЂРєР°, Р¤Р°Р№Р»: %s',
      [ExtractFileName(LocalPath)]);
    s := HTTP.Post(FFilses.URL, FormData2);
    if AnsiCompareText(s, 'ok') <> 0 then
    begin

      /// Р·Р°РєР°С‡РєР°
      FormData := TIdMultiPartFormDataStream.Create;
      try
        FormData.AddFormField('action', IntToStr(POST_FILE));
        FormData.AddFormField('remote_path', RemotePath);
        FormData.AddFile('file_name', LocalPath,
          GetMIMETypeFromFile(LocalPath));
        d := GetFileCreationTime(LocalPath);
        FormData.AddFormField('file_datetime', IntToStr(DateTimeToUnixPHP(d)));
        lbAction.Caption := Format('Р”РµР№СЃС‚РІРёРµ: РѕС‚РїСЂР°РІРєР°, Р¤Р°Р№Р»: %s',
          [ExtractFileName(LocalPath)]);
        s := HTTP.Post(FFilses.URL, FormData);
      finally
        FormData.Free;
      end;

    end;
  finally
    FormData2.Free;
  end;

end;

procedure TProgressCopyForm.DeleteFile(const RemotePath: String);
var
  url, s: String;
begin
  url := Format('%s?action=%d&file_name=%s', [FFilses.URL, DELETE_FILE, RemotePath]);
  s := HTTP.Get(url);
end;

procedure TProgressCopyForm.DeleteDir(const RemotePath: String);
var
  url, s: String;
begin
  url := Format('%s?action=%d&file_name=%s', [FFilses.URL, DELETE_DIR, RemotePath]);
  s := HTTP.Get(url);
end;

procedure TProgressCopyForm.FormCreate(Sender: TObject);
begin
  IdLogFile.Filename := ExtractFilePath(ParamStr(0)) + IdLogFile.Filename;
  IdLogFile.Active := True;
end;

end.
