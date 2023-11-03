#define GameName "Adi Jr."
#define GameVersion "4-7 Jahre"
#define GamePublisher "Coktel Vision"
#define InstallerName "Install {#GameName}"

[Setup]
; Core Settings
MinVersion=6.0
AppId={#GameName}
AppName={#GameName}
AppVerName={#GameVersion}
AppCopyright=1994 {#GamePublisher}

; Uninstallation Settings
UninstallFilesDir={app}
UninstallDisplayIcon=
CreateUninstallRegKey=yes
UninstallDisplayName={#GameName}

; Binary Output Settings
OutputDir=.
OutputBaseFilename=adibou1_de_4_6_years

; Misc Settings
DisableWelcomePage=no
DisableDirPage=no
DisableProgramGroupPage=yes
WizardImageFile=
SetupIconFile=

DefaultDirName=/COKTEL\JUNIOR5
DefaultGroupName=COKTEL

[Languages]
Name: "German"; MessagesFile: "compiler:Default.isl"

[Messages]
; Override WelcomeLabel2 as the default string is awkward in this scenario
German.WelcomeLabel2=Das Setup installiert {#GameName} {#GameVersion} auf dem PC.

[Files]
Source: "{code:GetSourceDrive}DEMO\*"; DestDir: "{app}\DEMO"; Flags: external
Source: "{code:GetSourceDrive}BOUALL.ITK"; DestDir: "{app}"; Flags: external
Source: "{code:GetSourceDrive}C51.STK"; DestDir: "{app}"; Flags: external
Source: "{code:GetSourceDrive}FIVE.ALL"; DestDir: "{app}"; Flags: external
Source: "{code:GetSourceDrive}INTRO.STK"; DestDir: "{app}"; Flags: external
Source: "{code:GetSourceDrive}L51.STK"; DestDir: "{app}"; Flags: external
Source: "{code:GetSourceDrive}MDO.DEF"; DestDir: "{app}"; Flags: external
Source: "{code:GetSourceDrive}SOUNDLIB.DLL"; DestDir: "{app}"; Flags: external
Source: "{code:GetSourceDrive}WLOADER.EXE"; DestDir: "{app}"; Flags: external

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