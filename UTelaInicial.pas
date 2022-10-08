unit UTelaInicial;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Objects, FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,
  System.Actions, FMX.ActnList, FMX.MultiView, FMX.ListBox, UDMBD,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, FMX.ScrollBox,
  FMX.Memo, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, DB;

type
//  TForm4 = class(TForm)
//    TabControl: TTabControl;
//    TabMain: TTabItem;
//    StyleBook1: TStyleBook;
//    ActionList1: TActionList;
//    ActMain: TChangeTabAction;
//    MultiView: TMultiView;
//    Rectangle3: TRectangle;
//    Image2: TImage;
//    ListBox1: TListBox;
//    ListBoxItem1: TListBoxItem;
//    ListBoxItem2: TListBoxItem;
//    ListBoxItem3: TListBoxItem;
//    ListBoxItem4: TListBoxItem;
//    TabLancamentos: TTabItem;
//    ToolBar2: TToolBar;
//    SpeedButton1: TSpeedButton;
//    Label9: TLabel;
//    Rectangle4: TRectangle;
//    Label10: TLabel;
//    SpeedButton2: TSpeedButton;
//    SpeedButton3: TSpeedButton;
//    ListBox2: TListBox;
//    Rectangle5: TRectangle;
//    Layout6: TLayout;
//    Label11: TLabel;
//    Label12: TLabel;
//    Layout7: TLayout;
//    Label13: TLabel;
//    Label14: TLabel;
//    ActLancamentos: TChangeTabAction;
//    TabCategoria: TTabItem;
//    ToolBar3: TToolBar;
//    Label15: TLabel;
//    SpeedButton4: TSpeedButton;
//    SpeedButton5: TSpeedButton;
//    BindSourceDB1: TBindSourceDB;
//    BindingsList1: TBindingsList;
//    TabCategoriaCad: TTabItem;
//    ActCategoriaCad: TChangeTabAction;
//    ToolBar4: TToolBar;
//    Label16: TLabel;
//    btn_categoriacad_voltar: TSpeedButton;
//    Label17: TLabel;
//    edt_categoria: TEdit;
//    ActCategoria: TChangeTabAction;
//    ListView1: TListView;
//    btn_categoriacad_salvar: TSpeedButton;
//    Layout2: TLayout;
//    Layout3: TLayout;
//    Label5: TLabel;
//    Label6: TLabel;
//    Layout4: TLayout;
//    Label7: TLabel;
//    Label8: TLabel;
//    Layout5: TLayout;
//    img_receita: TImage;
//    img_despesa: TImage;
//    Rectangle2: TRectangle;
//    Label3: TLabel;
//    Label4: TLabel;
//    ToolBar1: TToolBar;
//    btn_menu: TSpeedButton;
//    procedure btn_acessarClick(Sender: TObject);
//
//    procedure ListBoxItem2Click(Sender: TObject);
//    procedure btn_categoriacad_voltarClick(Sender: TObject);
//    procedure ListBoxItem3Click(Sender: TObject);
//    procedure ListView1ItemClick(const Sender: TObject;
//      const AItem: TListViewItem);
//    procedure btn_categoriacad_salvarClick(Sender: TObject);

    TForm4 = class(TForm)
    TabControl: TTabControl;
    TabMain: TTabItem;
    StyleBook1: TStyleBook;
    ActionList1: TActionList;
    ActMain: TChangeTabAction;
    ToolBar1: TToolBar;
    btn_menu: TSpeedButton;
    Rectangle2: TRectangle;
    Label3: TLabel;
    Label4: TLabel;
    Layout2: TLayout;
    Layout3: TLayout;
    Label5: TLabel;
    Label6: TLabel;
    Layout4: TLayout;
    Label7: TLabel;
    Label8: TLabel;
    Layout5: TLayout;
    img_receita: TImage;
    img_despesa: TImage;
    MultiView: TMultiView;
    Rectangle3: TRectangle;
    Image2: TImage;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    TabLancamentos: TTabItem;
    ToolBar2: TToolBar;
    SpeedButton1: TSpeedButton;
    Label9: TLabel;
    Rectangle4: TRectangle;
    Label10: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    ListBox2: TListBox;
    Rectangle5: TRectangle;
    Layout6: TLayout;
    Label11: TLabel;
    Label12: TLabel;
    Layout7: TLayout;
    Label13: TLabel;
    Label14: TLabel;
    ActLancamentos: TChangeTabAction;
    TabCategoria: TTabItem;
    ToolBar3: TToolBar;
    Label15: TLabel;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    TabCategoriaCad: TTabItem;
    ActCategoriaCad: TChangeTabAction;
    ToolBar4: TToolBar;
    Label16: TLabel;
    btn_categoriacad_voltar: TSpeedButton;
    Label17: TLabel;
    edt_categoria: TEdit;
    ActCategoria: TChangeTabAction;
    ListView1: TListView;
    btn_categoriacad_salvar: TSpeedButton;
    TabDashboard: TTabItem;
    procedure btn_acessarClick(Sender: TObject);

    procedure ListBoxItem2Click(Sender: TObject);
    procedure btn_categoriacad_voltarClick(Sender: TObject);
    procedure ListBoxItem3Click(Sender: TObject);
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure btn_categoriacad_salvarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.fmx}

procedure TForm4.btn_acessarClick(Sender: TObject);
begin
        ActMain.ExecuteTarget(self);
end;

procedure TForm4.btn_categoriacad_salvarClick(Sender: TObject);
begin
        if dm.qry_categoria.State in dsEditModes  then
                dm.qry_categoria.Post;

        ActCategoria.ExecuteTarget(sender);
end;

procedure TForm4.btn_categoriacad_voltarClick(Sender: TObject);
begin
        if dm.qry_categoria.State in dsEditModes  then
                dm.qry_categoria.Cancel;

        ActCategoria.ExecuteTarget(sender);
end;


procedure TForm4.ListBoxItem2Click(Sender: TObject);
begin
        ActLancamentos.ExecuteTarget(self);
        MultiView.Visible := false;
end;

procedure TForm4.ListBoxItem3Click(Sender: TObject);
begin
        // Atualiza lista de categorias...
        dm.qry_categoria.Active := false;
        dm.qry_categoria.Active := true;

        // Esconde menu...
        MultiView.HideMaster;

        // Muda para aba Categoria...
        ActCategoria.ExecuteTarget(sender);
end;

procedure TForm4.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
        dm.qry_categoria.Edit;

        ActCategoriaCad.ExecuteTarget(sender);
end;

end.
