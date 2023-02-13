unit fmIniciando;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, bsSkinCtrls, bsribbon, Vcl.StdCtrls,
  Vcl.ExtCtrls, WinInet, Vcl.ComCtrls, Vcl.Imaging.pngimage, Vcl.Grids,
  Vcl.ValEdit, typinfo, Vcl.Menus, bsSkinMenus, bsDBGrids,
  bsSkinTabs;

type
  TfIniciando = class(TForm)
    Timer1: TTimer;
    Panel2: TbsSkinPanel;
    Panel1: TbsSkinPanel;
    lblTitulo: TbsSkinStdLabel;
    bsRibbonDivider26: TbsRibbonDivider;
    lblInfo: TbsSkinStdLabel;
    Image1: TImage;
    vLang: TValueListEditor;
    paramexec: TValueListEditor;
    procedure Timer1Timer(Sender: TObject);
    procedure AppCreateForm(InstanceClass: TComponentClass; var Reference);
    procedure TranslateForm(Form: TForm);
    function Translate(txt: string):string;
    procedure FormCreate(Sender: TObject);
  private

  const
    arq_liturgia: string = 'liturgia.ja';
    senha_bd: string = 'bddbuscacdja';
  public
      LANG: string;
 end;

var
  fIniciando: TfIniciando;

implementation

{$R *.dfm}

uses fmMenu, fmAtualiza, dmComponentes, fmTransmitir, Settings;

procedure TfIniciando.AppCreateForm(InstanceClass: TComponentClass;
  var Reference);
begin
  Application.CreateForm(InstanceClass, Reference);
  if trim(LANG) <> '' then
    TranslateForm(TForm(Reference));
end;

procedure TfIniciando.FormCreate(Sender: TObject);
var
  arq: string;
begin
  vLang.Strings.Clear;
  LANG := '';

  arq := ExtractFilePath(application.exename)+'.translate';
  if FileExists(arq) then
  begin
    vLang.Strings.LoadFromFile(arq);
    LANG := vLang.Strings.Values['_'];
  end;
end;

procedure TfIniciando.Timer1Timer(Sender: TObject);
var
  i: integer;
  lista: TStringList;
  Flags: Cardinal;
  externo: Boolean;
  dir_dados: string;
  dir_config: string;
  url_params: string;
begin
  Timer1.Enabled := False;
  externo := False;

  paramexec.Strings.Text := StringReplace(paramstr(2), ';' ,#13#10, [rfIgnoreCase, rfReplaceAll]);

  if (paramexec.Strings.Values['lang'] <> '') then
  begin
    vLang.Strings.LoadFromFile(ExtractFilePath(application.exename)+'lang\'+paramexec.Strings.Values['lang']+'.txt');
    LANG := vLang.Strings.Values['_'];
  end;

  if LANG = 'ES'
    then Settings.Title := 'Loor JA'
  else Settings.Title := 'Louvor JA';

  lblTitulo.Caption := Settings.Title;
  lblInfo.Caption := Translate(lblInfo.Caption);
  application.ProcessMessages;

  if (paramexec.Strings.Values['dir_config'] <> '') then
    dir_config := ExtractFilePath(Application.ExeName) + paramexec.Strings.Values['dir_config'] + '\'
  else
    dir_config := ExtractFilePath(Application.ExeName) + 'config\';

  if FileExists(ParamStr(1)) then
  begin
    lblInfo.Caption := Translate('Abrindo arquivo...');
    externo := True;
    application.ProcessMessages;
  end;


  //**CARREGA BANCO DE DADOS****************************************************
  if not FileExists(dir_config + 'BD.mdb') then
  begin
    if (application.messagebox(PChar(Translate('Banco de Dados n�o localizado! Deseja tentar baixar da internet?')), Settings.Title, MB_yesno + mb_iconerror) <> 6) then
    begin
      application.terminate;
      Exit;
    end
    else
    begin
      if not (InternetGetConnectedState(@Flags, 0)) then
      begin
        application.messagebox(PChar(Translate('N�o foi poss�vel conectar � internet! Verifique sua conex�o e tente novamente.')), Settings.Title, MB_OK + mb_iconerror);
        application.terminate;
        Exit;
      end;

      lista := TStringList.Create;
      lista.Add('config\BD.mdb');

      AppCreateForm(TfAtualiza, fAtualiza);
      fAtualiza.arquivos := lista;
      fAtualiza.ShowModal;

      if not FileExists(dir_config + 'BD.mdb') then
      begin
        application.messagebox(PChar(Translate('N�o foi poss�vel baixar o Banco de Dados da internet. Favor, instale seu programa novamente!')), Settings.Title, MB_ok + mb_iconerror);
        application.terminate;
        Exit;
      end;
    end;
  end;

  DM.ADO.Connected := false;
  DM.ADO.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' + dir_config + 'BD.mdb;Persist Security Info=False;Jet OLEDB:Database Password='+senha_bd;
//  ADO.ConnectionString := 'Provider=Microsoft.ACE.OLEDB.12.0;Data Source=' + ExtractFilePath(Application.ExeName) + 'config\BD.mdb;Persist Security Info=False;Jet OLEDB:Database Password=colbdlja2000;';
//  DM.ADO.ConnectionString := 'DRIVER=SQLite3 ODBC Driver;Database=' + dir_config + 'BD.db;LongNames=0;Timeout=1000;NoTXN=0;SyncPragma=NORMAL;StepAPI=0;';
  try
    DM.ADO.Connected := true;
  except
    on E: Exception do
    begin
      application.messagebox(PChar(Translate('N�o foi poss�vel conectar ao Banco de Dados.')+#13#10+E.Message), Settings.Title, MB_OK + mb_iconerror);
      application.terminate;
    end;
  end;


  //**CARREGA VARIAVEIS*********************************************************
  dir_dados := GetEnvironmentVariable('APPDATA')+'\LouvorJA\';
  url_params := 'https://louvorja.com.br/params/params.php';


  if not(DirectoryExists(dir_dados)) then
    CreateDir(dir_dados);

  //**ATIVANDO PROGRAMA*********************************************************
  AppCreateForm(TfmIndex, fmIndex);

  fmIndex.paramexec.Strings.Text := paramexec.Strings.Text;
  DM.PasswordDialog.Password := paramexec.Strings.Values['pwd'];

  //DESATIVA RECURSOS "ES"
  if (LANG = 'ES') then
  begin
    fmIndex.bsRibbonGroup7.Visible := False;
    fmIndex.bsRibbonGroup9.Visible := False;
  end;

  fmIndex.arq_liturgia := arq_liturgia;
  fmIndex.senha_bd := senha_bd;
  fmIndex.dir_dados := dir_dados;
  fmIndex.dir_config := dir_config;
  fmIndex.externo := externo;
  fmIndex.url_params := url_params;

  fmIndex.desenvolvedor(paramexec.Strings.Values['des'] = '1');
  fmIndex.usaFontes(true);


  //**DETECTA MONITORES*********************************************************
  fmIndex.monitores;

  //**CARREGA SKIN**************************************************************
  fmIndex.cbLayout.Items.Clear;
  for i := 0 to DM.bsCompressedSkinList1.Skins.Count - 1 do
    fmIndex.cbLayout.Items.Add(DM.bsCompressedSkinList1.Skins.Items[i].Name);
  fmIndex.cbLayout.ItemIndex := StrToInt(fmIndex.lerParam('Config', 'Layout', '0'));

  //**CARREGA CONFIGURA��ES GLOBAIS*********************************************
  fmIndex.ckMonitorJanela.Checked := (fmIndex.lerParam('Config', 'MonitorTelaCheia', '1') = '1');
  fmIndex.ckFadeForm.Checked := (fmIndex.lerParam('Config', 'FadeForm', '1') = '1');
  fmIndex.ckMesmaJanela.Checked := false;// (fmIndex.lerParam('Config', 'ckMesmaJanela', '0') = '1');
  fmIndex.ckMusicaJanela.Checked := (fmIndex.lerParam('Musicas', 'MonitorTelaCheia', '1') = '1');
  fmIndex.ckMusicaTopo.Checked := (fmIndex.lerParam('Musicas', 'Topo', '1') = '1');
  fmIndex.ckMusicaOperador.Checked := (fmIndex.lerParam('Musicas', 'ModoOperador', '1') = '1');
  fmIndex.ckMusicaRetorno.Checked := (fmIndex.lerParam('Musicas', 'ModoRetorno', '0') = '1');
  fmIndex.ckMusicaTituloSlide.Checked := (fmIndex.lerParam('Musicas', 'TituloSlide', '1') = '1');
  fmIndex.ckVideoOnJanela.Checked := (fmIndex.lerParam('Videos Online', 'MonitorTelaCheia', '1') = '1');
  fmIndex.sbVideoOnAbreLiturgia.ItemIndex := StrToInt(fmIndex.lerParam('Videos Online', 'Player Liturgia', '1'));
  fmIndex.sbAlinhMusica.ItemIndex := StrToInt(fmIndex.lerParam('Musicas', 'Alinhamento', '1'));
  fmIndex.ckPlayerTelaCheia.Checked := (fmIndex.lerParam('Player', 'MonitorTelaCheia', '1') = '1');
  fmIndex.ckPlayerVideo.Checked := (fmIndex.lerParam('Player', 'Video', '0') = '1');
  fmIndex.ckPlayerAudio.Checked := (fmIndex.lerParam('Player', 'Audio', '0') = '1');
  fmIndex.ckSlideTxtFormatPerso.Checked := (fmIndex.lerParam('Musicas', 'TextoPersonalizado', '0') = '1');
  fmIndex.ckSlideImgFormatPerso.Checked := (fmIndex.lerParam('Musicas', 'FundoPersonalizado', '0') = '1');
  fmIndex.corFundoMusica.ColorValue := StringToColor(fmIndex.lerParam('Musicas', 'Cor Fundo', '$0000000'));
  fmIndex.corTituloMusica.ColorValue := StringToColor(fmIndex.lerParam('Musicas', 'Cor Titulo', '$000b4ef'));
  fmIndex.corTextoMusica.ColorValue := StringToColor(fmIndex.lerParam('Musicas', 'Cor Texto', '$0FFFFFF'));
  fmIndex.corTextoRepetido.ColorValue := StringToColor(fmIndex.lerParam('Musicas', 'Cor Texto Repetido', '$000b4ef'));
  fmIndex.corTextoAuxMusica.ColorValue := StringToColor(fmIndex.lerParam('Musicas', 'Cor Texto Aux', '$000b4ef'));
  fmIndex.ckMusicaFundoTransparente.Checked := (fmIndex.lerParam('Musicas', 'FundoTransparente', '0') = '1');
  fmIndex.ckFundoTransparente.Checked := (fmIndex.lerParam('Musicas', 'FundoTelaTransparente', '0') = '1');
  fmIndex.bsFormatSlideImgPerso2.Visible := (not fmIndex.ckFundoTransparente.Checked);
  fmIndex.seTamanhoTitulo.Text := fmIndex.lerParam('Musicas', 'Tamanho Titulo', '18');
  fmIndex.seTamanhoTexto.Text := fmIndex.lerParam('Musicas', 'Tamanho Texto', '14');
  fmIndex.seTamanhoTextoAux.Text := fmIndex.lerParam('Musicas', 'Tamanho Texto Aux', '10');
  fmIndex.imgFundoMusica.Text := fmIndex.lerParam('Musicas', 'Imagem Fundo', '');
  fmIndex.txtImgFundoMusicaInfo.Text := fmIndex.lerParam('Musicas', 'Imagem Fundo Info', '');
  fmIndex.posicaoFundo.ItemIndex := StrToInt(fmIndex.lerParam('Musicas', 'Imagem Fundo Posicao', '5'))-1;
  if fmIndex.ckSlideTxtFormatPerso.Checked
    then fmIndex.bsFormatSlPerso.Height := 72
    else fmIndex.bsFormatSlPerso.Height := 24;
  if fmIndex.ckSlideImgFormatPerso.Checked
    then fmIndex.bsFormatSlImgPerso.Height := 48
    else fmIndex.bsFormatSlImgPerso.Height := 24;

  //**SERVIDOR****************************************
  AppCreateForm(TfTransmitir, fTransmitir);
  fTransmitir.seSrvUrl.Text := fmIndex.lerParam('Servidor', 'URL', fmIndex.GetIP());
  fTransmitir.seSrvPorta.Text := fmIndex.lerParam('Servidor', 'Porta', '7070');
  fTransmitir.ckSrvConectar.Checked := (fmIndex.lerParam('Servidor', 'Conectar', '0') = '1');
  fTransmitir.ckSrvAltIPPorta.Checked := (fmIndex.lerParam('Servidor', 'AltPortaIP', '1') = '1');

  //**AJUSTA SCROLLBOX****************************************
  fmIndex.ScrollBox1.VertScrollBar.Position := 0;
  fmIndex.ScrollBox2.VertScrollBar.Position := 0;
  fmIndex.ScrollBox3.VertScrollBar.Position := 0;
  fmIndex.ScrollBox5.VertScrollBar.Position := 0;
  fmIndex.ScrollBox6.VertScrollBar.Position := 0;
  fmIndex.ScrollBox7.VertScrollBar.Position := 0;



  if externo then
  begin
    //**SE ARQUIVO EXTERNO, ABRE ARQUIVO****************************************
    fmIndex.processaArquivo(ParamStr(1));
    fIniciando.Visible := False;
  end
  else
  begin
    //**BORDAS E TAMANHO DO FORM************************************************
    fmIndex.carrega_opc := false;

    fmIndex.BorderStyle := bsSizeable;
    fmIndex.Width := Round(Screen.Width * 0.75);
    fmIndex.height := Round(Screen.height * 0.85);
    fmIndex.btwsMaximizedClick(Sender);
    if fmIndex.lerParam('Desenvolvedor', 'Width', '') <> ''
      then fmIndex.Width := strtoint(fmIndex.lerParam('Desenvolvedor', 'Width', ''));
    if fmIndex.lerParam('Desenvolvedor', 'Height', '') <> ''
      then fmIndex.Height := strtoint(fmIndex.lerParam('Desenvolvedor', 'Height', ''));


    //**MENUS E ABAS************************************************************
    fmIndex.bsAppMenu1.ItemIndex := 0;
    fmIndex.PaginaMenuAtiva(fmIndex.bsColetaneas);
    fmIndex.PageControl5.ActivePageIndex := 0;
    fmIndex.bsRibbon1.Visible := True;
    fmIndex.ScrollBox2.Top := 0;

    for i := 0 to fmIndex.PageControl1.PageCount - 1 do
      fmIndex.PageControl1.Pages[i].TabVisible := False;


    //**IMAGEM DE FUNDO*********************************************************
    fmIndex.pnlImagemCapa.Color := StringToColor(fmIndex.lerParam('Config', 'Cor Fundo', ColorToString(fmIndex.pnlImagemCapaModel.Color)));
    fmIndex.corCapaPrograma.ColorValue := fmIndex.pnlImagemCapa.Color;

    fmIndex.cbAlinhamentoCapaPrograma.ItemIndex := strtoint(fmIndex.lerParam('Config', 'Alinhamento Imagem Fundo', '0'));
    fmIndex.imgImagemCapa.Stretch := (fmIndex.cbAlinhamentoCapaPrograma.ItemIndex = 1);

    fmIndex.imgCapaPrograma.Text := fmIndex.lerParam('Config', 'Imagem Fundo', '');
    fmIndex.txtImgCapaProgramaInfo.Text := fmIndex.lerParam('Config', 'Imagem Fundo Info', '');
    if trim(fmIndex.imgCapaPrograma.Text) <> '' then
    begin
      try
        fmIndex.imgImagemCapa.Picture.LoadFromFile(fmIndex.imgCapaPrograma.Text);
      except
        fmIndex.imgImagemCapa.Picture := fmIndex.imgImagemCapaModel.Picture;
//        fmIndex.imgCapaPrograma.Text := '';
//        fmIndex.txtImgCapaProgramaInfo.Text := '';
      end;
    end
    else
      fmIndex.imgImagemCapa.Picture := fmIndex.imgImagemCapaModel.Picture;


    //**CARREGA PARAMETROS DA WEB***********************************************
    fmIndex.carregaParams();


    //**CARREGA T�TULOS DO PROGRAMA
    application.Title := Settings.Title;
    fmIndex.Caption := Settings.Title;
    fmIndex.pnlTitForm.Caption := Settings.Title;


    //**CARGA INICIAL DAS VARI�VEIS
    fmIndex.tCronoT := 0;


    //**CARREGA INFORMA��ES DO COMPUTADOR E REL�GIO*****************************
    DM.tmrRelogio.Enabled := True;
    fmIndex.paramtemp.Lines.Clear;
    fmIndex.paramtemp.Text := fmIndex.GetComputerNameFunc;
    fmIndex.spNomePC.Caption := ' '+trim(fmIndex.paramtemp.Lines[0]);


    //**ATUALIZA BD COM COLETANEAS ATIVAS/INATIVAS******************************
    DM.qrALBUM_ATIV.Close;
    DM.qrALBUM_ATIV.Open;
    DM.qrALBUM_INATIV.Close;
    DM.qrALBUM_INATIV.Open;


    //**MOSTRA FORM*************************************************************
    fmIndex.Show;
    if fmIndex.ckFadeForm.Checked then
    begin
      for i := 0 to 255 do
      begin
        fmIndex.AlphaBlendValue := i;
        sleep(1);
      end;
    end
    else fmIndex.AlphaBlendValue := 255;

    //**CHECA VERS�O E NOVAS VERS�ES********************************************
    fmIndex.gravaParam('Config','VersaoExe',fmIndex.VersaoExe);
    DM.tmrVersao.Enabled := True;

    fmIndex.carrega_opc := true;
  end;

  fIniciando.Visible := False;

  if DM.tmrSair.Enabled = True then
    Exit;
  Timer1.Destroy;
end;

function TfIniciando.Translate(txt: string):string;
var
  tra:string;
begin
  if Trim(LANG) = '' then
  begin
    Result := txt;
    Exit;
  end;

  if (Trim(txt) <> '') then
  begin
    tra := vLang.Strings.Values[txt];
    if (trim(tra) <> '') then
    begin
      Result := tra;
//      Result := 'ZZZ';
    end
    else
    begin
      vLang.Strings.Values[txt] := txt;
      Result := txt;
//      Result := 'YYY';
      if (paramexec.Strings.Values['lang'] <> '') then
      begin
        vLang.Strings.SaveToFile(ExtractFilePath(application.exename)+'lang\'+paramexec.Strings.Values['lang']+'.txt');
      end;
      //vLang.Strings.SaveToFile(ExtractFilePath(application.exename)+'.translate');
    end;
  end;
end;

procedure TfIniciando.TranslateForm(Form: TForm);
var
  i,j: integer;
begin
  Form.Caption := Translate(Form.Caption);
  for i := fmIndex.ComponentCount -1 downto 0 do
  begin
    try
      try
        if (GetPropInfo(Form.Components[i].ClassInfo, 'Caption') <> nil) and (trim(TLabel(Form.Components[i]).Caption) <> '') then
          TLabel(Form.Components[i]).Caption := Translate(TLabel(Form.Components[i]).Caption);
      except
        //
      end;

      if (Form.Components[i] is TbsRibbon) then
      begin
        for j := 0 to TbsRibbon(Form.Components[i]).Tabs.Count-1 do
        begin
          if TbsRibbon(Form.Components[i]).Tabs[j].Page.Caption <> '' then
            TbsRibbon(Form.Components[i]).Tabs[j].Page.Caption := Translate(TbsRibbon(Form.Components[i]).Tabs[j].Page.Caption);
        end;
        for j := 0 to TbsRibbon(Form.Components[i]).Buttons.Count-1 do
        begin
          if TbsRibbon(Form.Components[i]).Buttons[j].Caption <> '' then
            TbsRibbon(Form.Components[i]).Buttons[j].Caption := Translate(TbsRibbon(Form.Components[i]).Buttons[j].Caption);
        end;
      end
      else
      if (Form.Components[i] is TbsAppMenu) then
      begin
        for j := 0 to TbsAppMenu(Form.Components[i]).Items.Count-1 do
        begin
          TbsAppMenu(Form.Components[i]).Items[j].Caption := Translate(TbsAppMenu(Form.Components[i]).Items[j].Caption);
        end;
      end
      else
      if (Form.Components[i] is TbsSkinRadioGroup) then
      begin
        for j := 0 to TbsSkinRadioGroup(Form.Components[i]).Items.Count-1 do
        begin
          TbsSkinRadioGroup(Form.Components[i]).Items[j] := Translate(TbsSkinRadioGroup(Form.Components[i]).Items[j]);
        end;
      end
      else
      if (Form.Components[i] is TbsSkinCheckGroup) then
      begin
        for j := 0 to TbsSkinCheckGroup(Form.Components[i]).Items.Count-1 do
        begin
          TbsSkinCheckGroup(Form.Components[i]).Items[j] := Translate(TbsSkinCheckGroup(Form.Components[i]).Items[j]);
        end;
      end
      else
      if (Form.Components[i] is TbsSkinPopupMenu) then
      begin
        for j := 0 to TbsSkinPopupMenu(Form.Components[i]).Items.Count-1 do
        begin
          TbsSkinPopupMenu(Form.Components[i]).Items[j].caption := Translate(TbsSkinPopupMenu(Form.Components[i]).Items[j].caption);
        end;
      end
      else
      if (Form.Components[i] is TbsSkinDBGrid) then
      begin
        for j := 0 to TbsSkinDBGrid(Form.Components[i]).Columns.Count-1 do
        begin
          TbsSkinDBGrid(Form.Components[i]).Columns[j].Title.Caption := Translate(TbsSkinDBGrid(Form.Components[i]).Columns[j].Title.Caption);
        end;
      end
      else
      if (Form.Components[i] is TbsSkinTabControl) then
      begin
        for j := 0 to TbsSkinTabControl(Form.Components[i]).Tabs.Count-1 do
        begin
          TbsSkinTabControl(Form.Components[i]).Tabs[j] := Translate(TbsSkinTabControl(Form.Components[i]).Tabs[j]);
        end;
      end;
    except
      //
    end;
  end;
end;

end.

(*
|-------------------------------------------------------------------------------
|
|------------|
| CORRE��ES: |
|------------|
|
|- Ver erro ao desconectar monitor 2 durante musica
|- Na liturgia, corre��o de bug ao selecionar um arquivo que tenha acentua��es e '�' pois o sistema n�o consegue fazer o encode correto
|- Bug na tela de help. As vezes n�o fecha
|- Bug nos itens agendados - CDS
|- Os slides com playback do cd jovem 2011 est�o todos fora de tempo!
|- Depois de clicar no campo Geral "Ligar", com a contagem do tempo, se j� tiver tocado alguma das m�sicas, minimizando e retgornando ao programa Louvor JA, a m�sica p�ra.
|- Bug ao fechar/minimizar algumas janela (como lista de m�sicas, por exemplo)
|- Problema ao cancelar download (n�o fecha a janela, tendo que fechar pelo gerenciador de tarefas)
|
|------------|
| MELHORIAS: |
|------------|
|
|- Agrupar hinos do hin�rio por temas
|- Fazer sumir o ponteiro do mouse durante apresenta��o da musica (ser parametrizavel = sim/nao)
|- Colocar n�mero do hino no slide e no t�tulo
|- Playlist personalizada
|- Wallpaper agendado
|- Mesclar m�dulos Cronometro e Escola Sabatina
|- Dar a op��o de selecionar alguns blocos para a tela de in�cio (talvez contendo os favoritos caso n�o seja poss�vel mov�-los)
|- Ao abrir programa, abrir as abas favoritas
|- As m�sicas est�o com tempo sem �udio extenso no final: Cora��o aberto e Eu sou a mensagem, principalmente, do cd jovem Eu sou a mensagem.
|- Na liturgia, corre��o de bug ao selecionar um arquivo que tenha acentua��es e '�' pois o sistema n�o consegue fazer o encode correto
|- Dar a op��o de selecionar alguns blocos para a tela de in�cio (talvez contendo os favoritos caso n�o seja poss�vel mov�-los)
|- M�sica para sorteio
|- Criar categoria Desbravadores e Aventureiros
|- Colocar texto no cronometro
|- Mudar posi��o do cronometro
|- Colocar op��o do usuario colcoar audio no sorteio
|
|-------------------------------------------------------------------------------

*)
