unit UFuncions;

interface

function DaysRangeOverlap(range1Start, Range1End, Range2Start, Range2End: TDate): Integer;
function bissexto(Data: TDateTime): Boolean;
function getUser :string;
function GetBuildInfo(Prog: string): string;
function ObterDiretorioDoExecutavel: string;

implementation
uses
  System.DateUtils, System.SysUtils, Math, Winapi.Windows, Vcl.Forms;

function DaysRangeOverlap(range1Start, Range1End, Range2Start, Range2End: TDate): Integer;
var
  daysFromStart, daysFromEnd, dayUse, days :Integer;
begin
  daysFromStart := 0;
  daysFromEnd   := 0;
  dayUse        := 0;
  days := DaysBetween(range2Start,Range2End)+1;
  //Living period out bill period
  if (range1Start > Range2End) or (Range1End < Range2Start) then
  begin
    daysFromStart := -1;
    daysFromEnd   := -1;
  end
  else
  begin
    if (range1Start >= Range2Start)  then
      daysFromStart := DaysBetween(range1Start,Range2Start)
    else
      daysFromStart := 0;

    if (Range1End <= Range2End)  then
      daysFromEnd   := DaysBetween(Range2End,Range1End)
    else
      daysFromEnd   := 0;
  end;

  if (daysFromEnd < 0) and (daysFromStart < 0) then
    dayUse := 0
  else
    dayUse := days - (daysFromEnd + daysFromStart);

  Result := dayUse;
end;

function bissexto(Data: TDateTime): Boolean;
var
  Dia,Mes,Ano : Word;
begin
  DecodeDate(Data,Ano,Mes,Dia);
  if Ano mod 4 <> 0 then
   Result := False
  else
    if Ano mod 1 <> 0 then
      Result := True
end;

function getUser :string;
var
  I: DWord;
  user: string;
begin
  I := 255;
  SetLength(user, I);
  GetUserName(PChar(user), I);
  user := string(PChar(user));
  result := user;
end;

function GetBuildInfo(Prog: string): string;
var
 VerInfoSize: DWORD;
 VerInfo: Pointer;
 VerValueSize: DWORD;
 VerValue: PVSFixedFileInfo;
 Dummy: DWORD;
 V1, V2, V3, V4: Word;
begin
 try
   VerInfoSize := GetFileVersionInfoSize(PChar(Prog), Dummy);
   GetMem(VerInfo, VerInfoSize);
   GetFileVersionInfo(PChar(prog), 0, VerInfoSize, VerInfo);
   VerQueryValue(VerInfo, '', Pointer(VerValue), VerValueSize);
   with (VerValue^) do
   begin
     V1 := dwFileVersionMS shr 16;
     V2 := dwFileVersionMS and $FFFF;
     V3 := dwFileVersionLS shr 16;
     V4 := dwFileVersionLS and $FFFF;
   end;
   FreeMem(VerInfo, VerInfoSize);
   Result := Format('%d.%d.%d.%d', [v1, v2, v3, v4]);
 except
   Result := '1.0.0';
 end;
end;

function ObterDiretorioDoExecutavel: string;
begin
  result := ExtractFilePath(Application.ExeName);
end;

end.
