program wk_pedido;

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  System.SysUtils,
  view.padrao in 'Padrao\View\view.padrao.pas' {ViewPadrao},
  Classe.Padrao in 'Padrao\Classe\Classe.Padrao.pas',
  DM.Padrao in 'Padrao\Model\DM.Padrao.pas' {DMPadrao: TDataModule},
  view.principal in 'view.principal.pas' {ViewPrincipal},
  View.Pedido in 'Pedido\View\View.Pedido.pas' {ViewPedido},
  DM.Pedido in 'Pedido\Model\DM.Pedido.pas' {DMPedido: TDataModule},
  Classe.Pedido in 'Pedido\Classe\Classe.Pedido.pas',
  Classe.Helpers in 'Recursos\Classe.Helpers.pas',
  View.Pesquisa.Padrao in 'Padrao\View\View.Pesquisa.Padrao.pas' {ViewPesquisaPadrao},
  View.Pesquisa.Produto in 'Pesquisa\Produto\View\View.Pesquisa.Produto.pas' {ViewPesquisaProduto},
  Classe.Query in 'Recursos\Classe.Query.pas',
  Classe.Conexao in 'Recursos\Classe.Conexao.pas',
  Classe.Ini in 'Recursos\Classe.Ini.pas',
  DM.Pesquisa.Padrao in 'Padrao\Model\DM.Pesquisa.Padrao.pas' {DMPesquisaPadrao: TDataModule},
  Classe.Pesquisa in 'Pesquisa\Classe.Pesquisa.pas',
  View.Pesquisa.Cliente in 'Pesquisa\Cliente\View\View.Pesquisa.Cliente.pas' {ViewPesquisaCliente},
  Classe.Key in 'Recursos\Classe.Key.pas',
  Classe.Utils in 'Recursos\Classe.Utils.pas';

{$R *.res}

const
  dark = 'dark';
begin
  //Tema persoanlizado do sistema
  TStyleManager.LoadFromFile(ExtractFilePath(Application.ExeName)+'style\dark.vsf');
  TStyleManager.TrySetStyle(dark);

  //Gerenciamento MemoryLeak
  {$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}

  //Instancia a Conexão Principal do Projeto
  ConexaoPrincipal.Conectar;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TViewPrincipal, ViewPrincipal);
  Application.Run;
end.
