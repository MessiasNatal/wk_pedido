unit View.Pedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Padrao, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Classe.Padrao, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.Mask, System.UITypes;

type
  TViewPedido = class(TViewPadrao)
    dtsItem: TDataSource;
    dtsPedido: TDataSource;
    pgcPrincipal: TPageControl;
    tshGerarPedido: TTabSheet;
    tshPedidosGerados: TTabSheet;
    pnlConsulta: TPanel;
    grpConsulta: TGroupBox;
    lblCodigo: TLabel;
    lblDescricao: TLabel;
    lblValorUnitario: TLabel;
    btnPesquisarProduto: TSpeedButton;
    lblQuantidade: TLabel;
    lblValorTotal: TLabel;
    edtCodigo: TDBEdit;
    edtDescricao: TDBEdit;
    edtValorUnitario: TDBEdit;
    btnAdicionarItemPedido: TBitBtn;
    edtQuantidade: TDBEdit;
    edtValorTotal: TDBEdit;
    pnlPedido: TPanel;
    grpItensPedido: TGroupBox;
    grdItens: TDBGrid;
    pnlTotal: TPanel;
    txtTotal: TDBText;
    grpPedido: TGroupBox;
    lblCodigoCliente: TLabel;
    btnPesquisarCliente: TSpeedButton;
    lblNome: TLabel;
    lblNumeroPedidoTitulo: TLabel;
    pnlOperacoes: TPanel;
    btnSalvarPedido: TBitBtn;
    grpItensGerado: TGroupBox;
    grdItensGerado: TDBGrid;
    grpPedidoGerado: TGroupBox;
    grdPedidoGerado: TDBGrid;
    edtNumeroPedido: TDBEdit;
    edtCodigoCliente: TDBEdit;
    edtNomeCliente: TDBEdit;
    Panel1: TPanel;
    btnFechar: TBitBtn;
    btnExcluirPedido: TBitBtn;
    stbInfo: TStatusBar;
    btnNovoPedido: TBitBtn;
    btnCancelar: TBitBtn;
    pnlTotal2: TPanel;
    txtTotal2: TDBText;
    procedure btnPesquisarProdutoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAdicionarItemPedidoClick(Sender: TObject);
    procedure btnPesquisarClienteClick(Sender: TObject);
    procedure btnNovoPedidoClick(Sender: TObject);
    procedure dtsPedidoStateChange(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSalvarPedidoClick(Sender: TObject);
    procedure btnExcluirPedidoClick(Sender: TObject);
    procedure grdPedidoGeradoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure pgcPrincipalChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    Obj: TClassePadrao;
  end;

implementation

uses
  Classe.Pesquisa, Classe.Helpers;

{$R *.dfm}

procedure TViewPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := TCloseAction.caFree;
  ViewPadrao := nil;
end;

procedure TViewPedido.btnFecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TViewPedido.FormCreate(Sender: TObject);
begin
  inherited;
  //Instacia o objeto de pedido sem o acomplamento da classe TPedido apenas da TClassePadrao
  Obj := TClassePadrao.New(Self,'TPedido');
  dtsPedido.DataSet := Obj.Pedido.Model.DMPedido.memPedido;
  dtsItem.DataSet := Obj.Pedido.Model.DMPedido.memItem;

  pgcPrincipal.ActivePageIndex := 0;
end;

procedure TViewPedido.grdPedidoGeradoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  //Tecla enter no grid edita pedido
  if Key = VK_RETURN then
  begin
    dtsPedido.DataSet.Edit;
    dtsItem.DataSet.Edit;
  end;
end;

procedure TViewPedido.pgcPrincipalChange(Sender: TObject);
begin
  inherited;
  if not (dtsPedido.DataSet.State in [dsInsert, dsEdit]) then
    pgcPrincipal.ActivePage := tshPedidosGerados
  else
    pgcPrincipal.ActivePage := tshGerarPedido;
end;

procedure TViewPedido.btnCancelarClick(Sender: TObject);
begin
  inherited;
  //Cancelar a inserção/alteração
  dtsPedido.DataSet.Cancel;
  dtsItem.DataSet.Cancel;
end;

procedure TViewPedido.btnExcluirPedidoClick(Sender: TObject);
begin
  inherited;
  //Exclusão do Banco
  if dtsPedido.DataSet.IsEmpty then
    Exit;
  if MessageBox(0,'Confirma Exclusão?','Informação',MB_ICONQUESTION+MB_TASKMODAL+MB_YESNO)=ID_NO then
    Exit;
  Obj.Pedido.Excluir;
end;

procedure TViewPedido.btnSalvarPedidoClick(Sender: TObject);
begin
  inherited;
  //Salvar no banco
  Obj.Pedido.Gravar;
end;

procedure TViewPedido.btnNovoPedidoClick(Sender: TObject);
begin
  inherited;
  //Modo Inserção
  dtsPedido.DataSet.Append;
  dtsItem.DataSet.Append;
end;

procedure TViewPedido.btnAdicionarItemPedidoClick(Sender: TObject);
begin
  inherited;
  //Adiciona o item do pedido pesquisado
  dtsItem.DataSet.Post;
end;

procedure TViewPedido.btnPesquisarClienteClick(Sender: TObject);
begin
  inherited;
  //Se a pesquisa foi definida um item, aplica os dados na visualização do form
  TPesquisa.Cliente(edtCodigoCliente,edtNomeCliente);
end;

procedure TViewPedido.btnPesquisarProdutoClick(Sender: TObject);
begin
  inherited;
  //Se a pesquisa foi definida um item, aplica os dados na visualização do form
  if dtsItem.DataSet.State = dsBrowse then
    dtsItem.DataSet.Append;
  TPesquisa.Produto(edtCodigo,edtDescricao,edtValorUnitario);
end;

procedure TViewPedido.dtsPedidoStateChange(Sender: TObject);
begin
  inherited;
  //Controles de Tela/Componentes

  edtCodigo.ReadOnly := True;
  edtDescricao.ReadOnly := True;
  edtValorUnitario.ReadOnly := True;
  edtValorTotal.ReadOnly := True;

  btnExcluirPedido.Enabled := (dtsPedido.DataSet.State = dsBrowse) and (not dtsPedido.DataSet.IsEmpty);

  DefinirComponentes([grpPedido,grpItensPedido,grpConsulta],(dtsPedido.DataSet.State in [dsInsert, dsEdit]));

  if (dtsPedido.DataSet.State in [dsInsert, dsEdit]) then
    pgcPrincipal.ActivePage := tshGerarPedido
  else
    pgcPrincipal.ActivePage := tshPedidosGerados;
end;

initialization
  RegisterClass(TViewPedido);

end.
