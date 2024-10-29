unit DM.Pesquisa.Padrao;

interface

uses
  System.SysUtils, System.Classes, DM.Padrao, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDMPesquisaPadrao = class(TDMPadrao)
    qyPesquisa: TFDQuery;
  private
    FCamposExibicao: TStringList;
  public
    property CamposExibicao: TStringList read FCamposExibicao write FCamposExibicao;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
