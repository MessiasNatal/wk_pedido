inherited ViewPesquisaProduto: TViewPesquisaProduto
  Caption = 'Pesquisa de Produto'
  OnCreate = FormCreate
  TextHeight = 15
  inherited pnlPrincipal: TPanel
    inherited pnlGrid: TPanel
      inherited grdRegistros: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'id_produto'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Title.Caption = 'Descri'#231#227'o'
            Width = 391
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor_unitario'
            Title.Caption = 'Valor Unit'#225'rio'
            Width = 115
            Visible = True
          end>
      end
    end
    inherited pnlPesquisa: TPanel
      inherited lbPesquisa: TLabel
        Width = 51
        Caption = 'Descri'#231#227'o'
        ExplicitWidth = 51
      end
      inherited edtPesquisa: TMaskEdit
        OnChange = edtPesquisaChange
      end
    end
  end
end
