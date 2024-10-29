unit View.Pesquisa.Cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Pesquisa.Padrao, Data.DB, Vcl.StdCtrls, Vcl.Mask, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls;

type
  TViewPesquisaCliente = class(TViewPesquisaPadrao)
    procedure edtPesquisaChange(Sender: TObject);
  end;

implementation

{$R *.dfm}

procedure TViewPesquisaCliente.edtPesquisaChange(Sender: TObject);
begin
  dtsPesquisa.DataSet.Filtered := False;
  dtsPesquisa.DataSet.Filter := Format('lower(nome) like ''%s'' ',['%'+edtPesquisa.Text+'%']);
  inherited;
end;

end.
