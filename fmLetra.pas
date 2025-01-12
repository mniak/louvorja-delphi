unit fmLetra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, DBCtrls, DB, ADODB,
  bsSkinCtrls, bsdbctrls, Vcl.Mask, bsSkinBoxCtrls, BusinessSkinForm;

type
  TfLetra = class(TForm)
    sPanel2: TbsSkinPanel;
    reLetra: TbsSkinRichEdit;
    sSplitter1: TbsSkinSplitter;
    qrBUSCA: TADOQuery;
    dsBUSCA: TDataSource;
    dbLista: TbsSkinDBLookupListBox;
    GridPanel1: TGridPanel;
    txtLocaliz: TbsSkinEdit;
    bsSkinStdLabel1: TbsSkinStdLabel;
    bsSkinScrollBar8: TbsSkinScrollBar;
    GridPanel2: TGridPanel;
    tbSlideM: TbsSkinButton;
    tbSlideSM: TbsSkinButton;
    btErro: TbsSkinButton;
    bsBusinessSkinForm1: TbsBusinessSkinForm;
    Carregando: TbsSkinDBText;
    qrLETRA: TADOQuery;
    bsSkinPanel1: TbsSkinPanel;
    bsSkinStdLabel2: TbsSkinStdLabel;
    bsSkinDBLookupListBox1: TbsSkinDBLookupListBox;
    qrALBUNS: TADOQuery;
    dsALBUNS: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure tbSlideMClick(Sender: TObject);
    procedure txtLocalizChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure abreLetra();
    procedure dbListaClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btErroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    mMusica_C, mMusica_I, mMusica_A: string;
    id_mus: Integer;
    u_id: integer;
  end;

var
  fLetra: TfLetra;

implementation

uses
  fmMenu, fmEnviaMensagem, fmIniciando;

{$R *.dfm}

procedure TfLetra.FormActivate(Sender: TObject);
begin
  reLetra.Lines.Clear;
  u_id := 0;

  qrBUSCA.Close;
  qrBUSCA.Open;

  dbLista.KeyValue := id_mus;

  abreLetra();
  txtLocaliz.SetFocus;
end;

procedure TfLetra.tbSlideMClick(Sender: TObject);
begin
  fmIndex.abreLetraMusica('BD','',qrBUSCA.FieldByName('ID').AsInteger,(TComponent(Sender).Tag) = 0);
end;

procedure TfLetra.txtLocalizChange(Sender: TObject);
begin
  fmIndex.Localizar(txtLocaliz.text, reLetra, True);
end;

procedure TfLetra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  txtLocaliz.Text := '';
end;

procedure TfLetra.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  fmIndex.FormKeyUp(Sender, Key, Shift);
end;

procedure TfLetra.abreLetra;
var
  letra: string;
  letra_t: TStringList;
begin
  if (u_id = qrBusca.fieldbyname('ID').AsInteger) then Exit;
  u_id := qrBusca.fieldbyname('ID').AsInteger;

  qrALBUNS.Close;
  qrALBUNS.Parameters.ParamByName('MUSICA').Value := qrBusca.fieldbyname('ID').AsInteger;
  qrALBUNS.Open;

  reLetra.Lines.Clear;
  letra_t := TStringList.Create;
  letra_t.Clear;

  qrLETRA.Close;
  qrLETRA.Parameters.ParamByName('MUSICA').Value := qrBusca.fieldbyname('ID').AsInteger;
  qrLETRA.Open;
  while not qrLETRA.Eof do
  begin
    letra := '';
    if (qrLETRA.fieldbyname('LETRA_AUX').AsString <> '') then
      letra := letra+'['+qrLETRA.fieldbyname('LETRA_AUX').AsString+'] ';

    letra := letra+qrLETRA.fieldbyname('LETRA').AsString;
    letra := StringReplace(letra, #13#10, ' ', [rfIgnoreCase, rfReplaceAll]);
    letra_t.Add(letra);
    qrLETRA.Next;
  end;

  if (reLetra.Lines <> letra_t) then
    reLetra.Lines := letra_t;

  fmIndex.formataTexto(reLetra);
  txtLocalizChange(nil);
end;

procedure TfLetra.btErroClick(Sender: TObject);
begin
  fIniciando.AppCreateForm(TfEnviaMensagem, fEnviaMensagem);
  fEnviaMensagem.edAssunto.Text := 'Erro na M�sica "' + qrBUSCA.FieldByName('NOME').AsString + '"';
  fEnviaMensagem.param := 'MUSICA.ID=' + qrBUSCA.FieldByName('ID').AsString;
  fEnviaMensagem.mmMensagem.Lines.Clear;
  fEnviaMensagem.mmMensagem.Lines.Add('Especifique o erro:');
  fEnviaMensagem.mmMensagem.Lines.Add('(    ) Erro nos tempos dos slides');
  fEnviaMensagem.mmMensagem.Lines.Add('(    ) Erro de ortografia');
  fEnviaMensagem.mmMensagem.Lines.Add('(    ) Imagem inapropriada');
  fEnviaMensagem.mmMensagem.Lines.Add('(    ) Outro: [especifique]');
  fEnviaMensagem.mmMensagem.Lines.Add('');
  fEnviaMensagem.mmMensagem.Lines.Add('[Informe aqui mais detalhes]');
  // Altere a letra abaixo para a correta:' + #13#10 + '-----------------------------------------------' + #13#10#13#10 + qrBUSCA.FieldByName('LETRA').AsString;
  fEnviaMensagem.ShowModal;
end;

procedure TfLetra.dbListaClick(Sender: TObject);
begin
  abreLetra();
end;

end.

