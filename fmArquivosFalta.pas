unit fmArquivosFalta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BusinessSkinForm, bsSkinCtrls,
  Vcl.ComCtrls, Data.DB, Data.Win.ADODB,
  Vcl.ExtCtrls, WinInet, Vcl.StdCtrls;

type
  TfArquivosFalta = class(TForm)
    bsSkinPanel1: TbsSkinPanel;
    bsSkinButton2: TbsSkinButton;
    btBaixa: TbsSkinButton;
    bsSkinPanel2: TbsSkinPanel;
    lvArquivos: TbsSkinListView;
    lbl1: TbsSkinStdLabel;
    gProgresso: TbsSkinGauge;
    qrVERIFICA__: TADOQuery;
    bsSkinScrollBar8: TbsSkinScrollBar;
    lblStatus: TbsSkinStdLabel;
    tmrFecha: TTimer;
    gpBotoes: TGridPanel;
    bsSkinSpeedButton53: TbsSkinSpeedButton;
    bsSkinSpeedButton54: TbsSkinSpeedButton;
    bsSkinSpeedButton55: TbsSkinSpeedButton;
    btVerifica: TbsSkinButton;
    bsBusinessSkinForm1: TbsBusinessSkinForm;
    procedure FormActivate(Sender: TObject);
    procedure verificaArquivos();
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btBaixaClick(Sender: TObject);
    procedure bsSkinButton2Click(Sender: TObject);
    procedure tmrFechaTimer(Sender: TObject);
    procedure bsSkinSpeedButton53Click(Sender: TObject);
    procedure bsSkinSpeedButton54Click(Sender: TObject);
    procedure bsSkinSpeedButton55Click(Sender: TObject);
    procedure btVerificaClick(Sender: TObject);
  private
    { Private declarations }
    alerta: Boolean;
  public
    { Public declarations }
  end;

var
  fArquivosFalta: TfArquivosFalta;

implementation

uses
  fmMenu, fmAtualiza, dmComponentes, fmIniciando, Settings;

{$R *.dfm}

procedure TfArquivosFalta.btVerificaClick(Sender: TObject);
begin
  verificaArquivos();
end;

procedure TfArquivosFalta.bsSkinButton2Click(Sender: TObject);
begin
  tmrFecha.Enabled := False;
  alerta := False;
  DM.qrARQUIVOS_SISTEMA.Last;
  tmrFecha.Enabled := True;
end;

procedure TfArquivosFalta.bsSkinSpeedButton53Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to lvArquivos.Items.Count - 1
    do lvArquivos.Items.Item[i].Checked := True;
end;

procedure TfArquivosFalta.bsSkinSpeedButton54Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to lvArquivos.Items.Count - 1
    do lvArquivos.Items.Item[i].Checked := False;
end;

procedure TfArquivosFalta.bsSkinSpeedButton55Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to lvArquivos.Items.Count - 1
    do lvArquivos.Items.Item[i].Checked := not lvArquivos.Items.Item[i].Checked;
end;

procedure TfArquivosFalta.btBaixaClick(Sender: TObject);
var
  lista: TStringList;
  i: integer;
  Flags: Cardinal;
  Item: TListItem;
begin
  lista := TStringList.Create;
  for i := 0 to lvArquivos.Items.Count - 1 do
  begin
    if (lvArquivos.Items.Item[i].Checked) then
      lista.Add(lvArquivos.Items.Item[i].SubItems[0]);
  end;

  if (lista.Count <= 0) then
  begin
    application.MessageBox(PChar('Nenhum arquivo selecionado!'), Settings.Title, mb_ok + MB_ICONEXCLAMATION);
    Exit;
  end;

  if not (InternetGetConnectedState(@Flags, 0)) then
  begin
    application.messagebox(PChar('N�o foi poss�vel conectar � internet! Verifique sua conex�o e tente novamente.'), Settings.Title, MB_OK + mb_iconerror);
    Exit;
  end;

  fIniciando.AppCreateForm(TfAtualiza, fAtualiza);
  fAtualiza.cancela := false;
  fAtualiza.arquivos := lista;
  fAtualiza.ShowModal;

  lvArquivos.Items.Clear;
  if (fAtualiza.cancela = true) then
  begin
    application.MessageBox(PChar('Opera��o cancelada!'), Settings.Title, mb_ok + MB_ICONEXCLAMATION);
    tmrFecha.Enabled := False;
    alerta := False;
    DM.qrARQUIVOS_SISTEMA.Last;
    tmrFecha.Enabled := True;
  end
  else if (fAtualiza.arquivos_falha.Count > 0) then
  begin
    gProgresso.Value := 0;
    lblStatus.Caption := '';

    gProgresso.MaxValue := fAtualiza.arquivos_falha.Count;
    btBaixa.Enabled := False;
    btVerifica.Enabled := False;
    for i := 0 to fAtualiza.arquivos_falha.Count-1 do
    begin
      lblStatus.Caption := 'Verificando falhas... '+inttostr(DM.qrARQUIVOS_SISTEMA.RecNo)+' / '+inttostr(DM.qrARQUIVOS_SISTEMA.RecordCount);

      Item := lvArquivos.Items.Add;
      Item.Checked := True;
      Item.Caption := ExtractFileName(fAtualiza.arquivos_falha[i]);
      Item.SubItems.Add(fAtualiza.arquivos_falha[i]);
      Item.SubItems.Add('Falha no Download');

      gProgresso.Value := DM.qrARQUIVOS_SISTEMA.RecNo;
      Application.ProcessMessages;
    end;

    btBaixa.Enabled := True;
    btVerifica.Enabled := True;
    lblStatus.Caption := 'Falha no Download: '+inttostr(fAtualiza.arquivos_falha.Count);

    application.MessageBox('Alguns arquivos n�o puderam ser baixados!'+#13#10+'Pode ser que seu firewall ou antiv�rus esteja impedindo o download. Adicione este programa � lista de exe��es ou desative temporariamente o firewall e antiv�rus, tente novamente.', Settings.Title, mb_ok + MB_ICONINFORMATION);
//    if (application.MessageBox('Alguns arquivos n�o puderam ser baixados!'+#13#10+'Pode ser que seu firewall ou antiv�rus esteja impedindo o download. Adicione este programa � lista de exe��es ou desative temporariamente o firewall e antiv�rus para baixar os arquivos.'+#13#10+#13#10+'Deseja tentar baix�-los novamente?', Settings.Title, mb_yesno + mb_iconquestion) = 6) then
//    begin
//      btBaixaClick(Sender);
//      Exit;
//    end;
  end
  else
  begin
    if (fAtualiza.erro <> true) then
      application.MessageBox(PChar('Arquivos atualizados com sucesso!'), Settings.Title, mb_ok + mb_iconinformation);
    tmrFecha.Enabled := False;
    alerta := False;
    DM.qrARQUIVOS_SISTEMA.Last;
    tmrFecha.Enabled := True;
  end;
end;

procedure TfArquivosFalta.FormActivate(Sender: TObject);
begin
  verificaArquivos();
end;

procedure TfArquivosFalta.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  alerta := true;
  fmIndex.FormKeyUp(Sender, Key, Shift);
end;

procedure TfArquivosFalta.tmrFechaTimer(Sender: TObject);
begin
  lblStatus.Caption := '';
  Close;
end;

procedure TfArquivosFalta.verificaArquivos;
var
  Item: TListItem;
  existe: Boolean;
  a_sim,a_nao: Integer;
  tamanho: Longint;
  url: string;
begin
  gpBotoes.Visible := False;

  alerta := true;
  gProgresso.Value := 0;
  lvArquivos.Items.Clear;
  lblStatus.Caption := '';
  a_sim := 0;
  a_nao := 0;

  DM.qrARQUIVOS_SISTEMA.Close;
  DM.qrARQUIVOS_SISTEMA.Open;
  DM.qrARQUIVOS_SISTEMA.First;
  gProgresso.MaxValue := DM.qrARQUIVOS_SISTEMA.RecordCount;
  btBaixa.Enabled := False;
  btVerifica.Enabled := False;
  while not DM.qrARQUIVOS_SISTEMA.eof do
  begin
    url := DM.qrARQUIVOS_SISTEMA.FieldByName('URL').AsString;
    if (fIniciando.paramexec.Strings.Values['dir_config'] <> '') then
      url := StringReplace(url,'config\',fIniciando.paramexec.Strings.Values['dir_config']+'\',[rfIgnoreCase, rfReplaceAll]);
//      showmessage(url);
    lblStatus.Caption := 'Verificando... '+inttostr(DM.qrARQUIVOS_SISTEMA.RecNo)+' / '+inttostr(DM.qrARQUIVOS_SISTEMA.RecordCount);
    existe := (FileExists(ExtractFilePath(application.ExeName)+'/'+url));

    if not existe then
    begin
      Item := lvArquivos.Items.Add;
      Item.Checked := not existe;
      Item.Caption := DM.qrARQUIVOS_SISTEMA.FieldByName('ARQUIVO').AsString;
      Item.SubItems.Add(url);
      a_nao := a_nao + 1;
      Item.SubItems.Add('N�o encontrado');
    end
    else if (DM.qrARQUIVOS_SISTEMA.FieldByName('TAMANHO').AsInteger > 0) then
    begin
      tamanho := fmIndex.FileSize(url);


      if (tamanho >= 0) and (tamanho < DM.qrARQUIVOS_SISTEMA.FieldByName('TAMANHO').AsInteger) then
      begin
        Item := lvArquivos.Items.Add;
        Item.Checked := True;
        Item.Caption := DM.qrARQUIVOS_SISTEMA.FieldByName('ARQUIVO').AsString;
        Item.SubItems.Add(url);
        Item.SubItems.Add('Danificado');
        a_nao := a_nao + 1;
      end
      else a_sim := a_sim + 1;
    end
    else a_sim := a_sim + 1;

    gProgresso.Value := DM.qrARQUIVOS_SISTEMA.RecNo;
    Application.ProcessMessages;
    DM.qrARQUIVOS_SISTEMA.Next;
  end;

  btBaixa.Enabled := True;
  btVerifica.Enabled := True;
  lblStatus.Caption := 'Encontrados: '+inttostr(a_sim)+#13#10+'Em falta/danificado(s): '+inttostr(a_nao);

  if (alerta) and (a_nao <= 0) then
  begin
    application.MessageBox('Sua colet�nea est� completa! Nenhum arquivo est� faltando.', Settings.Title, mb_ok + MB_ICONINFORMATION);
  end
  else if (alerta) then
  begin
    if (application.MessageBox(PChar('Sua colet�nea possui '+inttostr(a_nao) + ' arquivo(s) faltando ou danificado(s)!' + #13#10 + 'Deseja baixar estes arquivos agora? (necess�rio conex�o com a internet)'), Settings.Title, mb_yesno + mb_iconquestion) = 6) then
      btBaixaClick(nil)
  end;

  gpBotoes.Visible := True;
end;

end.


