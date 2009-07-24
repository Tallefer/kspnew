unit kspfiles;

interface

uses ID3Mgmnt, Classes,
{$IFNDEF KSP_PLUGINS}
  FileSupportLst,
{$ENDIF}
  KSPMessages, WinInet;

function ProduceFormatedString(Input: ShortString; Tag: TID3Tag; LengthVal: Cardinal;
  PlsIndex: integer): ShortString; external 'kspfiles.dll';
{$IFNDEF KSP_PLUGINS}
procedure SearchFiles(var FilesNo: integer; Path: PChar; Rec: boolean; var s: TStringList; FileSL: TFileSupportList); external 'kspfiles.dll';
{$ENDIF}
//function GetFileVersion(Filename: TPathChar): ShortString; external 'kspfiles.dll';
//function GetFileVersion2(Filename: TPathChar): ShortString; external 'kspfiles.dll';
procedure RemoveForbiddenChars(var Str: String; ReplaceWith: Char); external 'kspfiles.dll';

//function GetFav(FirstPlay, LastPlay: TDateTime; PlayCount: integer): double; external 'kspfiles.dll';
//function GetFav2(FirstPlay, LastPlay: TDateTime; PlayCount: integer;
//  TotalPlays: Cardinal): double; external 'kspfiles.dll';
function IsStream(str: string): boolean; external 'kspfiles.dll';
function IsCD(str: string): boolean; external 'kspfiles.dll';
function PrepareString(str: string): string;// external 'kspfiles.dll';

function DownloadURL(const aUrl: PChar; var Output: TStringList): Boolean; external 'kspinet.dll';

function ReadChangeFile: TFileRenamed; external 'kspfiles.dll';
procedure WriteChangeFile(P: TFileRenamed); external 'kspfiles.dll';

function GetKSPVersion(AppPath: TPathChar): ShortString; external 'ksp.dll';
function GetKSPVersion2(AppPath: TPathChar): ShortString; external 'ksp.dll';

//FileUtils

procedure SearchForFilesFS(Path: string; Rec: boolean; var s: TStringList); overload;
procedure SearchForFiles(Path: string; Rec: boolean; var s: TStringList; DateM: TDateTime); overload;



implementation

uses SysUtils;

procedure SearchForFiles(Path: string; Rec: boolean; var s: TStringList; DateM: TDateTime); overload;
var
  sr: TSearchRec;
  FileAttrs: Integer;
  s2: TStringList;
  i: integer;
begin
  FileAttrs := faAnyFile;//+faDirectory;
  s2:=TStringList.Create;

    if FindFirst(Path+'\*.*', FileAttrs, sr) = 0 then

    begin
      repeat
        //if (sr.Attr and FileAttrs) = sr.Attr then
        begin
        if (sr.Name<>'') and (sr.Name<>'.') and (sr.Name<>'..') then begin
            //ShowMessage(ExtractFileExt(sr.Name));

            if ((sr.Attr and faDirectory) <> sr.Attr)and
              (FileDateToDateTime(sr.Time)>DateM) then
                s.Add(Path+'\'+sr.Name);

            if Rec and ((sr.Attr and faDirectory) = sr.Attr) then
              s2.Add(Path+'\'+sr.Name);
          end;

        end;
      until FindNext(sr) <> 0;
      FindClose(sr);
    end;

  if s2.Count> 0 then
    for i:=0 to s2.Count-1 do
      SearchForFiles(s2.Strings[i], Rec, s, DateM);

  s2.Free;

end;

procedure SearchForFilesFS(Path: string; Rec: boolean; var s: TStringList); overload;
var
  sr: TSearchRec;
  FileAttrs: Integer;
  s2: TStringList;
  i: integer;
begin
  FileAttrs := faAnyFile;//+faDirectory;
  s2:=TStringList.Create;

    if FindFirst(Path+'\*.*', FileAttrs, sr) = 0 then

    begin
      repeat
        //if (sr.Attr and FileAttrs) = sr.Attr then
        begin
        if (sr.Name<>'') and (sr.Name<>'.') and (sr.Name<>'..') then begin
            //ShowMessage(ExtractFileExt(sr.Name));

            if ((sr.Attr and faDirectory) <> sr.Attr) then
                s.Add(Path+'\'+sr.Name);

            if Rec and ((sr.Attr and faDirectory) = sr.Attr) then
              s2.Add(Path+'\'+sr.Name);
          end;

        end;
      until FindNext(sr) <> 0;
      FindClose(sr);
    end;

  if s2.Count> 0 then
    for i:=0 to s2.Count-1 do
      SearchForFilesFS(s2.Strings[i], Rec, s);

  s2.Free;

end;

function PrepareString(str: string): string;
var
  i: integer;
begin
  Result:='';
  if str='' then Exit;
  Result:=str;

  for i:=Length(Result) downto 1 do
    if Result[i]='''' then System.Insert('''', Result, i);

end;


{function DownloadURL(const aUrl: string; var Output: TStringList): Boolean;
var
  hSession: HINTERNET;
  hService: HINTERNET;
  lpBuffer: array[0..1024 + 1] of Char;
  dwBytesRead: DWORD;
begin
  Result := False;
  // hSession := InternetOpen( 'MyApp', INTERNET_OPEN_TYPE_DIRECT, nil, nil, 0);
  hSession := InternetOpen('MyApp', INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
  try
    if Assigned(hSession) then
    begin
      hService := InternetOpenUrl(hSession, PChar(aUrl), nil, 0, 0, 0);
      if Assigned(hService) then
        try
          while True do
          begin
            dwBytesRead := 1024;
            InternetReadFile(hService, @lpBuffer, 1024, dwBytesRead);
            if dwBytesRead = 0 then break;
            lpBuffer[dwBytesRead] := #0;
            Output.Add(lpBuffer);
          end;
          Result := True;
        finally
          InternetCloseHandle(hService);
        end;
    end;
  finally
    InternetCloseHandle(hSession);
  end;
end;  }

end.
