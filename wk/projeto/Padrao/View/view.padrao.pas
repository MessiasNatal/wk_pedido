unit View.Padrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls, Classe.Padrao;

type
  TPadraoViewClass = class of TViewPadrao;

  TViewPadrao = class(TForm)
    pnlPrincipal: TPanel;
  private
    FObjPadrao: TClassePadrao;
    FPagina: TTabSheet;
  public
    constructor Create(AOwner: TComponent; ControlePaginas: TPageControl); reintroduce;
    procedure FocarPagina;
    procedure DefinirComponentes(Componente: array of TComponent; Ativar: Boolean);
    class function New(AOwner: TComponent; ClassName: string; ControlePaginas: TPageControl): TViewPadrao;
  end;

var
  ViewPadrao: TViewPadrao;

implementation

{$R *.dfm}

constructor TViewPadrao.Create(AOwner: TComponent; ControlePaginas: TPageControl);
var
  ObjClassName: string;
begin
  inherited Create(AOwner);

  //Aba do formulário de pedido
  FPagina := TTabSheet.Create(Self);
  pnlPrincipal.Parent := FPagina;
  FPagina.PageControl := ControlePaginas;

  //Definição do nome da aba com base na descrição do formulário
  FPagina.Caption := Self.Caption;

  //Definição do icone com base na tag do formulário
  FPagina.ImageIndex := Self.Tag;

  //Definição da abertura da pagina
  FocarPagina;

  //Instancia o Objeto da View
  ObjClassName := 'T' + Copy(Self.ClassName,6,Length(Self.ClassName));
  FObjPadrao := TClassePadrao.New(Self,ObjClassName);
end;

procedure TViewPadrao.DefinirComponentes(Componente: array of TComponent; Ativar: Boolean);
var
  i, x: Integer;
begin
  //Habilita ou Desabilita componentes
  for x := Low(Componente) to High(Componente) do
    if Componente[x] is TGroupBox then
      for i := 0 to Pred(TGroupBox(Componente[x]).ControlCount) do
        TGroupBox(Componente[x]).Controls[i].Enabled := Ativar;
end;

procedure TViewPadrao.FocarPagina;
begin
  FPagina.PageControl.ActivePage := FPagina;
end;

class function TViewPadrao.New(AOwner: TComponent; ClassName: string; ControlePaginas: TPageControl): TViewPadrao;
var
  Obj: TPadraoViewClass;
begin
  //Instancia a classe pelo classname com o registro feito no inialization de cada view
  Result := nil;
  if Assigned(ViewPadrao) then
  begin
    ViewPadrao.FocarPagina;
    Exit;
  end;
  Obj := TPadraoViewClass(GetClass(ClassName));
  if Obj = nil then
    raise Exception.Create(Format('Classe não existe ou não esta registrada "%s".',[ClassName]))
  else
  begin
    Result := Obj.Create(AOwner,ControlePaginas) as TViewPadrao;
    ViewPadrao := Result;
  end;
end;

end.
