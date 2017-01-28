[Setup]
AppName=Devium CMS
AppVerName=Devium CMS 1.1
AppPublisher=Deiv.com
AppPublisherURL=http://www.deiv.com
AppSupportURL=http://www.deiv.com
AppUpdatesURL=http://www.deiv.com
DefaultDirName={pf}\Devium CMS
DefaultGroupName=Devium CMS
UninstallDisplayIcon={app}\MyProg.exe
AllowNoIcons=yes
;Compression=lzma
;Compression = bzip
Compression = none
;Compression = lzma/fast
SolidCompression=yes
SourceDir = C:\Program Files\Borland\Delphi7\Projects\Prototips\Devium CMS 2
OutputDir = C:\Program Files\Borland\Delphi7\Projects\Prototips\Devium CMS 2
; Uncomment the following line to disable the "Select Setup Language"
; dialog and have it rely solely on auto-detection.
ShowLanguageDialog=no

[Types]
Name: "full"; Description: "Full installation"
Name: "custom"; Description: "Custom installation"; Flags: iscustom

[Components]
Name: "program"; Description: "ядро"; Types: full custom; Flags: fixed
Name: "help"; Description: "Help File"; Types: full
Name: "plugins"; Description: "Plugins"; Types: full
Name: "plugins\HTMLEditor"; Description: "HTMLEditor Plugin"; Types: full
Name: "plugins\PageManager"; Description: "PageManager Plugin"; Types: full
Name: "plugins\Products"; Description: "Products Plugin"; Types: full

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "Bin\Devium.exe"; DestDir: "{app}";
Source: "Bin\data\astecornici.deiv.com\settings.ini"; DestDir: "{app}\data\astecornici.deiv.com";
Source: "Bin\Devium.exe"; DestDir: "{app}";
Source: "Bin\index.htm"; DestDir: "{app}";
Source: "Bin\style.css"; DestDir: "{app}";
Source: "Bin\Devium.chm"; DestDir: "{app}"; Components: help

; -------------------------------------------------------
; common
Source: "..\..\Bpl\Common.bpl";         DestDir: "{app}";
; bpls
Source: "..\..\bpl\cxEditorsVCLD7.bpl"; DestDir: "{sys}";
Source: "..\..\bpl\cxLibraryVCLD7.bpl"; DestDir: "{sys}";
Source: "bpl\dbrtl70.bpl";              DestDir: "{sys}";
Source: "bpl\dsnap70.bpl";              DestDir: "{sys}";
Source: "..\..\bpl\dxThemeD7.bpl";      DestDir: "{sys}";
Source: "..\..\bpl\Indy70.bpl";         DestDir: "{sys}";
Source: "bpl\inet70.bpl";               DestDir: "{sys}";
Source: "bpl\midas.dll";                DestDir: "{sys}";
Source: "bpl\libgfl201.dll";            DestDir: "{sys}";
Source: "bpl\libgfle201.dll";           DestDir: "{sys}";
Source: "bpl\rtl70.bpl";                DestDir: "{sys}";
Source: "bpl\soaprtl70.bpl";            DestDir: "{sys}";
Source: "bpl\vcl70.bpl";                DestDir: "{app}";
Source: "bpl\xmlrtl70.bpl";             DestDir: "{app}";
; -------------------------------------------------------

; -------------------------------------------------------
; plugins
; -------------------------------------------------------

; -------------------------------------------------------
; HTMLEditor Plugin
; -------------------------------------------------------
Source: "Bin\plugins\devium_HTMLEditor.bpl";  DestDir: "{app}\Plugins"; Components: plugins\HTMLEditor
; bpls
Source: "..\..\bpl\cxDataD7.bpl";             DestDir: "{sys}"; Components: plugins\HTMLEditor
Source: "..\..\bpl\cxEditorsVCLD7.bpl";       DestDir: "{sys}"; Components: plugins\HTMLEditor
Source: "..\..\bpl\cxLibraryVCLD7.bpl";       DestDir: "{sys}"; Components: plugins\HTMLEditor
Source: "bpl\dbrtl70.bpl";                    DestDir: "{sys}"; Components: plugins\HTMLEditor
Source: "bpl\dcctd7rt.bpl";                   DestDir: "{sys}"; Components: plugins\HTMLEditor
Source: "..\..\bpl\dclDHTML_editr.bpl";       DestDir: "{sys}"; Components: plugins\HTMLEditor
Source: "..\..\bpl\dxThemeD7.bpl";            DestDir: "{sys}"; Components: plugins\HTMLEditor
Source: "bpl\libgfl201.dll";                  DestDir: "{sys}"; Components: plugins\HTMLEditor
Source: "bpl\vclie70.bpl";                    DestDir: "{sys}"; Components: plugins\HTMLEditor
Source: "..\..\bpl\tb2k_d7.bpl";              DestDir: "{sys}"; Components: plugins\HTMLEditor
Source: "bpl\vcl70.bpl";                      DestDir: "{sys}"; Components: plugins\HTMLEditor
Source: "bpl\vcldb70.bpl";                    DestDir: "{sys}"; Components: plugins\HTMLEditor
; -------------------------------------------------------

; -------------------------------------------------------
; PageManager Plugin
; -------------------------------------------------------
Source: "Bin\plugins\devium_PageManger.bpl"; DestDir: "{app}\Plugins"; Components: plugins\PageManager
; bpls
Source: "..\..\bpl\cxDataD7.bpl";             DestDir: "{sys}"; Components: plugins\PageManager
Source: "..\..\bpl\cxEditorsVCLD7.bpl";       DestDir: "{sys}"; Components: plugins\PageManager
Source: "..\..\bpl\cxLibraryVCLD7.bpl";       DestDir: "{sys}"; Components: plugins\PageManager
Source: "bpl\dbrtl70.bpl";                    DestDir: "{sys}"; Components: plugins\PageManager
Source: "..\..\bpl\dxThemeD7.bpl";            DestDir: "{sys}"; Components: plugins\PageManager
Source: "bpl\libgfl201.dll";                  DestDir: "{sys}"; Components: plugins\PageManager
Source: "bpl\vclie70.bpl";                    DestDir: "{sys}"; Components: plugins\PageManager
Source: "..\..\bpl\tb2k_d7.bpl";              DestDir: "{sys}"; Components: plugins\PageManager
Source: "bpl\vcl70.bpl";                      DestDir: "{sys}"; Components: plugins\PageManager
Source: "bpl\vcldb70.bpl";                    DestDir: "{sys}"; Components: plugins\PageManager
; -------------------------------------------------------

; -------------------------------------------------------
; Products Plugin
; -------------------------------------------------------
Source: "Bin\plugins\devium_Product.bpl";     DestDir: "{app}\Plugins";

Source: "..\..\bpl\cxDataD7.bpl";             DestDir: "{sys}"; Components: plugins\Products
Source: "..\..\bpl\cxEditorsVCLD7.bpl";       DestDir: "{sys}"; Components: plugins\Products
Source: "..\..\bpl\cxLibraryVCLD7.bpl";       DestDir: "{sys}"; Components: plugins\Products
Source: "bpl\dbrtl70.bpl";                    DestDir: "{sys}"; Components: plugins\Products
Source: "..\..\bpl\dxThemeD7.bpl";            DestDir: "{sys}"; Components: plugins\Products
Source: "bpl\libgfl201.dll";                  DestDir: "{sys}"; Components: plugins\Products
Source: "bpl\vclie70.bpl";                    DestDir: "{sys}"; Components: plugins\Products
Source: "..\..\bpl\tb2k_d7.bpl";              DestDir: "{sys}"; Components: plugins\Products
Source: "bpl\vcl70.bpl";                      DestDir: "{sys}"; Components: plugins\Products
Source: "bpl\vcldb70.bpl";                    DestDir: "{sys}"; Components: plugins\Products
Source: "bpl\vcldb70.bpl";                    DestDir: "{sys}"; Components: plugins\Products
Source: "..\..\bpl\cxGridVCLD7.bpl";          DestDir: "{sys}"; Components: plugins\Products
Source: "..\..\bpl\QExport3RT_D7.bpl";        DestDir: "{sys}"; Components: plugins\Products
Source: "..\..\bpl\dxmdsD7.bpl";              DestDir: "{sys}"; Components: plugins\Products
Source: "..\..\bpl\dxtrmdD7.bpl";             DestDir: "{sys}"; Components: plugins\Products
Source: "..\..\bpl\cxExportVCLD7.bpl";        DestDir: "{sys}"; Components: plugins\Products
Source: "..\..\bpl\dxEdtrD7.bpl";             DestDir: "{sys}"; Components: plugins\Products
Source: "..\..\bpl\dxInsD7.bpl";              DestDir: "{sys}"; Components: plugins\Products
Source: "bpl\vclx70.bpl";                     DestDir: "{app}"; Components: plugins\Products
; -------------------------------------------------------

[INI]
Filename: "{app}\Devium.url"; Section: "InternetShortcut"; Key: "URL"; String: "http://www.deiv.com"

[Icons]
Name: "{group}\Devium CMS"; Filename: "{app}\Devium.exe"
Name: "{group}\{cm:ProgramOnTheWeb,Devium CMS}"; Filename: "{app}\Devium.url"
Name: "{group}\{cm:UninstallProgram,Devium CMS}"; Filename: "{uninstallexe}"
Name: "{userdesktop}\Devium CMS"; Filename: "{app}\Devium.exe"; Tasks: desktopicon

[Run]
Filename: "{app}\Devium.exe"; Description: "{cm:LaunchProgram,Devium CMS}"; Flags: nowait postinstall skipifsilent

[UninstallDelete]
Type: files; Name: "{app}\Devium.url"

[Languages]
Name: en; MessagesFile: "compiler:Default.isl"
Name: ru; MessagesFile: "compiler:Languages\Russian.isl"

