#define GameName "Adiboo 3"
#define GameVersion "3.00"
#define GamePublisher "Coktel Vision"
//#define InstallerName "Install {#GameName}"

[Setup]
; Core Settings
MinVersion=6.0
AppId={#GameName}
AppName={#GameName}
AppVerName={#GameVersion}
AppCopyright=2002 {#GamePublisher}

; Uninstallation Settings
UninstallFilesDir={app}
UninstallDisplayIcon=
CreateUninstallRegKey=yes
UninstallDisplayName={#GameName}

; Binary Output Settings
OutputDir=.
OutputBaseFilename=adibou3-300-de

; Misc Settings
DisableWelcomePage=no
DisableDirPage=no
DisableProgramGroupPage=yes
WizardImageFile=
SetupIconFile=

DefaultDirName=/coktel/Adiboo3
DefaultGroupName=COKTEL

[Languages]
Name: "German"; MessagesFile: "compiler:Default.isl"

[Messages]
; Override WelcomeLabel2 as the default string is awkward in this scenario
German.WelcomeLabel2=Das Setup installiert {#GameName} {#GameVersion} auf dem PC.

[Files]
Source: "{code:GetSourceDrive}datas\*"; DestDir: "{app}\datas"; Flags: external
Source: "{code:GetSourceDrive}*"; DestDir: "{app}"; Flags: external
Source: "{code:GetSourceDrive}\autorun\*"; Excludes: "*"; DestDir:"{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
//Source: "\"; Excludes: "ADI1.TTF"; DestDir:"{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
//Source: "DemoEducation.com\"; Excludes: "*.*"; DestDir:"{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Code]

#include "finddisc.pas"

var
	SourceDrive: string;

function GetSourceDrive(Param: String): String;
begin
	Result:=SourceDrive;
end;

procedure InitializeWizard();
begin
  WizardForm.WizardSmallBitmapImage.Visible := False;
	SourceDrive:=GetSourceCDDrive();
end;