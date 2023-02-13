unit fmNovaVersao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ValEdit, OleCtrls, ShellApi, bsSkinCtrls,
  bsSkinShellCtrls, BusinessSkinForm,
  bsPngImageList, WinInet;

type
  TfNovaVersao = class(TForm)
    OpenDialog1: TbsSkinOpenDialog;
    bsBusinessSkinForm1: TbsBusinessSkinForm;
    bsSkinPanel1: TbsSkinPanel;
    bsSkinButton2: TbsSkinButton;
    bsSkinButton3: TbsSkinButton;
    bsSkinPanel2: TbsSkinPanel;
    Image1: TbsPngImageView;
    bsSkinPanel3: TbsSkinPanel;
    lbl1: TbsSkinStdLabel;
    lblMsg: TbsSkinStdLabel;
    GridPanel4: TGridPanel;
    lbl2: TbsSkinStdLabel;
    lblVAtu: TbsSkinStdLabel;
    lbl3: TbsSkinStdLabel;
    lblVNova: TbsSkinStdLabel;
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bsSkinButton2Click(Sender: TObject);
    procedure bsSkinButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    setup_dir: string;
  public
    { Public declarations }

  end;

var
  fNovaVersao: TfNovaVersao;

implementation

uses
  fmMenu, fmAtualiza, fmIniciando, Settings;


{$R *.dfm}

procedure TfNovaVersao.bsSkinButton2Click(Sender: TObject);
begin
  close;
end;

procedure TfNovaVersao.bsSkinButton3Click(Sender: TObject);
var
  lista: TStringList;
  arquivo: string;
  Flags: Cardinal;
  inst: string;
begin

  if not (InternetGetConnectedState(@Flags, 0)) then
  begin
    application.messagebox(PChar('N�o foi poss�vel conectar � internet! Verifique sua conex�o e tente novamente.'), Settings.Title, MB_OK + mb_iconerror);
    Exit;
  end;

  inst := fmIndex.param.Strings.Values['instalador'+fIniciando.LANG];
  setup_dir := inst;
//  DeleteFile(arquivo);
  arquivo := ExtractFilePath(application.ExeName)+setup_dir;
  lista := TStringList.Create;
  lista.Add(setup_dir);

  fIniciando.AppCreateForm(TfAtualiza, fAtualiza);
  fAtualiza.arquivos := lista;
  fAtualiza.ShowModal;


  if not FileExists(arquivo) then
  begin
    Application.MessageBox('N�o foi poss�vel baixar/executar a atualiza��o do menu!'+#13#10+'Favor, acesse o site https://louvorja.com.br/ e efetue a instala��o manual da nova vers�o.',Settings.Title,mb_ok+mb_iconerror);
    Exit;
  end
  else
  begin
    fmIndex.abrirArquivo(arquivo);
    Application.Terminate;
  end;
end;

procedure TfNovaVersao.FormCreate(Sender: TObject);
var
  Result : Integer;
  SearchRec: TSearchRec;
begin
  if (DirectoryExists(ExtractFilePath(application.ExeName)+'setup\Output')) then
  begin
    result := FindFirst(ExtractFilePath(application.ExeName)+'setup\Output\*.*', faAnyFile, SearchRec);
    While Result = 0 do
    begin
      DeleteFile(ExtractFilePath(application.ExeName)+'setup\Output\' + SearchRec.Name);
      Result := FindNext(SearchRec);
    end;
  end;
end;

procedure TfNovaVersao.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  fmIndex.FormKeyUp(Sender, Key, Shift);
end;

end.

