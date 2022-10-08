unit UFormEntrar;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Ani,
  URegistroOrLogin;

type
  TTelaDeEntrada = class(TForm)
    Layout1: TLayout;
    Image1: TImage;
    Layout2: TLayout;
    RoundRect1: TRoundRect;
    Image2: TImage;
    Label1: TLabel;
    Layout3: TLayout;
    RoundRect2: TRoundRect;
    Image3: TImage;
    Label2: TLabel;
    Layout4: TLayout;
    RoundRect3: TRoundRect;
    Label3: TLabel;
    procedure Layout4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaDeEntrada: TTelaDeEntrada;

implementation

{$R *.fmx}

procedure TTelaDeEntrada.Layout4Click(Sender: TObject);
begin
  if not Assigned(TelaDRegisterLogin) then
    Application.CreateForm(TTelaDRegisterLogin, TelaDRegisterLogin);
  TelaDRegisterLogin.show;
end;

end.
