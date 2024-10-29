object ViewPesquisaPadrao: TViewPesquisaPadrao
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Pesquisa'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 441
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 620
    ExplicitHeight = 440
    object pnlGrid: TPanel
      Left = 0
      Top = 65
      Width = 624
      Height = 376
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitWidth = 620
      ExplicitHeight = 375
      object grdRegistros: TDBGrid
        AlignWithMargins = True
        Left = 6
        Top = 3
        Width = 612
        Height = 346
        Margins.Left = 6
        Margins.Right = 6
        Align = alClient
        DataSource = dtsPesquisa
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDblClick = grdRegistrosDblClick
      end
      object pnlInfo: TPanel
        Left = 0
        Top = 352
        Width = 624
        Height = 24
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitTop = 351
        ExplicitWidth = 620
        object lblQtdRegistro: TLabel
          AlignWithMargins = True
          Left = 568
          Top = 4
          Width = 48
          Height = 17
          Margins.Top = 4
          Margins.Right = 8
          Align = alRight
          Caption = 'Registros'
          ExplicitHeight = 15
        end
        object lbOrdenacao: TLabel
          AlignWithMargins = True
          Left = 559
          Top = 3
          Width = 3
          Height = 18
          Align = alRight
          Alignment = taRightJustify
          ExplicitHeight = 15
        end
        object lblDuplo: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 182
          Height = 18
          Align = alLeft
          Caption = 'Duplo Click - Selecionar o Registro'
          ExplicitHeight = 15
        end
      end
    end
    object pnlPesquisa: TPanel
      Left = 0
      Top = 0
      Width = 624
      Height = 65
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      ExplicitWidth = 620
      DesignSize = (
        624
        65)
      object lbPesquisa: TLabel
        Left = 6
        Top = 16
        Width = 46
        Height = 15
        Caption = 'Pesquisa'
      end
      object edtPesquisa: TMaskEdit
        Left = 6
        Top = 35
        Width = 612
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        TabOrder = 0
        Text = ''
        OnChange = edtPesquisaChange
      end
    end
  end
  object dtsPesquisa: TDataSource
    OnDataChange = dtsPesquisaDataChange
    Left = 72
    Top = 153
  end
end
