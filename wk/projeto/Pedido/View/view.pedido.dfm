inherited ViewPedido: TViewPedido
  Caption = 'Pedido de Venda'
  ClientHeight = 422
  ClientWidth = 787
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitWidth = 799
  ExplicitHeight = 460
  TextHeight = 15
  inherited pnlPrincipal: TPanel
    Width = 787
    Height = 422
    ExplicitWidth = 783
    ExplicitHeight = 421
    object pgcPrincipal: TPageControl
      Left = 0
      Top = 0
      Width = 787
      Height = 422
      ActivePage = tshPedidosGerados
      Align = alClient
      TabHeight = 30
      TabOrder = 0
      TabWidth = 130
      OnChange = pgcPrincipalChange
      ExplicitWidth = 783
      ExplicitHeight = 421
      object tshPedidosGerados: TTabSheet
        Caption = 'Pedidos Gerados'
        ImageIndex = 1
        object grpItensGerado: TGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 181
          Width = 773
          Height = 141
          Align = alBottom
          Caption = ' Itens do Pedido '
          TabOrder = 1
          ExplicitTop = 180
          ExplicitWidth = 769
          object grdItensGerado: TDBGrid
            AlignWithMargins = True
            Left = 5
            Top = 20
            Width = 763
            Height = 93
            Align = alClient
            BorderStyle = bsNone
            DataSource = dtsItem
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            OnKeyDown = grdPedidoGeradoKeyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'id_produto'
                Title.Caption = 'C'#243'd. Produto'
                Width = 79
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'descricao'
                Title.Caption = 'Descri'#231#227'o'
                Width = 225
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'quantidade'
                Title.Caption = 'Quantidade'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'valor_unitario'
                Title.Caption = 'Valor Unit'#225'rio'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'valor_total'
                Title.Caption = 'Valor Total'
                Width = 100
                Visible = True
              end>
          end
          object pnlTotal2: TPanel
            Left = 2
            Top = 116
            Width = 769
            Height = 23
            Align = alBottom
            TabOrder = 1
            ExplicitWidth = 765
            object txtTotal2: TDBText
              AlignWithMargins = True
              Left = 650
              Top = 4
              Width = 115
              Height = 15
              Align = alRight
              Alignment = taRightJustify
              DataField = 'valor_total_itens'
              DataSource = dtsItem
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ExplicitTop = 3
            end
          end
        end
        object grpPedidoGerado: TGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 773
          Height = 172
          Align = alClient
          Caption = ' Itens do Pedido '
          TabOrder = 0
          ExplicitWidth = 769
          ExplicitHeight = 171
          object grdPedidoGerado: TDBGrid
            AlignWithMargins = True
            Left = 5
            Top = 20
            Width = 763
            Height = 147
            Align = alClient
            BorderStyle = bsNone
            DataSource = dtsPedido
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            OnKeyDown = grdPedidoGeradoKeyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'id_pedido'
                Title.Caption = 'N'#176' Pedido'
                Width = 77
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'data_emissao'
                Title.Caption = 'Data Emiss'#227'o'
                Width = 87
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'id_cliente'
                Title.Caption = 'C'#243'digo'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'nome'
                Title.Caption = 'Nome Cliente'
                Width = 366
                Visible = True
              end>
          end
        end
        object Panel1: TPanel
          Left = 0
          Top = 325
          Width = 779
          Height = 38
          Align = alBottom
          TabOrder = 2
          ExplicitTop = 324
          ExplicitWidth = 775
          object btnFechar: TBitBtn
            AlignWithMargins = True
            Left = 655
            Top = 4
            Width = 120
            Height = 30
            Align = alRight
            Caption = 'Fechar'
            Glyph.Data = {
              42040000424D4204000000000000420000002800000010000000100000000100
              20000300000000040000000000000000000000000000000000000000FF0000FF
              0000FF0000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000005050CF895151CFA10000FF010000
              00000000000000000000000000000000FF015050D0A25050CF89000000000000
              00000000000000000000000000005252CF807575E6ED7C7CEBF15050CF950000
              00000000000000000000000000005050CF957B7BEBF27676E7EC5252CF800000
              00000000000000000000000000005151D19A7E7EEBF58F8FF7FF7F7FECF55252
              D19C00000000000000005353D09D7F7FECF58F8FF7FF7C7CEBF45252D0980000
              0000000000000000000000000000000000005353D19C7D7DEBF78F8FF7FF7D7D
              ECF25050CF955050CF957D7DECF28F8FF7FF7D7DEBF75353D19C000000000000
              000000000000000000000000000000000000000000005353D0977D7DECF48F8F
              F7FF7D7DEBF68080ECF68F8FF7FF7D7DEBF45353D19600000000000000000000
              00000000000000000000000000000000000000000000000000005353D1977D7D
              EBF48F8FF7FF8F8FF7FF7D7DEBF45353D1960000000000000000000000000000
              000000000000000000000000000000000000000000000000FF015050D0A27E7E
              EBF58F8FF7FF8F8FF7FF7E7EEBF55151CFA10000FF0100000000000000000000
              0000000000000000000000000000000000000000FF015151D0A37E7EECF78F8F
              F7FF7D7DEBF68080ECF68F8FF7FF7D7DEBF75252CFA100000000000000000000
              0000000000000000000000000000000000005050D09C7D7DEBF48F8FF7FF7E7E
              ECF85555D39C5656D2A07F7FEDF98F8FF7FF7D7DEBF45151CF9B000000000000
              00000000000000000000000000005252D19C7D7DEAF68F8FF7FF7F7FECF55252
              D09800000000000000005555D2997F7FECF58F8FF7FF7C7CEBF65353D19A0000
              00000000000000000000000000005353D1917C7CEBF38181EEF85454D29E0000
              FF0100000000000000000000FF015555D29F8181EEF87C7CEBF35353D1910000
              0000000000000000000000000000000000005252D17F5353D196000000000000
              0000000000000000000000000000000000005353D1965252D17F000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000}
            TabOrder = 2
            OnClick = btnFecharClick
            ExplicitLeft = 651
          end
          object btnExcluirPedido: TBitBtn
            AlignWithMargins = True
            Left = 130
            Top = 4
            Width = 120
            Height = 30
            Align = alLeft
            Caption = 'Excluir Pedido'
            Glyph.Data = {
              42040000424D4204000000000000420000002800000010000000100000000100
              20000300000000040000000000000000000000000000000000000000FF0000FF
              0000FF0000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000A1758BFFA1758BFFA1758BFFA175
              8BFFA1758BFFA1758BFFA1758BFFA1758BFFA1758BFFA1758BFF000000000000
              000000000000000000000000000000000000A1758BFFF2D5DCFFF2D5DCFFF2D5
              DCFFF2D5DCFFF2D5DCFFF2D5DCFFF2D5DCFFF2D5DCFFA1758BFF000000000000
              000000000000000000000000000000000000A1758BFFA1758BFFA1758BFFA175
              8BFFA1758BFFA1758BFFA1758BFFA1758BFFA1758BFFA1758BFF000000000000
              00000000000000000000000000009F8F80109F8D7AF9FFE8C2FFFFE8C2FFFFE8
              C2FFFFE8C2FFFFE8C2FFFFE8C2FFFFE8C2FFFFE8C2FF9F8E7AF99988770F0000
              00000000000000000000000000009A88772BA79681F1FFE8C2FFFFE8C2FFFFE8
              C2FFFFE8C2FFFFE8C2FFFFE8C2FFFFE8C2FFFFE8C2FFA89580F29E8C792A0000
              00000000000000000000000000009A8C7747B3A088F0F5DAB3FFBD865AFFB57B
              4FFFF4D7B1FFD0A278FFB57A4EFFBD865AFFF5DAB3FFB29F8AEF9D8A78460000
              00000000000000000000000000009C8C7864BFAD92F4EECFA8FFB67C4FFFE8C6
              9EFFFAE1BAFFF9E0BAFFE7C49CFFB57B4FFFEECFA8FFBFAB91F49D8B79630000
              00000000000000000000000000009C8C7981CDB89CFDFFE8C2FFC8966CFFD3A7
              7CFFFFE8C2FFFFE8C2FFFFE8C2FFEFD1AAFFFFE8C2FFCDB89CFD9E8C79810000
              0000000000000000000000000000A2917CA7D8C3A5FFFFE8C2FFF7DCB6FFEFD0
              A9FFFDE5BEFFECCDA5FFC18C61FFFFE8C2FFFFE8C2FFD7C3A4FFA3907CA60000
              0000000000000000000000000000A4927EC9E3CDADFFFFE8C2FFFFE8C2FFECCD
              A5FFC69469FFC38F64FFD4A87FFFFFE8C2FFFFE8C2FFE3CEACFFA4917EC80000
              0000000000000000000000000000A2917DE3EED8B6FFFFE8C2FFFFE8C2FFFBE2
              BCFFC69368FFC59166FFFAE1BBFFFFE8C2FFFFE8C2FFEED8B5FFA2927DE20000
              00000000000000000000000000009E8D79F8F9E2BEFFFFE8C2FFFFE8C2FFFFE8
              C2FFFFE8C2FFFFE8C2FFFFE8C2FFFFE8C2FFFFE8C2FFF9E2BEFF9E8D7AF70000
              00000000000000000000A1758BFFA1758BFFA1758BFFA1758BFFA1758BFFA175
              8BFFA1758BFFA1758BFFA1758BFFA1758BFFA1758BFFA1758BFFA1758BFFA175
              8BFF0000000000000000A1758BFFF2D5DCFFF2D5DCFFF2D5DCFFF2D5DCFFF2D5
              DCFFF2D5DCFFF2D5DCFFF2D5DCFFF2D5DCFFF2D5DCFFF2D5DCFFF2D5DCFFA175
              8BFF0000000000000000A1758BFFA1758BFFA1758BFFA1758BFFA1758BFFA175
              8BFFA1758BFFA1758BFFA1758BFFA1758BFFA1758BFFA1758BFFA1758BFFA175
              8BFF00000000}
            TabOrder = 1
            OnClick = btnExcluirPedidoClick
          end
          object btnNovoPedido: TBitBtn
            AlignWithMargins = True
            Left = 4
            Top = 4
            Width = 120
            Height = 30
            Align = alLeft
            Caption = 'Novo Pedido'
            Glyph.Data = {
              42040000424D4204000000000000420000002800000010000000100000000100
              20000300000000040000000000000000000000000000000000000000FF0000FF
              0000FF0000000000000000000000000000000000000000000000000000000000
              0000000000008099660A769D5E7F769C5EDB769C5EFD769C5EDA759C5D7E71AA
              55090000000000000000000000009C8B78FF9C8B78FF9C8B78FF9C8B78FFA594
              82FFD7CFBDFF8CA874FF769C5EFF769C5EFF769C5EFF769C5EFF769C5EFF779C
              5EC88099660A00000000000000009C8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFB9CDADFF769C5EFF769C5EFF769C5EFFFFFFFFFF769C5EFF769C5EFF769C
              5EFF759C5D7E00000000000000009C8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF88A973FF769C5EFF769C5EFF769C5EFFFFFFFFFF769C5EFF769C5EFF769C
              5EFF769C5EDB00000000000000009C8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF799E62FF769C5EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF769C
              5EFF769C5EF800000000000000009C8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF88A973FF769C5EFF769C5EFF769C5EFFFFFFFFFF769C5EFF769C5EFF769C
              5EFF769C5EDB00000000000000009C8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFB9CDADFF769C5EFF769C5EFF769C5EFFFFFFFFFF769C5EFF769C5EFF769C
              5EFF759C5D7E00000000000000009C8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFF9FBF8FF93B180FF769C5EFF769C5EFF769C5EFF769C5EFF769C5EFF779C
              5EC88099660A00000000000000009C8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFAFBF9FFBBCEAFFF89AA75FF7FA369FF8AAA75FFAAB892FF71AA
              55090000000000000000000000009C8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC1B5A3FF0000
              00000000000000000000000000009C8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C8B78FF0000
              00000000000000000000000000009C8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF9C8B78FF9C8B78FF9C8B78FF9C8B78FF9C8B78FF0000
              00000000000000000000000000009C8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF9C8B78FFFFFFFFFFF9F8F7FFAC9E8EFEA0917EC70000
              00000000000000000000000000009C8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF9C8B78FFF9F8F7FFAD9E8FFFA0907FD1000000000000
              00000000000000000000000000009C8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF9C8B78FFAC9D8EFFA29381C800000000000000000000
              00000000000000000000000000009C8B78FF9C8B78FF9C8B78FF9C8B78FF9C8B
              78FF9C8B78FF9C8B78FF9C8B78FFA0907ECA0000000000000000000000000000
              000000000000}
            TabOrder = 0
            OnClick = btnNovoPedidoClick
          end
        end
        object stbInfo: TStatusBar
          Left = 0
          Top = 363
          Width = 779
          Height = 19
          Panels = <
            item
              Text = 'Enter - Alterar Pedido'
              Width = 50
            end>
          ExplicitTop = 362
          ExplicitWidth = 775
        end
      end
      object tshGerarPedido: TTabSheet
        Caption = 'Gerar Pedido'
        object pnlConsulta: TPanel
          Left = 594
          Top = 0
          Width = 185
          Height = 382
          Align = alRight
          TabOrder = 1
          object grpConsulta: TGroupBox
            AlignWithMargins = True
            Left = 3
            Top = 4
            Width = 178
            Height = 374
            Align = alRight
            Caption = ' Consulta '
            TabOrder = 0
            object lblCodigo: TLabel
              Left = 16
              Top = 22
              Width = 39
              Height = 15
              Caption = 'C'#243'digo'
            end
            object lblDescricao: TLabel
              Left = 16
              Top = 72
              Width = 51
              Height = 15
              Caption = 'Descri'#231#227'o'
            end
            object lblValorUnitario: TLabel
              Left = 16
              Top = 120
              Width = 71
              Height = 15
              Caption = 'Valor Unit'#225'rio'
            end
            object btnPesquisarProduto: TSpeedButton
              Left = 135
              Top = 40
              Width = 32
              Height = 25
              Glyph.Data = {
                42040000424D4204000000000000420000002800000010000000100000000100
                20000300000000040000000000000000000000000000000000000000FF0000FF
                0000FF0000000000000000000000000000000000000000000000000000000000
                0000000000008099660A769D5E7F769C5EDB769C5EFD769C5EDA759C5D7E71AA
                55090000000000000000000000009C8B78FF9C8B78FF9C8B78FF9C8B78FFA594
                82FFD7CFBDFF8CA874FF769C5EFF769C5EFF769C5EFF769C5EFF769C5EFF779C
                5EC88099660A00000000000000009C8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFB9CDADFF769C5EFF769C5EFF769C5EFFFFFFFFFF769C5EFF769C5EFF769C
                5EFF759C5D7E00000000000000009C8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFF88A973FF769C5EFF769C5EFF769C5EFFFFFFFFFF769C5EFF769C5EFF769C
                5EFF769C5EDB00000000000000009C8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFF799E62FF769C5EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF769C
                5EFF769C5EF800000000000000009C8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFF88A973FF769C5EFF769C5EFF769C5EFFFFFFFFFF769C5EFF769C5EFF769C
                5EFF769C5EDB00000000000000009C8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFB9CDADFF769C5EFF769C5EFF769C5EFFFFFFFFFF769C5EFF769C5EFF769C
                5EFF759C5D7E00000000000000009C8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFF9FBF8FF93B180FF769C5EFF769C5EFF769C5EFF769C5EFF769C5EFF779C
                5EC88099660A00000000000000009C8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFAFBF9FFBBCEAFFF89AA75FF7FA369FF8AAA75FFAAB892FF71AA
                55090000000000000000000000009C8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC1B5A3FF0000
                00000000000000000000000000009C8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C8B78FF0000
                00000000000000000000000000009C8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFF9C8B78FF9C8B78FF9C8B78FF9C8B78FF9C8B78FF0000
                00000000000000000000000000009C8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFF9C8B78FFFFFFFFFFF9F8F7FFAC9E8EFEA0917EC70000
                00000000000000000000000000009C8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFF9C8B78FFF9F8F7FFAD9E8FFFA0907FD1000000000000
                00000000000000000000000000009C8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFF9C8B78FFAC9D8EFFA29381C800000000000000000000
                00000000000000000000000000009C8B78FF9C8B78FF9C8B78FF9C8B78FF9C8B
                78FF9C8B78FF9C8B78FF9C8B78FFA0907ECA0000000000000000000000000000
                000000000000}
              OnClick = btnPesquisarProdutoClick
            end
            object lblQuantidade: TLabel
              Left = 16
              Top = 175
              Width = 62
              Height = 15
              Caption = 'Quantidade'
            end
            object lblValorTotal: TLabel
              Left = 16
              Top = 232
              Width = 81
              Height = 15
              Caption = 'Valor Total Item'
            end
            object edtCodigo: TDBEdit
              Left = 16
              Top = 41
              Width = 113
              Height = 23
              DataField = 'id_produto'
              DataSource = dtsItem
              TabOrder = 0
            end
            object edtDescricao: TDBEdit
              Left = 16
              Top = 91
              Width = 145
              Height = 23
              DataField = 'descricao'
              DataSource = dtsItem
              TabOrder = 1
            end
            object edtValorUnitario: TDBEdit
              Left = 16
              Top = 137
              Width = 145
              Height = 23
              DataField = 'valor_unitario'
              DataSource = dtsItem
              TabOrder = 2
            end
            object btnAdicionarItemPedido: TBitBtn
              AlignWithMargins = True
              Left = 29
              Top = 288
              Width = 120
              Height = 30
              Margins.Left = 14
              Margins.Right = 14
              Margins.Bottom = 6
              Caption = 'Salvar Item'
              Glyph.Data = {
                42040000424D4204000000000000420000002800000010000000100000000100
                20000300000000040000000000000000000000000000000000000000FF0000FF
                0000FF0000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000A1758BFFA1758BFFA1758BFFA1758BFFA1758BFFA175
                8BFFA1758BFFA1758BFFA1758BFFA1758BFFA1758BFFA1758BFFA1758BFFA175
                8BFF0000000000000000A1758BFFF2D5DCFFF2D5DCFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2D5DCFFF2D5DCFFA175
                8BFF0000000000000000A1758BFFF2D5DCFFF2D5DCFFFFFFFFFFFFE8C2FFFFE8
                C2FFFFE8C2FFFFE8C2FFFFE8C2FFFFE8C2FFFFFFFFFFF2D5DCFFF2D5DCFFA175
                8BFF0000000000000000A1758BFFF2D5DCFFF2D5DCFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2D5DCFFF2D5DCFFA175
                8BFF0000000000000000A1758BFFF2D5DCFFF2D5DCFFFFFFFFFFFFE8C2FFFFE8
                C2FFFFE8C2FFFFE8C2FFFFE8C2FFFFE8C2FFFFFFFFFFF2D5DCFFF2D5DCFFA175
                8BFF0000000000000000A1758BFFF2D5DCFFF2D5DCFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2D5DCFFF2D5DCFFA175
                8BFF0000000000000000A1758BFFF2D5DCFFF2D5DCFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2D5DCFFF2D5DCFFA175
                8BFF0000000000000000A1758BFFF2D5DCFFF2D5DCFFF2D5DCFFF2D5DCFFF2D5
                DCFFF2D5DCFFF2D5DCFFF2D5DCFFF2D5DCFFF2D5DCFFF2D5DCFFF2D5DCFFA175
                8BFF0000000000000000A1758BFFF2D5DCFFF2D5DCFFF2D5DCFFF2D5DCFFF2D5
                DCFFF2D5DCFFF2D5DCFFF2D5DCFFF2D5DCFFF2D5DCFFF2D5DCFFF2D5DCFFA175
                8BFF0000000000000000A1758BFFF2D5DCFFF2D5DCFFE9C0CBFFA48B7EFF8F79
                66FF8F7966FF8F7966FF8F7966FF8F7966FFA79183FFF2D5DCFFF2D5DCFFA175
                8BFF0000000000000000A1758BFFF2D5DCFFF2D5DCFFE6BAC6FF8F7966FFF2EB
                E1FFF2EBE1FFF2EBE1FF9C8B78FFF2EBE1FF8F7966FFF2D5DCFFEACCD4FFA175
                8BFF0000000000000000A1758BFFF2D5DCFFF2D5DCFFE6BAC6FF8F7966FFF2EB
                E1FFF2EBE1FFF2EBE1FF9C8B78FFF2EBE1FF8F7966FFEBCDD5FFAD8496F4A67A
                8F860000000000000000A1758BFFF2D5DCFFF2D5DCFFE6BAC6FF8F7966FFF2EB
                E1FFF2EBE1FFF2EBE1FFF2EBE1FFF2EBE1FF8F7966FFAB8195F6A47B907E0000
                00000000000000000000A1758BFFA1758BFFA1758BFFA1758BFF977E73FF8F79
                66FF8F7966FF8F7966FF8F7966FF8F7966FF987D74FFA579907C000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000}
              TabOrder = 5
              OnClick = btnAdicionarItemPedidoClick
            end
            object edtQuantidade: TDBEdit
              Left = 16
              Top = 193
              Width = 145
              Height = 23
              DataField = 'quantidade'
              DataSource = dtsItem
              TabOrder = 3
            end
            object edtValorTotal: TDBEdit
              Left = 16
              Top = 249
              Width = 145
              Height = 23
              DataField = 'valor_total'
              DataSource = dtsItem
              ReadOnly = True
              TabOrder = 4
            end
          end
        end
        object pnlPedido: TPanel
          Left = 0
          Top = 0
          Width = 594
          Height = 382
          Align = alClient
          TabOrder = 0
          object grpItensPedido: TGroupBox
            AlignWithMargins = True
            Left = 4
            Top = 98
            Width = 586
            Height = 242
            Align = alClient
            Caption = ' Itens do Pedido '
            TabOrder = 1
            object grdItens: TDBGrid
              AlignWithMargins = True
              Left = 5
              Top = 20
              Width = 576
              Height = 194
              Align = alClient
              BorderStyle = bsNone
              DataSource = dtsItem
              Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -12
              TitleFont.Name = 'Segoe UI'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'id_produto'
                  Title.Caption = 'C'#243'd. Produto'
                  Width = 79
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'descricao'
                  Title.Caption = 'Descri'#231#227'o'
                  Width = 225
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'quantidade'
                  Title.Caption = 'Quantidade'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'valor_unitario'
                  Title.Caption = 'Valor Unit'#225'rio'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'valor_total'
                  Title.Caption = 'Valor Total'
                  Width = 100
                  Visible = True
                end>
            end
            object pnlTotal: TPanel
              Left = 2
              Top = 217
              Width = 582
              Height = 23
              Align = alBottom
              TabOrder = 1
              object txtTotal: TDBText
                AlignWithMargins = True
                Left = 463
                Top = 4
                Width = 115
                Height = 15
                Align = alRight
                Alignment = taRightJustify
                DataField = 'valor_total_itens'
                DataSource = dtsItem
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
                ExplicitLeft = 460
                ExplicitTop = 2
                ExplicitHeight = 13
              end
            end
          end
          object grpPedido: TGroupBox
            AlignWithMargins = True
            Left = 4
            Top = 4
            Width = 586
            Height = 88
            Align = alTop
            Caption = ' Pedido '
            TabOrder = 0
            object lblCodigoCliente: TLabel
              Left = 104
              Top = 25
              Width = 39
              Height = 15
              Caption = 'C'#243'digo'
            end
            object btnPesquisarCliente: TSpeedButton
              Left = 415
              Top = 43
              Width = 32
              Height = 25
              Glyph.Data = {
                42040000424D4204000000000000420000002800000010000000100000000100
                20000300000000040000000000000000000000000000000000000000FF0000FF
                0000FF0000000000000000000000000000000000000000000000000000000000
                0000000000008099660A769D5E7F769C5EDB769C5EFD769C5EDA759C5D7E71AA
                55090000000000000000000000009C8B78FF9C8B78FF9C8B78FF9C8B78FFA594
                82FFD7CFBDFF8CA874FF769C5EFF769C5EFF769C5EFF769C5EFF769C5EFF779C
                5EC88099660A00000000000000009C8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFB9CDADFF769C5EFF769C5EFF769C5EFFFFFFFFFF769C5EFF769C5EFF769C
                5EFF759C5D7E00000000000000009C8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFF88A973FF769C5EFF769C5EFF769C5EFFFFFFFFFF769C5EFF769C5EFF769C
                5EFF769C5EDB00000000000000009C8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFF799E62FF769C5EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF769C
                5EFF769C5EF800000000000000009C8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFF88A973FF769C5EFF769C5EFF769C5EFFFFFFFFFF769C5EFF769C5EFF769C
                5EFF769C5EDB00000000000000009C8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFB9CDADFF769C5EFF769C5EFF769C5EFFFFFFFFFF769C5EFF769C5EFF769C
                5EFF759C5D7E00000000000000009C8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFF9FBF8FF93B180FF769C5EFF769C5EFF769C5EFF769C5EFF769C5EFF779C
                5EC88099660A00000000000000009C8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFAFBF9FFBBCEAFFF89AA75FF7FA369FF8AAA75FFAAB892FF71AA
                55090000000000000000000000009C8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC1B5A3FF0000
                00000000000000000000000000009C8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C8B78FF0000
                00000000000000000000000000009C8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFF9C8B78FF9C8B78FF9C8B78FF9C8B78FF9C8B78FF0000
                00000000000000000000000000009C8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFF9C8B78FFFFFFFFFFF9F8F7FFAC9E8EFEA0917EC70000
                00000000000000000000000000009C8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFF9C8B78FFF9F8F7FFAD9E8FFFA0907FD1000000000000
                00000000000000000000000000009C8B78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFF9C8B78FFAC9D8EFFA29381C800000000000000000000
                00000000000000000000000000009C8B78FF9C8B78FF9C8B78FF9C8B78FF9C8B
                78FF9C8B78FF9C8B78FF9C8B78FFA0907ECA0000000000000000000000000000
                000000000000}
              OnClick = btnPesquisarClienteClick
            end
            object lblNome: TLabel
              Left = 159
              Top = 25
              Width = 73
              Height = 15
              Caption = 'Nome Cliente'
            end
            object lblNumeroPedidoTitulo: TLabel
              Left = 16
              Top = 25
              Width = 54
              Height = 15
              Caption = 'N'#176' Pedido'
            end
            object edtNumeroPedido: TDBEdit
              Left = 16
              Top = 44
              Width = 82
              Height = 23
              DataField = 'id_pedido'
              DataSource = dtsPedido
              TabOrder = 0
            end
            object edtCodigoCliente: TDBEdit
              Left = 104
              Top = 44
              Width = 49
              Height = 23
              DataField = 'id_cliente'
              DataSource = dtsPedido
              TabOrder = 1
            end
            object edtNomeCliente: TDBEdit
              Left = 159
              Top = 44
              Width = 250
              Height = 23
              DataField = 'nome'
              DataSource = dtsPedido
              TabOrder = 2
            end
          end
          object pnlOperacoes: TPanel
            Left = 1
            Top = 343
            Width = 592
            Height = 38
            Align = alBottom
            TabOrder = 2
            object btnSalvarPedido: TBitBtn
              AlignWithMargins = True
              Left = 4
              Top = 4
              Width = 120
              Height = 30
              Align = alLeft
              Caption = ' Salvar Pedido'
              Glyph.Data = {
                42040000424D4204000000000000420000002800000010000000100000000100
                20000300000000040000000000000000000000000000000000000000FF0000FF
                0000FF0000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000A1758BFFA1758BFFA1758BFFA1758BFFA1758BFFA175
                8BFFA1758BFFA1758BFFA1758BFFA1758BFFA1758BFFA1758BFFA1758BFFA175
                8BFF0000000000000000A1758BFFF2D5DCFFF2D5DCFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2D5DCFFF2D5DCFFA175
                8BFF0000000000000000A1758BFFF2D5DCFFF2D5DCFFFFFFFFFFFFE8C2FFFFE8
                C2FFFFE8C2FFFFE8C2FFFFE8C2FFFFE8C2FFFFFFFFFFF2D5DCFFF2D5DCFFA175
                8BFF0000000000000000A1758BFFF2D5DCFFF2D5DCFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2D5DCFFF2D5DCFFA175
                8BFF0000000000000000A1758BFFF2D5DCFFF2D5DCFFFFFFFFFFFFE8C2FFFFE8
                C2FFFFE8C2FFFFE8C2FFFFE8C2FFFFE8C2FFFFFFFFFFF2D5DCFFF2D5DCFFA175
                8BFF0000000000000000A1758BFFF2D5DCFFF2D5DCFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2D5DCFFF2D5DCFFA175
                8BFF0000000000000000A1758BFFF2D5DCFFF2D5DCFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2D5DCFFF2D5DCFFA175
                8BFF0000000000000000A1758BFFF2D5DCFFF2D5DCFFF2D5DCFFF2D5DCFFF2D5
                DCFFF2D5DCFFF2D5DCFFF2D5DCFFF2D5DCFFF2D5DCFFF2D5DCFFF2D5DCFFA175
                8BFF0000000000000000A1758BFFF2D5DCFFF2D5DCFFF2D5DCFFF2D5DCFFF2D5
                DCFFF2D5DCFFF2D5DCFFF2D5DCFFF2D5DCFFF2D5DCFFF2D5DCFFF2D5DCFFA175
                8BFF0000000000000000A1758BFFF2D5DCFFF2D5DCFFE9C0CBFFA48B7EFF8F79
                66FF8F7966FF8F7966FF8F7966FF8F7966FFA79183FFF2D5DCFFF2D5DCFFA175
                8BFF0000000000000000A1758BFFF2D5DCFFF2D5DCFFE6BAC6FF8F7966FFF2EB
                E1FFF2EBE1FFF2EBE1FF9C8B78FFF2EBE1FF8F7966FFF2D5DCFFEACCD4FFA175
                8BFF0000000000000000A1758BFFF2D5DCFFF2D5DCFFE6BAC6FF8F7966FFF2EB
                E1FFF2EBE1FFF2EBE1FF9C8B78FFF2EBE1FF8F7966FFEBCDD5FFAD8496F4A67A
                8F860000000000000000A1758BFFF2D5DCFFF2D5DCFFE6BAC6FF8F7966FFF2EB
                E1FFF2EBE1FFF2EBE1FFF2EBE1FFF2EBE1FF8F7966FFAB8195F6A47B907E0000
                00000000000000000000A1758BFFA1758BFFA1758BFFA1758BFF977E73FF8F79
                66FF8F7966FF8F7966FF8F7966FF8F7966FF987D74FFA579907C000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000}
              TabOrder = 0
              OnClick = btnSalvarPedidoClick
            end
            object btnCancelar: TBitBtn
              AlignWithMargins = True
              Left = 130
              Top = 4
              Width = 120
              Height = 30
              Align = alLeft
              Caption = 'Cancelar Pedido'
              Glyph.Data = {
                42040000424D4204000000000000420000002800000010000000100000000100
                20000300000000040000000000000000000000000000000000000000FF0000FF
                0000FF0000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000005050CF895151CFA10000FF010000
                00000000000000000000000000000000FF015050D0A25050CF89000000000000
                00000000000000000000000000005252CF807575E6ED7C7CEBF15050CF950000
                00000000000000000000000000005050CF957B7BEBF27676E7EC5252CF800000
                00000000000000000000000000005151D19A7E7EEBF58F8FF7FF7F7FECF55252
                D19C00000000000000005353D09D7F7FECF58F8FF7FF7C7CEBF45252D0980000
                0000000000000000000000000000000000005353D19C7D7DEBF78F8FF7FF7D7D
                ECF25050CF955050CF957D7DECF28F8FF7FF7D7DEBF75353D19C000000000000
                000000000000000000000000000000000000000000005353D0977D7DECF48F8F
                F7FF7D7DEBF68080ECF68F8FF7FF7D7DEBF45353D19600000000000000000000
                00000000000000000000000000000000000000000000000000005353D1977D7D
                EBF48F8FF7FF8F8FF7FF7D7DEBF45353D1960000000000000000000000000000
                000000000000000000000000000000000000000000000000FF015050D0A27E7E
                EBF58F8FF7FF8F8FF7FF7E7EEBF55151CFA10000FF0100000000000000000000
                0000000000000000000000000000000000000000FF015151D0A37E7EECF78F8F
                F7FF7D7DEBF68080ECF68F8FF7FF7D7DEBF75252CFA100000000000000000000
                0000000000000000000000000000000000005050D09C7D7DEBF48F8FF7FF7E7E
                ECF85555D39C5656D2A07F7FEDF98F8FF7FF7D7DEBF45151CF9B000000000000
                00000000000000000000000000005252D19C7D7DEAF68F8FF7FF7F7FECF55252
                D09800000000000000005555D2997F7FECF58F8FF7FF7C7CEBF65353D19A0000
                00000000000000000000000000005353D1917C7CEBF38181EEF85454D29E0000
                FF0100000000000000000000FF015555D29F8181EEF87C7CEBF35353D1910000
                0000000000000000000000000000000000005252D17F5353D196000000000000
                0000000000000000000000000000000000005353D1965252D17F000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000}
              TabOrder = 1
              OnClick = btnCancelarClick
            end
          end
        end
      end
    end
  end
  object dtsItem: TDataSource
    Left = 59
    Top = 203
  end
  object dtsPedido: TDataSource
    OnStateChange = dtsPedidoStateChange
    Left = 59
    Top = 147
  end
end
