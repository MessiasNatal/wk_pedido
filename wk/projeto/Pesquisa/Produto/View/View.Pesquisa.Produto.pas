unit View.Pesquisa.Produto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Pesquisa.Padrao, Data.DB, Vcl.StdCtrls, Vcl.Mask, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls;

type
  TViewPesquisaProduto = class(TViewPesquisaPadrao)
    procedure edtPesquisaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  public
    constructor Create(AOwner: TComponent; SQLPesquisa: string); reintroduce;
  end;

implementation

{$R *.dfm}

{ TViewPesquisaProduto }

constructor TViewPesquisaProduto.Create(AOwner: TComponent; SQLPesquisa: string);
begin
  inherited Create(AOwner,SQLPesquisa);
end;

procedure TViewPesquisaProduto.edtPesquisaChange(Sender: TObject);
begin
  dtsPesquisa.DataSet.Filtered := False;
  dtsPesquisa.DataSet.Filter := Format('lower(descricao) like ''%s'' ',['%'+edtPesquisa.Text+'%']);
  inherited;
end;

procedure TViewPesquisaProduto.FormCreate(Sender: TObject);
begin
  inherited;
  TFloatField(dtsPesquisa.DataSet.FieldByName('valor_unitario')).currency := True;
end;

end.
