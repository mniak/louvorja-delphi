unit Settings;

interface
  var TempDir: string;
  var Title: PChar;
  var ParamsURL: string;

  procedure Init();

implementation
  uses System.SysUtils;

procedure Init();
begin
  if not(DirectoryExists(TempDir)) then
    CreateDir(TempDir);

  if not(DirectoryExists(TempDir)) then
    TempDir := GetEnvironmentVariable('TEMP')+'\';
end;

initialization
begin
  TempDir := GetEnvironmentVariable('TEMP')+'\LouvorJA\';
  ParamsURL := 'https://louvorja.com.br/params/params.php';
end;

end.
