unit Classe.Conexao;

interface

uses
  System.Classes, System.SysUtils, Data.DB, Vcl.Forms, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Phys.MySQL,
  Vcl.Dialogs, System.UITypes;

type
  TConexao = class(TComponent)
  strict private
    FConnection: TFDConnection;
    FFDPhysMySQLDriverLink: TFDPhysMySQLDriverLink;
    procedure CarregarParametros;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Conectar;

    property Connection: TFDConnection read FConnection;
  end;

const
  Driver = 'MYSQL';
  CharSet = 'utf8mb4';
  Usuario = 'root';
  Senha = '1234';
var
  ConexaoPrincipal: TConexao;

implementation

uses
  Classe.Ini;

{ TConexao }

constructor TConexao.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FFDPhysMySQLDriverLink := TFDPhysMySQLDriverLink.Create(Self);
  FConnection := TFDConnection.Create(Self);

  FConnection.Name := 'ConnectionPrincipal';
  FConnection.LoginPrompt := False;
  CarregarParametros;
end;

destructor TConexao.Destroy;
begin

  inherited;
end;

procedure TConexao.CarregarParametros;
begin
  //Parametros da conexão via .ini
  FConnection.Params.AddPair('DriverID',Driver);
  FConnection.Params.AddPair('CharacterSet',CharSet);

  FConnection.Params.AddPair('Database',TIni.GetPathDataBase);
  FConnection.Params.AddPair('Server',TIni.GetHostDataBase);
  FConnection.Params.AddPair('Port',TIni.GetPortaDataBase.ToString);
  FConnection.Params.AddPair('LibrayName',TIni.GetLibDataBase);

  FConnection.Params.AddPair('User_Name',Usuario);
  FConnection.Params.AddPair('PassWord',Senha);
end;

procedure TConexao.Conectar;
begin
  try
    FConnection.Open;
  except
    on e: exception do
    begin
      MessageDlg('Falha ao conectar ao banco de dados. '+sLineBreak+sLineBreak+e.Message,TMsgDlgType.mtError,[TMsgDlgBtn.mbOK],0);
      Application.Terminate;
    end;
  end;
end;

initialization
  ConexaoPrincipal := TConexao.Create(Application);

end.
