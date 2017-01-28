{----------------------------------------------------------------------

   DEVIUM Content Management System
   Copyright (C) 2004 by DEIV Development Team.
   http://www.deiv.com/

   $Header: /devium/Devium\040CMS\0402/Source/ControlPanel/Devium.dpr,v 1.3 2004/05/06 07:13:10 paladin Exp $

------------------------------------------------------------------------}
program Devium;

uses
  Forms,
  cpMainForm in 'cpMainForm.pas' {MainForm},
  PluginManager in 'PluginManager.pas',
  cpSitesForm in 'cpSitesForm.pas' {SitesForm},
  cpSplashFrm in 'cpSplashFrm.pas' {SplashForm},
  cpSitesList in 'cpSitesList.pas',
  cpSettingsForm in 'cpSettingsForm.pas' {SettingsForm},
  SettingsPlugin in 'SettingsPlugin.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Devium';
  SplashForm := TSplashForm.Create(nil);
  SplashForm.Show;
  SplashForm.Update;
  Application.CreateForm(TMainForm, MainForm);
  SplashForm.Hide;
  SplashForm.Free;
  Application.Run;
end.
