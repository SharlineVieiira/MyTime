unit UDMBD;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.FMXUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, IOUtils;


type
  TDM = class(TDataModule)
    FDConnection1: TFDConnection;
    FDQPessoa: TFDQuery;
    FDQPessoaid: TFDAutoIncField;
    FDQPessoaemail: TStringField;
    FDQPessoasenha: TStringField;
    qry_categoria: TFDQuery;
    qry_categoriaID_CATEGORIA: TIntegerField;
    qry_categoriaDESCRICAO: TStringField;
    qry_lancamento: TFDQuery;
    procedure FDConnection1AfterConnect(Sender: TObject);
    procedure FDConnection1BeforeConnect(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}





procedure TDM.FDConnection1AfterConnect(Sender: TObject);
var
  strSQL: string;
begin
      strSQL :='create table IF NOT EXISTS pessoa(                          '+
               'id integer not null primary key autoincrement, '+
              'email varchar (300),                            '  +
               'senha varchar (300))';
 FDConnection1.ExecSQL(strSQL);
 FDQPessoa.Active := true;
end;

procedure TDM.FDConnection1BeforeConnect(Sender: TObject);
begin
var
  strPath: string;
begin
{$IF DEFINED(iOS) or DEFINED(ANDROID)}
  strPath := System.IOUtils.TPath.Combine(System.IOUtils.TPath.GetDocumentsPath,
    'BD.db');
{$ENDIF}
{$IFDEF MSWINDOWS}
  strPath:=System.IOUtils.TPath.Combine('C:\Users\MAX\Downloads\V.1.4\MyTime\BD\',
  'BD.db');
  {$ENDIF}
  FDConnection1.Params.Values['UseUnicode'] := 'False';
  FDConnection1.Params.Values['DATABASE'] := strPath;
end;

end ;
end.


