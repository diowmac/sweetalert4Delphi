unit NewPanelAlert;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CurvyControls, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TFrmNewPanelAlert = class(TForm)
    Timer1: TTimer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmNewPanelAlert: TFrmNewPanelAlert;

implementation

{$R *.dfm}


end.
