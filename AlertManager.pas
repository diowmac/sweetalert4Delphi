unit AlertManager;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.GIFImg,
  frxGIFGraphic, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxGDIPlusClasses, cxImage, Vcl.StdCtrls, NewPanelAlert;

type

  TAlertManager = class
  private
    class var FInstance: TAlertManager;
    FAlertForm: TForm;
    FPanelForm: TFrmNewPanelAlert;
    function CreateAlertForm: TForm;
    procedure ShowTransparentForm;
    procedure CloseTransparentForm;
    procedure SetupAlertForm(AlertType: string; const Titulo, Mensagem: string; const Mensagens: TStringList = nil);
    function ExecuteAlert: integer;
  public
    class function Instance: TAlertManager;
    function Alert(const Titulo, Mensagem: string): integer;
    function Success(const Titulo, Mensagem: string): integer;
    function Error(const Titulo, Mensagem: string): integer;
    function Confirm(const Titulo, Mensagem: string): integer;
    function ShowWithList(const Titulo: string; const Mensagens: TStringList): integer;
  end;

implementation

uses
  NewAlert;

{ TAlertManager }

function TAlertManager.CreateAlertForm: TForm;
begin
  Result := TFrmNewAlert.Create(nil);
end;

procedure TAlertManager.ShowTransparentForm;
begin
  FPanelForm := TFrmNewPanelAlert.Create(nil);
  try
    FPanelForm.FormStyle := fsNormal; // Alterar para fsNormal
    FPanelForm.BorderStyle := bsNone;
    FPanelForm.Color := clBlack;
    FPanelForm.AlphaBlend := True;
    FPanelForm.AlphaBlendValue := 128;
    FPanelForm.WindowState := wsMaximized;
    Application.ProcessMessages; // Garantir que o formulário seja exibido corretamente
  except
    FreeAndNil(FPanelForm);
    raise;
  end;
end;


procedure TAlertManager.CloseTransparentForm;
begin
  if Assigned(FPanelForm) then
  begin
    FPanelForm.Close;
    FreeAndNil(FPanelForm);
  end;
end;

procedure TAlertManager.SetupAlertForm(AlertType: string; const Titulo, Mensagem: string; const Mensagens: TStringList);
var
  AlertForm: TFrmNewAlert;
begin
  FAlertForm := CreateAlertForm;
  AlertForm := TFrmNewAlert(FAlertForm);

  AlertForm.lbTitulo.Caption := Titulo;
  AlertForm.lbMsg.Text := Mensagem;
  AlertForm.lbMsg.Visible := True;

  AlertForm.gif_alert.Visible := AlertType = 'alert';
  AlertForm.gif_sucess.Visible := AlertType = 'success';
  AlertForm.gif_error.Visible := AlertType = 'error';
  AlertForm.gif_confirm.Visible := AlertType = 'confirm';

  AlertForm.gif_alert.Align := alClient;
  AlertForm.gif_sucess.Align := alClient;
  AlertForm.gif_error.Align := alClient;
  AlertForm.gif_confirm.Align := alClient;

  AlertForm.btn_ok.Visible := AlertType <> 'confirm';
  AlertForm.btn_sim.Visible := AlertType = 'confirm';
  AlertForm.btn_nao.Visible := AlertType = 'confirm';

  AlertForm.AjustarFormulario;

  // Configurar para manter no topo
  TTimer.Create(nil).Interval := 10; // Tempo curto para corrigir o foco
//  TTimer.Create(nil).OnTimer := procedure(Sender: TObject)
//    begin
//      AlertForm.BringToFront;
//      TTimer(Sender).Free;
//    end;
end;

function TAlertManager.ExecuteAlert: integer;
begin
  try
    FPanelForm.Show;
    Application.ProcessMessages;
    SetForegroundWindow(FAlertForm.Handle); // Forçar o foco para o FAlertForm
    FAlertForm.ShowModal;
    Result := TFrmNewAlert(FAlertForm).Result;
  finally
    FAlertForm.Free;
  end;
end;


function TAlertManager.Alert(const Titulo, Mensagem: string): integer;
begin
  ShowTransparentForm;
  SetupAlertForm('alert', Titulo, Mensagem);
  Result := ExecuteAlert;
  CloseTransparentForm;
  abort;
end;

function TAlertManager.Success(const Titulo, Mensagem: string): integer;
begin
  ShowTransparentForm;
  SetupAlertForm('success', Titulo, Mensagem);
  Result := ExecuteAlert;
  CloseTransparentForm;
end;

function TAlertManager.Error(const Titulo, Mensagem: string): integer;
begin
  ShowTransparentForm;
  SetupAlertForm('error', Titulo, Mensagem);
  Result := ExecuteAlert;
  CloseTransparentForm;
  abort;
end;

function TAlertManager.Confirm(const Titulo, Mensagem: string): integer;
begin
  ShowTransparentForm;
  SetupAlertForm('confirm', Titulo, Mensagem);
  Result := ExecuteAlert;
  CloseTransparentForm;
end;

function TAlertManager.ShowWithList(const Titulo: string; const Mensagens: TStringList): integer;
begin
  ShowTransparentForm;
  SetupAlertForm('alert', Titulo, '', Mensagens);
  Result := ExecuteAlert;
  CloseTransparentForm;
end;

class function TAlertManager.Instance: TAlertManager;
begin
  if not Assigned(FInstance) then
    FInstance := TAlertManager.Create;
  Result := FInstance;
end;

end.

