unit Classe.Pedido;

interface

uses
  System.Classes, System.SysUtils, System.UITypes, Vcl.Dialogs, Classe.Padrao, Data.DB, FireDAC.Stan.Param;

type
  TPedido = class(TClassePadrao)
  public
    procedure Gravar;
    procedure Excluir;
  end;

implementation

uses
  Classe.Query, Classe.Helpers;

{ TPedido }

procedure TPedido.Gravar;
const
  sqlInserirPedido =
    'insert into pedido '+
    '  (id_pedido, '+
    '   data_emissao, '+
    '   id_cliente) '+
    'values '+
    '  (:id_pedido, '+
    '   :data_emissao, '+
    '   :id_cliente)';
  sqlInserirItem =
    'insert into pedido_item '+
    '  (id_item, '+
    '   id_pedido, '+
    '   id_produto, '+
    '   quantidade, '+
    '   valor_unitario, '+
    '   valor_total) '+
    'values '+
    '  (:id_item, '+
    '   :id_pedido, '+
    '   :id_produto, '+
    '   :quantidade, '+
    '   :valor_unitario, '+
    '   :valor_total)';
  sqlAlterarPedido =
    'update pedido set '+
    '  data_emissao = :data_emissao, '+
    '  id_cliente = :id_cliente '+
    'where '+
    ' id_pedido = :id_pedido';
  sqlAlterarItem =
    'update pedido_item set '+
    '  id_pedido = :id_pedido, '+
    '  id_produto = :id_produto, '+
    '  quantidade = :quantidade, '+
    '  valor_unitario = :valor_unitario, '+
    '  valor_total = :valor_total '+
    'where '+
    '  id_item = :id_item ';
var
  Qry: TQuery;
begin
  //Verifica o state do memtable e faz a inserção ou alteração do pedido
  Qry := TQuery.Create(Self);
  try
    try
      Qry.Connection.StartTransaction;

      //Pedido
      if FModel.DMPedido.memPedido.State = dsInsert then
        Qry.SQL.Text := sqlInserirPedido
      else
      if FModel.DMPedido.memPedido.State = dsEdit then
        Qry.SQL.Text := sqlAlterarPedido;

      Qry.ParamByName('id_pedido').AsInteger := FModel.DMPedido.memPedido.FieldByName('id_pedido').AsInteger;
      Qry.ParamByName('data_emissao').AsDateTime := FModel.DMPedido.memPedido.FieldByName('data_emissao').AsDateTime;
      Qry.ParamByName('id_cliente').AsInteger := FModel.DMPedido.memPedido.FieldByName('id_cliente').AsInteger;
      Qry.ExecSQL;

      //Itens
      if FModel.DMPedido.memPedido.State = dsInsert then
        Qry.SQL.Text := sqlInserirItem
      else
      if FModel.DMPedido.memPedido.State = dsEdit then
        Qry.SQL.Text := sqlAlterarItem;

      FModel.DMPedido.memItem.First;
      while not FModel.DMPedido.memItem.Eof do
      begin
        Qry.ParamByName('id_item').AsInteger := FModel.DMPedido.memItem.FieldByName('id_item').AsInteger;
        Qry.ParamByName('id_pedido').AsInteger := FModel.DMPedido.memItem.FieldByName('id_pedido').AsInteger;
        Qry.ParamByName('id_produto').AsInteger := FModel.DMPedido.memItem.FieldByName('id_produto').AsInteger;
        Qry.ParamByName('quantidade').AsCurrency := FModel.DMPedido.memItem.FieldByName('quantidade').AsCurrency;
        Qry.ParamByName('valor_unitario').AsCurrency := FModel.DMPedido.memItem.FieldByName('valor_unitario').AsCurrency;
        Qry.ParamByName('valor_total').AsCurrency := FModel.DMPedido.memItem.FieldByName('valor_total').AsCurrency;
        Qry.ExecSQL;

        FModel.DMPedido.memItem.Next;
      end;

      Qry.Connection.Commit;

      FModel.DMPedido.memPedido.Post;

    except
      on e: Exception do
      begin
        Qry.Connection.Rollback;
        MessageDlg(Format('Falha ao Gravar Pedido. Erro: %s',[e.Message]),TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0);
      end;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TPedido.Excluir;
const
  sqlExcluir=
    'delete from pedido '+
    'where '+
    '  id_pedido = :id_pedido';
var
  Qry: TQuery;
begin
  //Realiza a exclusão do banco e do dataset em memoria
  Qry := TQuery.Create(Self);
  try
    Qry.Connection.StartTransaction;
    try
      Qry.SQL.Add(sqlExcluir);
      Qry.ParamByName('id_pedido').AsInteger := FModel.DMPedido.memPedido.FieldByName('id_pedido').AsInteger;
      Qry.ExecSQL;
      Qry.Connection.Commit;

      FModel.DMPedido.memPedido.Delete;
    except
      on e: Exception do
      begin
        Qry.Connection.Rollback;
        MessageDlg(Format('Falha ao Excluir Pedido. Erro: %s',[e.Message]),TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0);
      end;
    end;
  finally
    Qry.Free;
  end;
end;

initialization
  RegisterClass(TPedido);

end.
