unit fmVideoOn;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms,
  Vcl.OleCtrls, SHDocVw, Vcl.StdCtrls, bsSkinCtrls, Vcl.ExtCtrls;

type
  TfVideoOn = class(TForm)
    wbVideo: TWebBrowser;
    mmHTML: TMemo;
    pnlLoading: TPanel;
    lblLoading: TbsSkinLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure wbVideoDocumentComplete(ASender: TObject; const pDisp: IDispatch; const URL: OleVariant);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure CreateParams(var Params: TCreateParams); override;
  public
    { Public declarations }
    videoID: string;
    id: string;
  end;

var
  fVideoOn: TfVideoOn;

implementation

{$R *.dfm}

uses
  fmMenu;

procedure TfVideoOn.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.WndParent := 0;
end;

procedure TfVideoOn.FormActivate(Sender: TObject);
var
  dir: string;
begin
  if (Trim(videoID) = '') then
    Exit;

  id := videoID;
  videoID := '';

  wbVideo.Visible := false;
  pnlLoading.Visible := not wbVideo.Visible;

  dir := fmIndex.dir_temp + 'video.html';
  mmHTML.Lines.SaveToFile(dir);
  wbVideo.Navigate(dir + '?' + id);
end;

procedure TfVideoOn.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: integer;
begin
  if (fVideoOn.AlphaBlendValue > 0) then
  begin
    if fmIndex.ckFadeForm.Checked then
    begin
      for i := fVideoOn.AlphaBlendValue downto 0 do
      begin
        fVideoOn.AlphaBlendValue := i;
        sleep(1);
      end;
    end
    else fVideoOn.AlphaBlendValue := 0;
  end;
  wbVideo.Navigate('about:blank');
end;

procedure TfVideoOn.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  fmIndex.FormKeyUp(Sender, Key, Shift);
end;

procedure TfVideoOn.wbVideoDocumentComplete(ASender: TObject; const pDisp: IDispatch; const URL: OleVariant);
begin
  wbVideo.Visible := true;
  pnlLoading.Visible := not wbVideo.Visible;
end;

end.

