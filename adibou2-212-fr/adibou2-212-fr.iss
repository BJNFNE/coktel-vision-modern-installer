#define GameName "Adibou 2"
#define GameVersion "2.12"
#define GamePublisher "Coktel Vision"
//#define InstallerName "Install {#GameName}"

[Setup]
; Core Settings
MinVersion=6.0
AppId={#GameName}
AppName={#GameName}
AppVerName={#GameVersion}
AppCopyright=1999 {#GamePublisher}

; Uninstallation Settings
UninstallFilesDir={app}
UninstallDisplayIcon=
CreateUninstallRegKey=yes
UninstallDisplayName={#GameName}

; Binary Output Settings
OutputDir=.
OutputBaseFilename=adibou2-212-fr

; Misc Settings
DisableWelcomePage=no
DisableDirPage=no
DisableProgramGroupPage=yes
WizardImageFile=
SetupIconFile=

DefaultDirName=/coktel/Adibou2
DefaultGroupName=COKTEL

[Languages]
Name: "French"; MessagesFile: "compiler:Default.isl"

[Messages]
; Override WelcomeLabel2 as the default string is awkward in this scenario
French.WelcomeLabel2=Das Setup installiert {#GameName} {#GameVersion} auf dem PC.

[Files]
Source: "{code:GetSourceDrive}ENVIR\*"; DestDir: "{app}\ENVIR"; Flags: external
Source: "{code:GetSourceDrive}*"; DestDir: "{app}"; Flags: external

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
