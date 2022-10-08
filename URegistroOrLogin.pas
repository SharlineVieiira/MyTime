unit URegistroOrLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, Data.DB, System.permissions,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls, System.Actions, FMX.ActnList,
  FMX.TabControl, FMX.Edit, FMX.Objects, IdHashSHA, FMX.DialogService, UDMBD,
  UTelaInicial;

type
  TTelaDRegisterLogin = class(TForm)
    ActionList1: TActionList;
    ChangeTabActionEntrar: TChangeTabAction;
    ChangeTabActionRegister: TChangeTabAction;
    Layout1: TLayout;
    Layout2: TLayout;
    LabelRegistar: TLabel;
    Layout3: TLayout;
    LabelEntrada: TLabel;
    Layout4: TLayout;
    TabControl1: TTabControl;
    TabItemRegistrar: TTabItem;
    Layout9: TLayout;
    Layout11: TLayout;
    EditEmailRegister: TEdit;
    Image5: TImage;
    Layout12: TLayout;
    EditSenhaRegistro: TEdit;
    Image4: TImage;
    Layout14: TLayout;
    ImageOlhoCortadoRegistrar: TImage;
    ImagemOlhoAbertoRegistrar: TImage;
    Layout13: TLayout;
    RoundRect2: TRoundRect;
    Label3: TLabel;
    TabItemEntrar: TTabItem;
    Layout6: TLayout;
    EditSenhaEntrar: TEdit;
    Image2: TImage;
    Layout8: TLayout;
    ImageOlhoCortadoEntrar: TImage;
    ImagemOlhoAbertoEntrar: TImage;
    Layout7: TLayout;
    RoundRect1: TRoundRect;
    Label4: TLabel;
    Image8: TImage;
    Layout5: TLayout;
    EditEmailLogin: TEdit;
    Image1: TImage;
    procedure LabelRegistarClick(Sender: TObject);
    procedure LabelEntradaClick(Sender: TObject);
    procedure ImageOlhoCortadoRegistrarClick(Sender: TObject);
    procedure ImagemOlhoAbertoRegistrarClick(Sender: TObject);
    procedure ImageOlhoCortadoEntrarClick(Sender: TObject);
    procedure ImagemOlhoAbertoEntrarClick(Sender: TObject);
    procedure RoundRect2Click(Sender: TObject);
    procedure RoundRect1Click(Sender: TObject);

  private

    { Private declarations }

    { Public declarations }
  end;

var
  TelaDRegisterLogin: TTelaDRegisterLogin;

implementation

{$R *.fmx}

function SHA1FromString(const AString: string): string;
var
  SHA1: TIdHashSHA1;
begin
  SHA1 := TIdHashSHA1.Create;
  try
    Result := SHA1.HashStringAsHex(AString);
  finally
    SHA1.Free;
  end;
end;

procedure TTelaDRegisterLogin.ImageOlhoCortadoRegistrarClick(Sender: TObject);
begin
  ImageOlhoCortadoRegistrar.Visible := false;
  ImagemOlhoAbertoRegistrar.Visible := True;
  EditSenhaRegistro.Password := false;
end;

procedure TTelaDRegisterLogin.ImagemOlhoAbertoRegistrarClick(Sender: TObject);
begin
  ImageOlhoCortadoRegistrar.Visible := True;
  ImagemOlhoAbertoRegistrar.Visible := false;
  EditSenhaRegistro.Password := True;
end;

procedure TTelaDRegisterLogin.ImageOlhoCortadoEntrarClick(Sender: TObject);
begin
  ImageOlhoCortadoEntrar.Visible := false;
  ImagemOlhoAbertoEntrar.Visible := True;
  EditSenhaEntrar.Password := false;
end;

procedure TTelaDRegisterLogin.ImagemOlhoAbertoEntrarClick(Sender: TObject);
begin
  ImageOlhoCortadoEntrar.Visible := True;
  ImagemOlhoAbertoEntrar.Visible := false;
  EditSenhaEntrar.Password := True;
end;

procedure TTelaDRegisterLogin.LabelRegistarClick(Sender: TObject);
begin
  ChangeTabActionRegister.Execute;
end;

procedure TTelaDRegisterLogin.RoundRect1Click(Sender: TObject);
begin
  var
    senha: string;
  begin
    senha := SHA1FromString(EditSenhaEntrar.Text);
    DM.FDQPessoa.Close;
    DM.FDQPessoa.ParamByName('pnome').AsString := EditEmailLogin.Text;
    DM.FDQPessoa.Open();

    if not(DM.FDQPessoa.IsEmpty) and (DM.FDQPessoasenha.AsString = senha) then
    begin
      if not Assigned(Form4) then
        Application.CreateForm(TForm4, Form4);
      Form4.Show;
    end
    else
    begin
      ShowMessage('Login ou senha não confere');
    end;
  end;
end;

procedure TTelaDRegisterLogin.RoundRect2Click(Sender: TObject);
var
  senha: string;
begin
  senha := SHA1FromString(EditSenhaRegistro.Text);
  DM.FDQPessoa.Close;
  DM.FDQPessoa.Open();
  if (EditEmailRegister.Text = EmptyStr) or (EditSenhaRegistro.Text = EmptyStr)
  then
    Abort;

  DM.FDQPessoa.Close;
  DM.FDQPessoa.Open();
  if (EditEmailRegister.Text = EmptyStr) or (EditSenhaRegistro.Text = EmptyStr)
  then
    Abort;

  DM.FDQPessoa.Append;
  DM.FDQPessoaemail.AsString := EditEmailRegister.Text;
  DM.FDQPessoasenha.AsString := senha;

  DM.FDQPessoa.Post;
  DM.FDConnection1.CommitRetaining;

  ChangeTabActionEntrar.Execute;

end;

procedure TTelaDRegisterLogin.LabelEntradaClick(Sender: TObject);
begin
  ChangeTabActionEntrar.Execute;
end;

end.
