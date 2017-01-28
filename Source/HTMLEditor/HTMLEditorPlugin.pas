unit HTMLEditorPlugin;

interface

uses
  PluginManagerIntf, PluginIntf, HTMLEditorIntf, DHTMLFrm, Classes;
  
type
  THTMLEditorPlugin = class (TPlugin, IPlugin, IHTMLEditor)
  private
    Form: TDHTMLForm;
    FLocalPath: String;
    FRemotePath: String;
    FFilesList: TStringList;
    function GetLocalPath: String;
    function GetRemotePath: String;
    procedure SetLocalPath(const Value: String);
    procedure SetRemotePath(const Value: String);
    function GetFilesList: TStringList;
    procedure SetFilesList(const Value: TStringList);
  public
    function GetName: string;
    function Load: Boolean;
    function UnLoad: Boolean;
    { IHTMLEditor }
    function Execute(var Text: String): Boolean;
    property LocalPath: String read GetLocalPath write SetLocalPath;
    property RemotePath: String read GetRemotePath write SetRemotePath;
    property FilesList: TStringList read GetFilesList write SetFilesList;
  end;

function RegisterPlugin(Module: HMODULE; PluginManager: IPluginManager): Boolean;

exports RegisterPlugin;
  
implementation

uses Windows;

function RegisterPlugin(Module: HMODULE; PluginManager: IPluginManager): Boolean;
var
  Plugin: IInterface;
begin
  Plugin := THTMLEditorPlugin.Create(Module, PluginManager);
  Result := PluginManager.RegisterPlugin(Plugin);
end;

{ THTMLEditorPlugin }

function THTMLEditorPlugin.Execute(var Text: String): Boolean;
begin
  if not Assigned(Form) then
    Form := TDHTMLForm.Create(nil);

  Form.LocalPath := FLocalPath;
  Form.RemotePath := FRemotePath;
  Form.FilesList := FFilesList;
  Form.Text := Text;
  Form.ReplacePath;
  Form.PluginManager := FPluginManager;
  Result := Form.ShowModal = idOK;
  if Result then
  begin
    Form.ReplaceAndSaveImages;
    Text := Form.Text;
  end;
end;

function THTMLEditorPlugin.GetFilesList: TStringList;
begin
  Result := FFilesList;
end;

function THTMLEditorPlugin.GetLocalPath: String;
begin
  Result := FLocalPath;
end;

function THTMLEditorPlugin.GetName: string;
begin
  Result := 'HTMLEditorPlugin';
end;

function THTMLEditorPlugin.GetRemotePath: String;
begin
  Result := FRemotePath;
end;

function THTMLEditorPlugin.Load: Boolean;
begin
  Result := True;
  Form := TDHTMLForm.Create(nil);
end;

procedure THTMLEditorPlugin.SetFilesList(const Value: TStringList);
begin
  FFilesList := Value;
end;

procedure THTMLEditorPlugin.SetLocalPath(const Value: String);
begin
  FLocalPath := Value;
end;

procedure THTMLEditorPlugin.SetRemotePath(const Value: String);
begin
  FRemotePath := Value;
end;

function THTMLEditorPlugin.UnLoad: Boolean;
begin
  Result := True;
  if Assigned(Form) then Form.Free;
end;

end.
