inherited ViewPesquisaCliente: TViewPesquisaCliente
  Caption = 'Pesquisa de Cliente'
  TextHeight = 15
  inherited pnlPrincipal: TPanel
    inherited pnlGrid: TPanel
      inherited grdRegistros: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'id_cliente'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Title.Caption = 'Nome'
            Width = 244
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cidade'
            Title.Caption = 'Cidade'
            Width = 183
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'uf'
            Title.Caption = 'UF'
            Width = 73
            Visible = True
          end>
      end
    end
    inherited pnlPesquisa: TPanel
      inherited lbPesquisa: TLabel
        Width = 33
        Caption = 'Nome'
        ExplicitWidth = 33
      end
    end
  end
end
