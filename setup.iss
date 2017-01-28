[Setup]
AppName=Devium CMS
AppVerName=Devium CMS 1.1
AppPublisher=Deiv.com
AppPublisherURL=http://www.deiv.com
AppSupportURL=http://www.deiv.com
AppUpdatesURL=http://www.deiv.com
DefaultDirName={pf}\Devium CMS
DefaultGroupName=Devium CMS
AllowNoIcons=yes
Compression=lzma
;Compression = bzip
;Compression = none
;Compression = lzma/fast
SolidCompression=yes
SourceDir = C:\Program Files\Borland\Delphi7\Projects\Prototips\Devium CMS 2
OutputDir = C:\Program Files\Borland\Delphi7\Projects\Prototips\Devium CMS 2
; Uncomment the following line to disable the "Select Setup Language"
; dialog and have it rely solely on auto-detection.
ShowLanguageDialog=no

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}";

[Files]
Source: "Bin\Devium.exe"; DestDir: "{app}";
Source: "Bin\data\polymed.deiv.com\settings.ini"; DestDir: "{app}\data\polymed.deiv.com";
Source: "Bin\Devium.exe"; DestDir: "{app}";
Source: "Bin\index.htm"; DestDir: "{app}";
Source: "Bin\style.css"; DestDir: "{app}";
Source: "Bin\Devium.chm"; DestDir: "{app}";

; -------------------------------------------------------
; common
Source: "..\..\Bpl\Common.bpl";         DestDir: "{app}";
; bpls
Source: "..\..\bpl\cxEditorsVCLD7.bpl"; DestDir: "{sys}";
Source: "..\..\bpl\cxLibraryVCLD7.bpl"; DestDir: "{sys}";
Source: "C:\WINDOWS\system32\dbrtl70.bpl";              DestDir: "{sys}";
Source: "C:\WINDOWS\system32\dsnap70.bpl";              DestDir: "{sys}";
Source: "..\..\bpl\dxThemeD7.bpl";      DestDir: "{sys}";
Source: "..\..\bpl\Indy70.bpl";         DestDir: "{sys}";
Source: "C:\WINDOWS\system32\inet70.bpl";               DestDir: "{sys}";
Source: "bpl\midas.dll";                DestDir: "{sys}";
Source: "bpl\libgfl201.dll";            DestDir: "{sys}";
Source: "bpl\libgfle201.dll";           DestDir: "{sys}";
Source: "C:\WINDOWS\system32\rtl70.bpl";                DestDir: "{sys}";
Source: "C:\WINDOWS\system32\soaprtl70.bpl";            DestDir: "{sys}";
Source: "C:\WINDOWS\system32\vcl70.bpl";                DestDir: "{app}";
Source: "C:\WINDOWS\system32\xmlrtl70.bpl";             DestDir: "{app}";
; -------------------------------------------------------

; -------------------------------------------------------
; plugins
; -------------------------------------------------------

; -------------------------------------------------------
; HTMLEditor Plugin
; -------------------------------------------------------
Source: "Bin\plugins\devium_HTMLEditor.bpl";  DestDir: "{app}\Plugins";
; bpls
Source: "..\..\bpl\cxDataD7.bpl";             DestDir: "{sys}";
Source: "..\..\bpl\cxEditorsVCLD7.bpl";       DestDir: "{sys}";
Source: "..\..\bpl\cxLibraryVCLD7.bpl";       DestDir: "{sys}";
Source: "C:\WINDOWS\system32\dbrtl70.bpl";                    DestDir: "{sys}";
Source: "C:\WINDOWS\system32\dcctd7rt.bpl";                   DestDir: "{sys}";
Source: "..\..\bpl\dclDHTML_editr.bpl";       DestDir: "{sys}";
Source: "..\..\bpl\dxThemeD7.bpl";            DestDir: "{sys}";
Source: "C:\WINDOWS\system32\vclie70.bpl";                    DestDir: "{sys}";
Source: "..\..\bpl\tb2k_d7.bpl";              DestDir: "{sys}";
Source: "C:\WINDOWS\system32\vcl70.bpl";                      DestDir: "{sys}";
Source: "C:\WINDOWS\system32\vcldb70.bpl";                    DestDir: "{sys}";
; -------------------------------------------------------

; -------------------------------------------------------
; PageManager
; -------------------------------------------------------
Source: "Bin\plugins\devium_PageManger.bpl"; DestDir: "{app}\Plugins"; Flags: ignoreversion
; bpls
Source: "..\..\bpl\cxDataD7.bpl";             DestDir: "{sys}";
Source: "..\..\bpl\cxEditorsVCLD7.bpl";       DestDir: "{sys}";
Source: "..\..\bpl\cxLibraryVCLD7.bpl";       DestDir: "{sys}";
Source: "C:\WINDOWS\system32\dbrtl70.bpl";                    DestDir: "{sys}";
Source: "..\..\bpl\dxThemeD7.bpl";            DestDir: "{sys}";
Source: "C:\WINDOWS\system32\vclie70.bpl";                    DestDir: "{sys}";
Source: "..\..\bpl\tb2k_d7.bpl";              DestDir: "{sys}";
Source: "C:\WINDOWS\system32\vcl70.bpl";                      DestDir: "{sys}";
Source: "C:\WINDOWS\system32\vcldb70.bpl";                    DestDir: "{sys}";
; -------------------------------------------------------

; -------------------------------------------------------
; Products
; -------------------------------------------------------
Source: "Bin\plugins\devium_Product.bpl";     DestDir: "{app}\Plugins"; Flags: ignoreversion
; bpls
Source: "..\..\bpl\cxDataD7.bpl";             DestDir: "{sys}";
Source: "..\..\bpl\cxEditorsVCLD7.bpl";       DestDir: "{sys}";
Source: "..\..\bpl\cxLibraryVCLD7.bpl";       DestDir: "{sys}";
Source: "C:\WINDOWS\system32\dbrtl70.bpl";                    DestDir: "{sys}";
Source: "..\..\bpl\dxThemeD7.bpl";            DestDir: "{sys}";
Source: "C:\WINDOWS\system32\vclie70.bpl";                    DestDir: "{sys}";
Source: "..\..\bpl\tb2k_d7.bpl";              DestDir: "{sys}";
Source: "C:\WINDOWS\system32\vcl70.bpl";                      DestDir: "{sys}";
Source: "C:\WINDOWS\system32\vcldb70.bpl";                    DestDir: "{sys}";
Source: "..\..\bpl\cxGridVCLD7.bpl";          DestDir: "{sys}";
Source: "..\..\bpl\QExport3RT_D7.bpl";        DestDir: "{sys}";
Source: "..\..\bpl\dxmdsD7.bpl";              DestDir: "{sys}";
Source: "..\..\bpl\dxtrmdD7.bpl";             DestDir: "{sys}";
Source: "..\..\bpl\cxExportVCLD7.bpl";        DestDir: "{sys}";
Source: "..\..\bpl\dxEdtrD7.bpl";             DestDir: "{sys}";
Source: "..\..\bpl\dxInsD7.bpl";              DestDir: "{sys}";
Source: "C:\WINDOWS\system32\vclx70.bpl";                     DestDir: "{app}";
; -------------------------------------------------------

; -------------------------------------------------------
; News
; -------------------------------------------------------
Source: "Bin\plugins\devium_News.bpl";     DestDir: "{app}\Plugins"; Flags: ignoreversion

; -------------------------------------------------------
; GuestBook
; -------------------------------------------------------
Source: "Bin\plugins\devium_GuestBook.bpl";     DestDir: "{app}\Plugins"; Flags: ignoreversion

; -------------------------------------------------------
; Articles
; -------------------------------------------------------
Source: "Bin\plugins\devium_Articles.bpl";     DestDir: "{app}\Plugins"; Flags: ignoreversion

; -------------------------------------------------------
; ImageEditor
; -------------------------------------------------------
Source: "Bin\plugins\devium_ImageEditor.bpl";     DestDir: "{app}\Plugins"; Flags: ignoreversion
; bpls
Source: "C:\WINDOWS\system32\Rz30Ctls70.bpl";              DestDir: "{sys}";

[INI]
Filename: "{app}\Devium.url"; Section: "InternetShortcut"; Key: "URL"; String: "http://www.deiv.com"

[Icons]
Name: "{group}\Devium CMS"; Filename: "{app}\Devium.exe"; WorkingDir: "{app}"
Name: "{group}\{cm:ProgramOnTheWeb,Devium CMS}"; Filename: "{sys}\Devium.url"
Name: "{group}\{cm:UninstallProgram,Devium CMS}"; Filename: "{uninstallexe}"
Name: "{userdesktop}\Devium CMS"; Filename: "{app}\Devium.exe"; Tasks: desktopicon

[Run]
Filename: "{app}\Devium.exe"; Description: "{cm:LaunchProgram,Devium CMS}"; Flags: nowait postinstall skipifsilent

[UninstallDelete]
Type: files; Name: "{app}\Devium.url"

[Languages]
Name: en; MessagesFile: "compiler:Default.isl"
Name: ru; MessagesFile: "compiler:Languages\Russian.isl"

