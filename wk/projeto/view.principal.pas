unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, System.ImageList,
  Vcl.ImgList;

type
  TViewPrincipal = class(TForm)
    pnlPrincipal: TPanel;
    tbcPrincipal: TTabControl;
    Panel1: TPanel;
    btnPedido: TSpeedButton;
    pgcView: TPageControl;
    imgPaginas: TImageList;
    procedure btnPedidoClick(Sender: TObject);
  end;

var
  ViewPrincipal: TViewPrincipal;

implementation

uses
  view.padrao;

{$R *.dfm}

procedure TViewPrincipal.btnPedidoClick(Sender: TObject);
begin
  TViewPadrao.New(Self,'TViewPedido',pgcView);
end;

end.
