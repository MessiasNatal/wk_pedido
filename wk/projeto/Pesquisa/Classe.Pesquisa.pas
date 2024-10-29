unit Classe.Pesquisa;

interface

uses
  System.Classes, Vcl.DBCtrls, System.UITypes, Vcl.Forms, Vcl.StdCtrls, System.SysUtils, View.Pesquisa.Produto, View.Pesquisa.Cliente;

type
  TPesquisa = class
    class function Produto(var edtCodigo, edtDescricao, edtValorUnitario: TDBEdit): Boolean;
    class function Cliente(var edtCodigo, edtNome: TDBEdit; edtCidade: TDBEdit = nil; edtUF: TDBEdit = nil): Boolean;
  end;

implementation

{ TPesquisa }

class function TPesquisa.Produto(var edtCodigo, edtDescricao, edtValorUnitario: TDBEdit): Boolean;
const
  sqlPesquisa =
    'select '+
    '  produto.id_produto, '+
    '  produto.descricao, '+
    '	 produto.valor_unitario '+
    'from '+
    '  produto';
var
  ViewPesquisa: TViewPesquisaProduto;
begin
  ViewPesquisa := TViewPesquisaProduto.Create(Application,sqlPesquisa);
  try
    ViewPesquisa.ShowModal;
    Result := (ViewPesquisa.ModalResult = mrOk);
    if Result then
    begin
      edtCodigo.DataSource.DataSet.FieldByName(edtCodigo.DataField).AsInteger := ViewPesquisa.dtsPesquisa.DataSet.FieldByName('id_produto').AsInteger;
      edtDescricao.DataSource.DataSet.FieldByName(edtDescricao.DataField).AsString := ViewPesquisa.dtsPesquisa.DataSet.FieldByName('descricao').AsString;
      edtValorUnitario.DataSource.DataSet.FieldByName(edtValorUnitario.DataField).AsCurrency := ViewPesquisa.dtsPesquisa.DataSet.FieldByName('valor_unitario').AsCurrency;
    end;
  finally
    ViewPesquisa.Free;
  end;
end;

class function TPesquisa.Cliente(var edtCodigo, edtNome: TDBEdit; edtCidade: TDBEdit = nil; edtUF: TDBEdit = nil): Boolean;
const
  sqlPesquisa =
    'select '+
    '  cliente.id_cliente, '+
    '  cliente.nome, '+
    '	 cliente.cidade, '+
    '	 cliente.uf '+
    'from '+
    '  cliente';
var
  ViewPesquisa: TViewPesquisaCliente;
begin
  ViewPesquisa := TViewPesquisaCliente.Create(Application,sqlPesquisa);
  try
    ViewPesquisa.ShowModal;
    Result := (ViewPesquisa.ModalResult = mrOk);
    if Result then
    begin
      edtCodigo.DataSource.DataSet.FieldByName(edtCodigo.DataField).AsInteger := ViewPesquisa.dtsPesquisa.DataSet.FieldByName('id_cliente').AsInteger;
      edtNome.DataSource.DataSet.FieldByName(edtNome.DataField).AsString := ViewPesquisa.dtsPesquisa.DataSet.FieldByName('nome').AsString;
      if edtCidade <> nil then
        edtCidade.DataSource.DataSet.FieldByName(edtCidade.DataField).AsString := ViewPesquisa.dtsPesquisa.DataSet.FieldByName('cidade').AsString;
      if edtUF <> nil then
        edtUF.DataSource.DataSet.FieldByName(edtUF.DataField).AsString := ViewPesquisa.dtsPesquisa.DataSet.FieldByName('uf').AsString;
    end;
  finally
    ViewPesquisa.Free;
  end;
end;

end.
