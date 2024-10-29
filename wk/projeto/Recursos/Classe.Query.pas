unit Classe.Query;

interface

uses
  System.Classes, System.SysUtils, FireDAC.Comp.Client;

type
  TQuery = class(TFDQuery)
  public
    constructor Create(AOwner: TComponent; SQL: string = ''; OpenQry: Boolean = False); reintroduce;
    destructor Destroy; override;
  end;

implementation

uses
  Classe.Conexao;

{ TQuery }

constructor TQuery.Create(AOwner: TComponent; SQL: string; OpenQry: Boolean);
begin
  inherited Create(AOwner);
  Self.Connection := ConexaoPrincipal.Connection;
  if SQL <> '' then
    Self.SQL.Add(SQL);
  if OpenQry then
    try
      Self.Open;
    except
      on e: Exception do
        raise Exception.Create(Format('Falha ao abrir query. Erro: %s',[e.Message]));
    end;
end;

destructor TQuery.Destroy;
begin

  inherited;
end;

end.
