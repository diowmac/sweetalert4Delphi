unit NewAlert;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.GIFImg,
  frxGIFGraphic, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxGDIPlusClasses, cxImage, Vcl.StdCtrls, Math,
  dxSkinsCore, dxSkinBasic, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray,
  dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringtime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinWXI, dxSkinXmas2008Blue;

type

  TFrmNewAlert = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    gif_sucess: TcxImage;
    lbtitulo: TPanel;
    btn_ok: TPanel;
    btn_sim: TPanel;
    btn_nao: TPanel;
    Panel5: TPanel;
    gif_alert: TcxImage;
    gif_error: TcxImage;
    gif_confirm: TcxImage;
    lbMsg: TMemo;
    procedure FormShow(Sender: TObject);
    procedure btn_okClick(Sender: TObject);
    procedure btn_simClick(Sender: TObject);
    procedure btn_naoClick(Sender: TObject);
  private
    FResult: integer;

  public
    function ShowAlert(const Titulo, Mensagem: string; AlertType: string;
      const Mensagens: TStringList = nil): integer;
    property Result: integer read FResult write FResult;
    procedure AjustarFormulario;
  end;

var
  FrmNewAlert: TFrmNewAlert;

implementation

{$R *.dfm}

procedure TFrmNewAlert.FormShow(Sender: TObject);
begin
 // AjustarFormulario;
end;

procedure TFrmNewAlert.btn_okClick(Sender: TObject);
begin
  FResult := mrOk;
  Close;
end;

procedure TFrmNewAlert.btn_simClick(Sender: TObject);
begin
  FResult := mrOk;
  Close;
end;

procedure TFrmNewAlert.btn_naoClick(Sender: TObject);
begin
  FResult := mrCancel;
  Close;
end;

function TFrmNewAlert.ShowAlert(const Titulo, Mensagem: string; AlertType: string;
  const Mensagens: TStringList): integer;
begin
//  lbTitulo.Caption := Titulo;
//
//  if Assigned(Mensagens) then
//  begin
//    ListBox1.Items.Assign(Mensagens);
//    ListBox1.Visible := True;
//    lbMsg.Visible := False;
//  end
//  else
//  begin
//    lbMsg.Caption := Mensagem;
//    ListBox1.Visible := False;
//    lbMsg.Visible := True;
//  end;
//
//  // Configurar os GIFs com base no tipo de alerta
//  gif_alert.Visible := AlertType = 'alert';
//  gif_sucess.Visible := AlertType = 'success';
//  gif_error.Visible := AlertType = 'error';
//
//  // Configurar os botões de acordo com o tipo de alerta
//  btn_ok.Visible := AlertType <> 'confirm';
//  btn_sim.Visible := AlertType = 'confirm';
//  btn_nao.Visible := AlertType = 'confirm';
//
//  AjustarFormulario;
//  ShowModal;
//  Result := FResult;
end;

procedure TFrmNewAlert.AjustarFormulario;
var
  TituloWidth, MensagemWidth, MaxWidth, ContentHeight, LineCount: Integer;
begin
  // Ajustar largura baseada no título e mensagem
  TituloWidth := Canvas.TextWidth(lbTitulo.Caption) + 200;
  MensagemWidth := TituloWidth;

  // Calcular a largura máxima, garantindo largura mínima de 300
  MaxWidth := Max(TituloWidth, MensagemWidth);
  MaxWidth := Max(MaxWidth, 300);  // Largura mínima

  // Ajustar a largura do formulário
  Width := MaxWidth;

  // Centralizar os componentes horizontalmente
  lbTitulo.Left := (Width - lbTitulo.Width) div 2;
  lbMsg.Left := (Width - lbMsg.Width) div 2;

  // Calcular o número de linhas no Memo (lbMsg) e ajustar a altura do formulário
  LineCount := lbMsg.Lines.Count;
  ContentHeight := LineCount * 15; // Aumento de 15 pixels por linha

  // Ajustar a altura total do formulário
  Height := Height + ContentHeight;//Panel1.Height + ContentHeight + lbTitulo.Height + 60;

  // Centralizar o formulário na tela
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;

  // Centralizar os GIFs
  gif_sucess.Left := (Width - gif_sucess.Width) div 2;
  gif_alert.Left := (Width - gif_alert.Width) div 2;
  gif_error.Left := (Width - gif_error.Width) div 2;
  gif_confirm.Left := (Width - gif_confirm.Width) div 2;

  // Centralizar os botões
  btn_ok.Left := (Width - btn_ok.Width) div 2;
  btn_sim.Left := (Width - btn_sim.Width) div 2;
  btn_nao.Left := (Width - btn_nao.Width) div 2;

  // Ajustar a posição dos botões sim e não
  btn_sim.Left := btn_sim.Left - btn_sim.Width;
  btn_nao.Left := btn_nao.Left + btn_nao.Width;

  // Garantir que o formulário fique visível
  self.BringToFront;
end;



end.

