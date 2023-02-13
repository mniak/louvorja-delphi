unit fmEnviaMensagem;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms, Vcl.StdCtrls,
  Vcl.Mask, bsSkinBoxCtrls, bsSkinCtrls, IdIPWatch, WinInet, BusinessSkinForm,
  bsSkinExCtrls, Vcl.ExtCtrls;

type
  TfEnviaMensagem = class(TForm)
    bsSkinStdLabel1: TbsSkinStdLabel;
    edNome: TbsSkinEdit;
    bsSkinStdLabel2: TbsSkinStdLabel;
    edEmail: TbsSkinEdit;
    bsSkinStdLabel3: TbsSkinStdLabel;
    edAssunto: TbsSkinEdit;
    bsSkinStdLabel4: TbsSkinStdLabel;
    bsSkinPanel1: TbsSkinPanel;
    mmMensagem: TbsSkinMemo;
    bsSkinScrollBar1: TbsSkinScrollBar;
    bsSkinScrollBar2: TbsSkinScrollBar;
    bsSkinPanel2: TbsSkinPanel;
    btEnvia: TbsSkinButton;
    bsSkinPanel3: TbsSkinPanel;
    lblEnviando: TbsSkinStdLabel;
    bsBusinessSkinForm1: TbsBusinessSkinForm;
    bsSkinStdLabel5: TbsSkinStdLabel;
    bsSkinLinkLabel13: TbsSkinLinkLabel;
    Panel1: TPanel;
    procedure btEnviaClick(Sender: TObject);
    procedure mmMensagemKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    param: string;
  end;

var
  fEnviaMensagem: TfEnviaMensagem;

implementation

uses
  fmMenu, dmComponentes, Settings;

{$R *.dfm}

procedure TfEnviaMensagem.btEnviaClick(Sender: TObject);
var
  lParams: TStringList;
  ip: TIdIPWatch;
  Flags: Cardinal;
begin
  if trim(edAssunto.text) = '' then
  begin
    application.messagebox('Coloque o assunto da mensagem!', Settings.Title, MB_OK + mb_iconexclamation);
    edAssunto.setfocus;
    Exit;
  end;

  if trim(mmMensagem.text) = '' then
  begin
    application.messagebox('Coloque sua mensagem!', Settings.Title, MB_OK + mb_iconexclamation);
    mmMensagem.setfocus;
    Exit;
  end;

  if not InternetGetConnectedState(@Flags, 0) then
  begin
    application.messagebox('N�o foi poss�vel conectar a internet!', Settings.Title, MB_OK + mb_iconerror);
    Exit;
  end;

  btEnvia.Enabled := False;
  lblEnviando.Visible := not btEnvia.Enabled;
  ip := TIdIPWatch.Create(nil);
  lParams := TStringList.Create;
  lParams.Add('tipo=mensagem');
  lParams.Add('versao=' + fmIndex.lblVersao.Caption);
  lParams.Add('datahora=' + formatdatetime('yyyy-mm-dd hh:nn:ss', Now()));
  lParams.Add('ip=' + ip.LocalIP);
  lParams.Add('dir=' + Application.ExeName);
  lParams.Add('parametros=' + GetCommandLine);
  fmIndex.paramtemp.Lines.Clear;
  fmIndex.paramtemp.Text := fmIndex.GetComputerNameFunc;
  lParams.Add('nome=' + trim(fmIndex.paramtemp.Lines[0]));

  lParams.Add('nome_msg=' + trim(edNome.Text));
  lParams.Add('email_msg=' + trim(edEmail.Text));
  lParams.Add('assunto=' + trim(edAssunto.Text));
  lParams.Add('mensagem=' + DM.IdEncoderMIME.EncodeString(mmMensagem.Text));
  lParams.Add('param=' + param);
  fmIndex.paramtemp.Text := DM.idHttp1.Post(fmIndex.param.Strings.Values['formulario'], lParams);

  btEnvia.Enabled := True;
  lblEnviando.Visible := not btEnvia.Enabled;
  application.messagebox('Mensagem enviada com sucesso! Corre��es e melhorias ser�o analisadas e aplicadas na pr�xima vers�o.', Settings.Title, MB_OK + mb_iconinformation);

  edNome.Text := '';
  edEmail.Text := '';
  edAssunto.Text := '';
  mmMensagem.Lines.Clear;
end;

procedure TfEnviaMensagem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  param := '';
  mmMensagem.Lines.Clear;
  edAssunto.Text := '';
  edEmail.Text := '';
  edNome.Text := '';
end;

procedure TfEnviaMensagem.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  fmIndex.FormKeyUp(Sender, Key, Shift);
end;

procedure TfEnviaMensagem.mmMensagemKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  fmIndex.FormKeyUp(Sender, Key, Shift);
end;

end.

