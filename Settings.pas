unit Settings;

interface
  var TempDir: string;
  var Title: PChar;

implementation
  uses System.SysUtils;

initialization
begin
  TempDir := GetEnvironmentVariable('TEMP')+'\LouvorJA\';

  if not(DirectoryExists(TempDir)) then
    CreateDir(TempDir);

  if not(DirectoryExists(TempDir)) then
    TempDir := GetEnvironmentVariable('TEMP')+'\';
end;

end.
