unit updates;

interface

uses
  Classes, SysUtils, Dialogs, Forms;

type
  TCheckUpdates = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  public
    UpdatesStyle: integer;
  end;

implementation

uses KSPConstsVars, kspfiles, IniFiles, multilog, main;

procedure TCheckUpdates.Execute;
var
  tmpFolder: string;
  Ini: TIniFile;
  i: integer;
  s1, s2, s3, s4: string;
  s: TStringList;
  CanUpdate: boolean;
  URL: string;
begin
  hLog.Send('Checking for updates');
  tmpFolder:=KSPDataFolder+'temp\';

  GetKSPVersion3(s1, s2, s3, s4);
  s:=TStringList.Create;
  DownloadURLi(KSPUpdates+s4, s);
  s.SaveToFile(KSPDataFolder+'update.ini');
  s.Clear;

  Ini:=TIniFile.Create(KSPDataFolder+'update.ini');
  s:=TStringList.Create;
  Ini.ReadSections(s);
  //ShowMessage(s.Text);
  hLog.Send('Updates list downloaded');

  CanUpdate:=s.Count>1;
  if FileExists(tmpFolder+'setup.exe') then DeleteFile(tmpFolder+'setup.exe');

  if CanUpdate then begin
    URL:=Ini.ReadString(s.Strings[0], 'Path', '');
    CanUpdate:=URL<>'';
    if CanUpdate then begin
      hLog.Send('Downloading file: '+URL);
      if Self.UpdatesStyle>1 then
        CanUpdate:=DownloadFile(URL, tmpFolder+'setup.exe');
    end else hLog.Send('URL is empty');
  end;
  s.Free;
  Ini.Free;

  if CanUpdate then
    Application.QueueAsyncCall(KSPMainWindow.KSPUpdate, Self.UpdatesStyle);
end;

end.

