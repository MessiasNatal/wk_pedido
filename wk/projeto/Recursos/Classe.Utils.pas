unit Classe.Utils;

interface

uses
  Vcl.Forms, Data.DB, Vcl.Dialogs, System.UITypes;

type
  TUtils = class
    class function validaCampos(pDataSet: TDataSet): Boolean; overload;
  end;

implementation

{ TUtils }

class function TUtils.validaCampos(pDataSet: TDataSet): Boolean;
var
  i: integer;
  Campos : string;
  Mensagem: string;
begin
  Result := True;
  Campos := '';
  for i := 0 to pDataSet.FieldCount - 1 do
  begin
    if pDataSet.Fields[i].Required then
    begin
      if pDataSet.Fields[i].DataType=ftWideString then
      begin
        if (pDataSet.Fields[i].IsNull) or (pDataSet.fields[i].AsString = '') then
        begin
          Campos := Campos + pDataSet.Fields[i].DisplayLabel + sLineBreak;
          Result:=False;
        end;
      end
      else if pDataSet.Fields[i].DataType=ftWideString then
      begin
        if (pDataSet.Fields[i].IsNull) or (pDataSet.fields[i].AsString = '') then
        begin
          Campos := Campos + pDataSet.Fields[i].DisplayLabel + sLineBreak;
          Result:=False;
        end;
      end
      else if (pDataSet.Fields[i].DataType=ftinteger) then
      begin
        if (pDataSet.Fields[i].IsNull) {or (pDataSet.fields[i].asinteger=0)} then
        begin
          Campos := Campos + pDataSet.Fields[i].DisplayLabel + sLineBreak;
          Result:=False;
        end;
      end
      else if (pDataSet.fields[i].datatype=ftcurrency) then
      begin
        if (pDataSet.Fields[i].IsNull) or (pDataSet.fields[i].ascurrency = 0) then
        begin
          Campos := Campos + pDataSet.Fields[i].DisplayLabel + sLineBreak;
          Result:=False;
        end;
      end
      else if (pDataSet.fields[i].datatype=ftfloat) then
      begin
        if (pDataSet.Fields[i].IsNull) or (pDataSet.fields[i].asfloat = 0) then
        begin
          Campos := Campos + pDataSet.Fields[i].DisplayLabel + sLineBreak;
          Result:=False;
        end;
      end
      else if pDataSet.Fields[i].DataType=ftFMTBcd then
      begin
        if (pDataSet.Fields[i].IsNull) or (pDataSet.fields[i].AsFloat = 0) then
        begin
          Campos := Campos + pDataSet.Fields[i].DisplayLabel + sLineBreak;
          Result:=False;
        end;
      end
      else
      begin
        if (pDataSet.Fields[i].IsNull) or (pDataSet.fields[i].AsString = '') then
        begin
          Campos := Campos + pDataSet.Fields[i].DisplayLabel + sLineBreak;
          Result:=False;
        end;
      end;
    end;
  end;
  if not Result then
  begin
    Mensagem := 'Favor preencher o(s) seguinte(s) campo(s) obrigatório(s).' + sLineBreak + Campos;
    MessageDlg(Mensagem,TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0);
  end;
end;

end.
