{----------------------------------------------------------------------

   DEVIUM Content Management System
   Copyright (C) 2004 by DEIV Development Team.
   http://www.deiv.com/

   $Header: /devium/Devium\040CMS\0402/Source/ControlPanel/cpSettingsForm.pas,v 1.2 2004/04/06 09:29:07 paladin Exp $

------------------------------------------------------------------------}
unit cpSettingsForm;

interface

uses
  Forms, cxLookAndFeelPainters, cxCheckBox, cxControls, cxContainer,
  cxEdit, cxTextEdit, Controls, ExtCtrls, StdCtrls, cxButtons, Classes,
  PluginManagerIntf;

type
  TSettingsForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    HttpProxy_label: TLabel;
    HttpProxyLogin_label: TLabel;
    OK: TcxButton;
    Cancel: TcxButton;
    Panel2: TPanel;
    HttpRoot: TcxTextEdit;
    DataBasePrefix: TcxTextEdit;
    HttpProxy: TcxTextEdit;
    HttpProxyLogin: TcxTextEdit;
    HttpProxyPass: TcxTextEdit;
    UseHttpProxy: TcxCheckBox;
    Panel3: TPanel;
    Panel1: TPanel;
    Label3: TLabel;
    HttpLogin: TcxTextEdit;
    HttpPass: TcxTextEdit;
  private
    FPluginManager: IPluginManager;
    procedure SetPluginManager(const Value: IPluginManager);
  public
    procedure Load;
    procedure Save;
    property PluginManager: IPluginManager read FPluginManager write SetPluginManager;
  end;

function GetSettingsForm(PluginManager: IPluginManager): Integer;

implementation

uses SettingsIntf;

{$R *.dfm}

function GetSettingsForm;
var
  Form: TSettingsForm;
begin
  Form := TSettingsForm.Create(Application);
  try
    Form.PluginManager := PluginManager;
    Form.Load;
    Result := Form.ShowModal;
    if Result = mrOK then
      Form.Save;
  finally
    Form.Free;
  end;
end;

{ TSettingsForm }

procedure TSettingsForm.Load;
var
  Settings: ISettings;
begin
  if FPluginManager.GetPlugin(ISettings, Settings) then
  begin
    HttpRoot.Text           := Settings.HttpRoot;
    DataBasePrefix.Text     := Settings.DataBasePrefix;
    HttpLogin.Text          := Settings.HttpLogin;
    HttpPass.Text           := Settings.HttpPass;
  end;
end;

procedure TSettingsForm.Save;
var
  Settings: ISettings;
begin
  if FPluginManager.GetPlugin(ISettings, Settings) then
  begin
    Settings.HttpRoot         := HttpRoot.Text;
    Settings.DataBasePrefix   := DataBasePrefix.Text;
    Settings.HttpLogin        := HttpLogin.Text;
    Settings.HttpPass         := HttpPass.Text;
  end;
end;

procedure TSettingsForm.SetPluginManager(const Value: IPluginManager);
begin
  FPluginManager := Value;
end;

end.
