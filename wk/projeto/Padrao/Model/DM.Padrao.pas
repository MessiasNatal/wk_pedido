unit DM.Padrao;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Comp.Client;

type
  TPadraoDMClass = class of TDMPadrao;

  TDMPadrao = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  public
    class function New(AOwner: TComponent; ClassName: string): TDMPadrao;
  end;

implementation

uses
  Classe.Conexao;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMPadrao }

class function TDMPadrao.New(AOwner: TComponent; ClassName: string): TDMPadrao;
var
  Obj: TPadraoDMClass;
begin
  Obj := TPadraoDMClass(GetClass(ClassName));
  if Obj = nil then
    raise Exception.Create(Format('Classe não existe ou não esta registrada "%s".',[ClassName]))
  else
    Result := Obj.Create(AOwner) as TDMPadrao;
end;

procedure TDMPadrao.DataModuleCreate(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to Pred(Self.ComponentCount) do
  begin
    if Self.Components[i] is TFDMemTable then
      TFDMemTable(Self.Components[i]).Open
    else
    if Self.Components[i] is TFDQuery then
      try
        TFDQuery(Self.Components[i]).Connection := ConexaoPrincipal.Connection;
        if TFDQuery(Self.Components[i]).Text <> '' then
          TFDQuery(Self.Components[i]).Open;
      except
        on e: Exception do
          raise Exception.Create(Format('Falha ao abrir query %s. Erro: %s',[Self.Components[i].Name,e.Message]));
      end;
  end;
end;

end.
