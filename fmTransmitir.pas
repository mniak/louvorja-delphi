unit fmTransmitir;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BusinessSkinForm, bsSkinBoxCtrls,
  Vcl.StdCtrls, Vcl.Mask, bsSkinCtrls, Vcl.ExtCtrls, idcontext, IdSocketHandle,
  IdCustomHTTPServer, IdBaseComponent, IdComponent, IdCustomTCPServer,
  IdHTTPServer, bsribbon, bsSkinExCtrls, Vcl.Clipbrd, bsdbctrls;

type
  TfTransmitir = class(TForm)
    bsBusinessSkinForm1: TbsBusinessSkinForm;
    GridPanel77: TGridPanel;
    Panel58: TPanel;
    bsSkinStdLabel142: TbsSkinStdLabel;
    Panel59: TPanel;
    bsSkinStdLabel143: TbsSkinStdLabel;
    seSrvPorta: TbsSkinNumericEdit;
    seSrvUrl: TbsSkinEdit;
    IdHTTPServer1: TIdHTTPServer;
    bsSkinPanel53: TbsSkinPanel;
    ckSrvConectar: TbsSkinCheckBox;
    bsRibbonDivider53: TbsRibbonDivider;
    bsSkinPanel1: TbsSkinPanel;
    bsSkinLabel1: TbsSkinLabel;
    lblStatus: TbsSkinLabel;
    bsSkinPanel2: TbsSkinPanel;
    bsSkinLabel2: TbsSkinLabel;
    lblLinkMus1: TbsSkinLinkLabel;
    btCopLinkMus1: TbsSkinSpeedButton;
    Memo1: TMemo;
    bsSkinPanel3: TbsSkinPanel;
    lblLinkMus2: TbsSkinLinkLabel;
    btCopLinkMus2: TbsSkinSpeedButton;
    bsSkinLabel3: TbsSkinLabel;
    bsSkinPanel4: TbsSkinPanel;
    bsSkinLabel4: TbsSkinLabel;
    bsSkinPanel5: TbsSkinPanel;
    bsSkinLabel5: TbsSkinLabel;
    bsSkinPanel6: TbsSkinPanel;
    lblLinkBib1: TbsSkinLinkLabel;
    btCopLinkBib1: TbsSkinSpeedButton;
    bsSkinLabel6: TbsSkinLabel;
    bsSkinPanel7: TbsSkinPanel;
    bsSkinButton2: TbsSkinButton;
    bsSkinPanel8: TbsSkinPanel;
    btServidor: TbsSkinSpeedButton;
    btIPRede: TbsSkinSpeedButton;
    ckSrvAltIPPorta: TbsSkinCheckBox;
    procedure seSrvUrlExit(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure IdHTTPServer1CommandGet(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
    procedure btServidorClick(Sender: TObject);
    procedure ckSrvConectarClick(Sender: TObject);
    procedure btCopLinkMus1Click(Sender: TObject);
    procedure btCopLinkMus2Click(Sender: TObject);
    procedure btCopLinkBib1Click(Sender: TObject);
    procedure bsSkinButton2Click(Sender: TObject);
    procedure btIPRedeClick(Sender: TObject);
    procedure ckSrvAltIPPortaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    tentativaConexao: Integer;
  public
    { Public declarations }
  end;

var
  fTransmitir: TfTransmitir;

implementation

{$R *.dfm}

uses fmMenu, Settings;

procedure TfTransmitir.bsSkinButton2Click(Sender: TObject);
begin
  close;
end;

procedure TfTransmitir.btIPRedeClick(Sender: TObject);
begin
  seSrvUrl.Text := fmIndex.GetIP;
end;

procedure TfTransmitir.btCopLinkBib1Click(Sender: TObject);
begin
  Clipboard.AsText := lblLinkBib1.Caption;
end;

procedure TfTransmitir.btCopLinkMus1Click(Sender: TObject);
begin
  Clipboard.AsText := lblLinkMus1.Caption;
end;

procedure TfTransmitir.btCopLinkMus2Click(Sender: TObject);
begin
  Clipboard.AsText := lblLinkMus2.Caption;
end;

procedure TfTransmitir.btServidorClick(Sender: TObject);
var
  Binding : TIdSocketHandle;
  url: string;
begin
  tentativaConexao := tentativaConexao+1;

  seSrvUrl.Enabled := True;
  seSrvPorta.Enabled := True;
  btIPRede.Enabled := True;
  fmIndex.spServer.Caption := '';
  btServidor.Enabled := False;
  IdHTTPServer1.Active := False;
  IdHTTPServer1.Bindings.Clear;
  lblStatus.Caption := 'Desconectado';

  lblLinkMus1.Caption := '';
  lblLinkMus1.URL := lblLinkMus1.Caption;
  lblLinkMus2.Caption := '';
  lblLinkMus2.URL := lblLinkMus2.Caption;
  lblLinkBib1.Caption := '';
  lblLinkBib1.URL := lblLinkBib1.Caption;

  if (btServidor.ImageIndex = 9) then
  begin
    btServidor.ImageIndex := 8;
    btServidor.Caption := 'Iniciar Servidor';
    btServidor.Enabled := True;
    tentativaConexao := 0;
  end
  else
  begin
    if (trim(seSrvUrl.Text) = '')
      then seSrvUrl.Text := fmIndex.GetIP;
    if (trim(seSrvPorta.Text) = '')
      then seSrvPorta.Text := '7070';
    if (StrToInt(seSrvPorta.Text) <= 0)
      then seSrvPorta.Text := '7070';
    IdHTTPServer1.DefaultPort := StrToInt(seSrvPorta.Text);
    Binding := IdHTTPServer1.Bindings.Add;
    Binding.Port := IdHTTPServer1.DefaultPort;
    Binding.IP := seSrvUrl.Text;
    try
      IdHTTPServer1.Active := True;
      btServidor.Enabled := True;
      btServidor.ImageIndex := 9;
      btServidor.Caption := 'Desconectar Servidor';
      seSrvUrl.Enabled := False;
      seSrvPorta.Enabled := False;
      btIPRede.Enabled := False;
      fmIndex.gravaParam('Servidor', 'URL', seSrvUrl.Text);
      fmIndex.gravaParam('Servidor', 'Porta', seSrvPorta.Text);

      url := 'http://'+seSrvUrl.Text+':'+seSrvPorta.Text;
      fmIndex.spServer.Caption := url;
      lblStatus.Caption := 'Conectado';

      lblLinkMus1.Caption := url+'/musica?transmissao';
      lblLinkMus1.URL := lblLinkMus1.Caption;
      lblLinkMus2.Caption := url+'/musica?retorno';
      lblLinkMus2.URL := lblLinkMus2.Caption;
      lblLinkBib1.Caption := url+'/biblia?transmissao';
      lblLinkBib1.URL := lblLinkBib1.Caption;

      memo1.lines.savetofile(fmIndex.dir_config+'server/file/file.ja');
    except
      IdHTTPServer1.Active := False;
      IdHTTPServer1.Bindings.Clear;
      btServidor.Enabled := True;

      if tentativaConexao < 3 then
      begin
        if (seSrvUrl.Text <> fmIndex.GetIP) then
        begin
          seSrvUrl.Text := fmIndex.GetIP;
          btServidorClick(Sender);
        end
        else
        begin
          seSrvPorta.Text := IntToStr(1 + Random(10000));
          btServidorClick(Sender);
        end;
      end
      else
      begin
        tentativaConexao := 0;
        Application.MessageBox(PChar('Erro ao iniciar servidor!'),Settings.Title,mb_ok+mb_iconerror);
      end;
    end;
  end;
end;

procedure TfTransmitir.ckSrvAltIPPortaClick(Sender: TObject);
begin
  if ckSrvAltIPPorta.Checked then
    fmIndex.gravaParam('Servidor', 'AltPortaIP', '1')
  else
    fmIndex.gravaParam('Servidor', 'AltPortaIP', '0');
end;

procedure TfTransmitir.ckSrvConectarClick(Sender: TObject);
begin
  if ckSrvConectar.Checked then
    fmIndex.gravaParam('Servidor', 'Conectar', '1')
  else
    fmIndex.gravaParam('Servidor', 'Conectar', '0');
end;

procedure TfTransmitir.FormActivate(Sender: TObject);
begin
  tentativaConexao := 0;
end;

procedure TfTransmitir.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  fmIndex.FormKeyUp(Sender, Key, Shift);
end;

procedure TfTransmitir.IdHTTPServer1CommandGet(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
var
  url:string;
  arq:string;
  txt: TStringList;
begin
  arq := ARequestInfo.Document;
  if (Trim(arq) = '') or (Trim(arq) = '/') then
    arq := '/index.htm';
  if (Trim(arq) = '/musica') or (Trim(arq) = '/musica/') or
     (Trim(arq) = '/biblia') or (Trim(arq) = '/biblia/') then
    arq := '/page.htm';
  url := fmIndex.dir_config+'server'+arq;
  if not FileExists(url) then
  begin
    arq := '/pagina_nao_encontrada.htm';
    url := fmIndex.dir_config+'server'+arq;
  end;
  txt := TStringList.Create;
  txt.LoadFromFile(url);
  AResponseInfo.ContentText := txt.Text;
end;

procedure TfTransmitir.seSrvUrlExit(Sender: TObject);
begin
  seSrvUrl.Text := StringReplace(seSrvUrl.Text,'http://','',[rfIgnoreCase, rfReplaceAll]);
  seSrvUrl.Text := StringReplace(seSrvUrl.Text,'https://','',[rfIgnoreCase, rfReplaceAll]);
  //192.168.56.1
end;

end.
