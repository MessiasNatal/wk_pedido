unit Classe.Key;

interface

uses
  Classe.Query, System.SysUtils, Data.DB, FireDAC.Stan.Param;

type
  TKey = class
    class function getKey(const Tabela: string; const Nome_Campo: string): Integer;
  end;

implementation


class function TKey.getKey(const Tabela: string; const Nome_Campo: string): Integer;
var
  Query: TQuery;
begin
  Query := TQuery.Create(nil);
  try
    repeat
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add('select ultimo_id from keys_increment where tabela = :tabela');
      Query.ParamByName('tabela').AsString := Tabela;
      Query.Open;

      if Query.IsEmpty then
      begin
        Query.Close;
        Query.SQL.Clear;
        Query.SQL.Add('select (max('+ Nome_Campo +'))as ''ultimo_id'' from ' + Tabela);
        Query.Open;
        begin
          if Query.IsEmpty then
            Result := 1
          else
            Result := Query.FieldByName('ultimo_id').AsInteger + 1;
        end;
        begin
          Query.Close;
          Query.SQL.Clear;
          Query.SQL.Add('insert into keys_increment (ultimo_id, tabela) values (:ultimo_id, :tabela)');
          Query.ParamByName('ultimo_id').AsInteger := Result;
          Query.ParamByName('tabela').AsString := Tabela;
          Query.ExecSQL;
        end;
      end
      else
      begin
        Result := Query.FieldByName('ultimo_id').AsInteger + 1;
        Query.Close;
        Query.SQL.Clear;
        Query.SQL.Add('update keys_increment set ultimo_id = :ultimo_id where tabela = :tabela');
        Query.ParamByName('ultimo_id').AsInteger := Result;
        Query.ParamByName('tabela').AsString := Tabela;
        Query.ExecSQL;
      end;

      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add('select '+ Nome_Campo +' from '+ Tabela +'  where '+ Nome_Campo +' = '+ Result.ToString +' ');
      Query.Open;

    until (Query.IsEmpty);

  finally
    Query.Free;
  end;
end;

end.

