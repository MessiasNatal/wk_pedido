unit Classe.Padrao;

interface

uses
  System.Classes, System.SysUtils, DM.Padrao;

type
  TPadraoClass = class of TClassePadrao;

  TClassePadrao = class(TComponent)
  protected
    FModel: TDMPadrao;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    class function New(AOwner: TComponent; ClassName: string): TClassePadrao;
    property Model: TDMPadrao read FModel write FModel;
  end;

implementation

constructor TClassePadrao.Create(AOwner: TComponent);
var
  DMClassName: string;
begin
  inherited Create(AOwner);
  DMClassName := 'TDM'+ Copy(Self.ClassName,2,Length(Self.ClassName));
  FModel := TDMPadrao.New(Self,DMClassName);
end;

destructor TClassePadrao.Destroy;
begin
  inherited;
end;

class function TClassePadrao.New(AOwner: TComponent; ClassName: string): TClassePadrao;
var
  Obj: TPadraoClass;
begin
  Obj := TPadraoClass(GetClass(ClassName));
  if Obj = nil then
    raise Exception.Create(Format('Classe não existe ou não esta registrada "%s".',[ClassName]))
  else
    Result := Obj.Create(AOwner) as TClassePadrao;
end;

end.
