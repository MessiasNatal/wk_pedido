unit DM.Pedido;

interface

uses
  System.SysUtils, System.Classes, DM.Padrao, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDMPedido = class(TDMPadrao)
    memPedido: TFDMemTable;
    memItem: TFDMemTable;
    dtsPedido: TDataSource;
    memPedidoid_pedido: TIntegerField;
    memPedidodata_emissao: TDateField;
    memPedidoid_cliente: TIntegerField;
    memItemid_pedido: TIntegerField;
    memItemid_produto: TIntegerField;
    memItemquantidade: TCurrencyField;
    memItemvalor_unitario: TCurrencyField;
    memItemvalor_total: TCurrencyField;
    memItemid_item: TIntegerField;
    memItemdescricao: TStringField;
    memItemvalor_total_itens: TAggregateField;
    memPedidonome: TStringField;
    procedure memPedidoAfterInsert(DataSet: TDataSet);
    procedure memItemAfterInsert(DataSet: TDataSet);
    procedure memItemquantidadeSetText(Sender: TField; const Text: string);
    procedure memPedidoBeforePost(DataSet: TDataSet);
    procedure memItemBeforePost(DataSet: TDataSet);
    procedure memPedidoAfterDelete(DataSet: TDataSet);
    procedure memPedidoAfterOpen(DataSet: TDataSet);
    procedure memPedidoAfterScroll(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  end;

implementation

uses
  Classe.Key, Classe.Utils, Classe.Query;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMPedido.memItemquantidadeSetText(Sender: TField; const Text: string);
begin
  inherited;
  //Calculo do total do item
  Sender.Value := Text;
  memItem.FieldByName('valor_total').AsCurrency := (memItem.FieldByName('valor_unitario').AsCurrency * Sender.Value);
end;

procedure TDMPedido.memPedidoAfterDelete(DataSet: TDataSet);
begin
  inherited;
  //Excluir da memoria
  memItem.First;
  while not memItem.Eof do
    memItem.Delete;
end;

procedure TDMPedido.memItemAfterInsert(DataSet: TDataSet);
begin
  inherited;
  //Squencial da tabela e da FK
  memItem.FieldByName('id_item').AsInteger := TKey.getKey('pedido_item','id_item');
  memItem.FieldByName('id_pedido').AsInteger := memPedido.FieldByName('id_pedido').AsInteger;
end;

procedure TDMPedido.memPedidoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  //Squencial da tabela
  memPedido.FieldByName('id_pedido').AsInteger := TKey.getKey('pedido','id_pedido');
  memPedido.FieldByName('data_emissao').AsDateTime := Date;
end;

procedure TDMPedido.memPedidoAfterOpen(DataSet: TDataSet);
const
  sqlPedidos =
    'select '+
    '  pedido.id_pedido, '+
    '  pedido.data_emissao, '+
    '  pedido.id_cliente, '+
    '  cliente.nome '+
    'from '+
    '  pedido '+
    '  inner join cliente on cliente.id_cliente = pedido.id_cliente';
var
  Qry: TQuery;
begin
  inherited;
  //Carrega os dados do banco
  Qry := TQuery.Create(Self,sqlPedidos,True);
  try
    while not Qry.Eof do
    begin
      memPedido.Append;
      memPedido.FieldByName('id_pedido').AsInteger := Qry.FieldByName('id_pedido').AsInteger;
      memPedido.FieldByName('data_emissao').AsDateTime := Qry.FieldByName('data_emissao').AsDateTime;
      memPedido.FieldByName('id_cliente').AsInteger := Qry.FieldByName('id_cliente').AsInteger;
      memPedido.FieldByName('nome').AsString := Qry.FieldByName('nome').AsString;
      memPedido.Post;

      Qry.Next;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TDMPedido.memPedidoAfterScroll(DataSet: TDataSet);
const
  sqlItens =
    'select '+
    '  pedido_item.id_item, '+
    '  pedido_item.id_pedido, '+
    '  pedido_item.id_produto, '+
    '  pedido_item.quantidade, '+
    '  pedido_item.valor_unitario, '+
    '  pedido_item.valor_total, '+
    '  produto.descricao '+
    'from '+
    '  pedido_item '+
    '  inner join produto on produto.id_produto = pedido_item.id_produto '+
    'where '+
    '  pedido_item.id_pedido = :id_pedido';
var
  Qry: TQuery;
begin
  inherited;
  //Na rolagem do grid carega os itens do pedido
  memItem.Close;
  memItem.Open;
  Qry := TQuery.Create(Self,sqlItens);
  try
    Qry.ParamByName('id_pedido').AsInteger := memPedido.FieldByName('id_pedido').AsInteger;
    Qry.Open;
    while not Qry.Eof do
    begin
      if not memItem.Active then
        memItem.Open;
      memItem.Append;
      memItem.FieldByName('id_item').AsInteger := Qry.FieldByName('id_item').AsInteger;
      memItem.FieldByName('id_pedido').AsInteger := Qry.FieldByName('id_pedido').AsInteger;
      memItem.FieldByName('id_produto').AsInteger := Qry.FieldByName('id_produto').AsInteger;
      memItem.FieldByName('quantidade').AsCurrency := Qry.FieldByName('quantidade').AsCurrency;
      memItem.FieldByName('valor_unitario').AsCurrency := Qry.FieldByName('valor_unitario').AsCurrency;
      memItem.FieldByName('valor_total').AsCurrency := Qry.FieldByName('valor_total').AsCurrency;
      memItem.FieldByName('descricao').AsString := Qry.FieldByName('descricao').AsString;
      memItem.Post;

      Qry.Next;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TDMPedido.memPedidoBeforePost(DataSet: TDataSet);
begin
  inherited;
  //Validação dos campos do dataset pela opção requiried
  if not TUtils.validaCampos(DataSet) then
    Abort;
end;

procedure TDMPedido.memItemBeforePost(DataSet: TDataSet);
begin
  inherited;
  //Validação dos campos do dataset pela opção requiried
  if not TUtils.validaCampos(DataSet) then
    Abort;
end;

procedure TDMPedido.DataModuleCreate(Sender: TObject);
begin
  inherited;
  memPedido.Open;
  memItem.Open;
end;

initialization
  RegisterClass(TDMPedido);

end.
