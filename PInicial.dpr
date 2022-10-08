program PInicial;

uses
  System.StartUpCopy,
  FMX.Forms,
  UInicial in 'UInicial.pas' {TelaInicial},
  UFormEntrar in 'UFormEntrar.pas' {TelaDeEntrada},
  URegistroOrLogin in 'URegistroOrLogin.pas' {TelaDRegisterLogin},
  UTelaInicial in 'UTelaInicial.pas' {Form4},
  UDMBD in 'UDMBD.pas' {DM: TDataModule},
  DataSet.Serialize.Config in 'dataset-serialize-master\src\DataSet.Serialize.Config.pas',
  DataSet.Serialize.Consts in 'dataset-serialize-master\src\DataSet.Serialize.Consts.pas',
  DataSet.Serialize.Export in 'dataset-serialize-master\src\DataSet.Serialize.Export.pas',
  DataSet.Serialize.Import in 'dataset-serialize-master\src\DataSet.Serialize.Import.pas',
  DataSet.Serialize.Language in 'dataset-serialize-master\src\DataSet.Serialize.Language.pas',
  DataSet.Serialize in 'dataset-serialize-master\src\DataSet.Serialize.pas',
  DataSet.Serialize.UpdatedStatus in 'dataset-serialize-master\src\DataSet.Serialize.UpdatedStatus.pas',
  DataSet.Serialize.Utils in 'dataset-serialize-master\src\DataSet.Serialize.Utils.pas',
  uSuperChartLight in 'Fontes\Units\uSuperChartLight.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TTelaInicial, TelaInicial);
  Application.Run;
end.
