unit UInicial;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, UFormEntrar;

type
  TTelaInicial = class(TForm)
    procedure Layout1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaInicial: TTelaInicial;

implementation

{$R *.fmx}

procedure TTelaInicial.Image1Click(Sender: TObject);
begin
  if not Assigned(TelaDeEntrada) then
    Application.CreateForm(TTelaDeEntrada, TelaDeEntrada);
  TelaDeEntrada.Show;

end;

procedure TTelaInicial.Layout1Click(Sender: TObject);
begin
  if not Assigned(TelaDeEntrada) then
    Application.CreateForm(TTelaDeEntrada, TelaDeEntrada);
  TelaDeEntrada.Show
end;

end.
