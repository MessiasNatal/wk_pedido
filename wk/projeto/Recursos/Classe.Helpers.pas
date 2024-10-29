unit Classe.Helpers;

interface

uses
  Vcl.StdCtrls, System.SysUtils, Classe.Padrao, DM.Padrao, DM.Pedido, Classe.Pedido;

type
  THelperModel =  class helper for TDMPadrao
    function DMPedido: TDMPedido;
  end;

  THelperClassePadrao = class helper for TClassePadrao
    function Pedido: TPedido;
  end;

  THelperEdit = class helper for TCustomEdit
    function ToCurrency: Currency;
    function ToInteger: Integer;
    function isEmpty: Boolean;
    procedure Calc(ValueA, ValueB: Currency);
  end;

implementation

{ THelperModel }

function THelperModel.DMPedido: TDMPedido;
begin
  Result := TDMPedido(Self);
end;

{ THelperClassePadrao }

function THelperClassePadrao.Pedido: TPedido;
begin
  Result := TPedido(Self);
end;

{ THelperEdit }

procedure THelperEdit.Calc(ValueA, ValueB: Currency);
begin
  Self.Text := FormatCurr(',0.00',ValueA * ValueB);
end;

function THelperEdit.isEmpty: Boolean;
begin
  Result := (Self.Text = '');
end;

function THelperEdit.ToCurrency: Currency;
var
  Value: string;
begin
  Result := 0;
  if Self.Text = '' then
    Exit;
  Value := Self.Text;
  Value := StringReplace(Value,'.','',[rfReplaceAll]);
  Result := StrToCurr(Value);
end;

function THelperEdit.ToInteger: Integer;
begin
  Result := StrToInt(Self.Text);
end;

end.
