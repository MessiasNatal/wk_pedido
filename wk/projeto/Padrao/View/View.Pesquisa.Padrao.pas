unit View.Pesquisa.Padrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Padrao, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, DM.Pesquisa.Padrao;

type
  TViewPesquisaPadrao = class(TForm)
    dtsPesquisa: TDataSource;
    pnlPrincipal: TPanel;
    pnlGrid: TPanel;
    grdRegistros: TDBGrid;
    pnlInfo: TPanel;
    lblQtdRegistro: TLabel;
    lbOrdenacao: TLabel;
    lblDuplo: TLabel;
    pnlPesquisa: TPanel;
    lbPesquisa: TLabel;
    edtPesquisa: TMaskEdit;
    procedure dtsPesquisaDataChange(Sender: TObject; Field: TField);
    procedure edtPesquisaChange(Sender: TObject);
    procedure grdRegistrosDblClick(Sender: TObject);
  private
    DMPesquisa: TDMPesquisaPadrao;
  public
    constructor Create(AOwner: TComponent; SQLPesquisa: string); reintroduce;
  end;

implementation

{$R *.dfm}

constructor TViewPesquisaPadrao.Create(AOwner: TComponent; SQLPesquisa: string);
begin
  inherited Create(AOwner);

  DMPesquisa := TDMPesquisaPadrao.Create(Self);
  DMPesquisa.qyPesquisa.SQL.Add(SQLPesquisa);
  DMPesquisa.qyPesquisa.Open;

  dtsPesquisa.DataSet := DMPesquisa.qyPesquisa;
end;

procedure TViewPesquisaPadrao.dtsPesquisaDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  lblQtdRegistro.Caption := dtsPesquisa.DataSet.RecordCount.ToString + ' - Registro(s)';
end;

procedure TViewPesquisaPadrao.edtPesquisaChange(Sender: TObject);
begin
  dtsPesquisa.DataSet.Filter := LowerCase(dtsPesquisa.DataSet.Filter);
  dtsPesquisa.DataSet.Filtered := (edtPesquisa.Text <> '');
end;

procedure TViewPesquisaPadrao.grdRegistrosDblClick(Sender: TObject);
begin
  if not dtsPesquisa.DataSet.IsEmpty then
    ModalResult := mrOk;
end;

end.
