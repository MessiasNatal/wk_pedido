inherited DMPedido: TDMPedido
  Height = 204
  Width = 332
  object memPedido: TFDMemTable
    AfterOpen = memPedidoAfterOpen
    AfterInsert = memPedidoAfterInsert
    BeforePost = memPedidoBeforePost
    AfterDelete = memPedidoAfterDelete
    AfterScroll = memPedidoAfterScroll
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 56
    Top = 48
    object memPedidoid_pedido: TIntegerField
      DisplayLabel = 'N'#186' Pedido'
      FieldName = 'id_pedido'
      Required = True
    end
    object memPedidodata_emissao: TDateField
      DisplayLabel = 'Data Emiss'#227'o'
      FieldName = 'data_emissao'
      Required = True
    end
    object memPedidoid_cliente: TIntegerField
      DisplayLabel = 'C'#243'digo Cliente'
      FieldName = 'id_cliente'
      Required = True
    end
    object memPedidonome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Required = True
      Size = 255
    end
  end
  object memItem: TFDMemTable
    AfterInsert = memItemAfterInsert
    BeforePost = memItemBeforePost
    AggregatesActive = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 232
    Top = 48
    object memItemid_item: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'id_item'
      Required = True
    end
    object memItemid_pedido: TIntegerField
      DisplayLabel = 'N'#186' Pedido'
      FieldName = 'id_pedido'
      Required = True
    end
    object memItemid_produto: TIntegerField
      DisplayLabel = 'C'#243'digo do Produto'
      FieldName = 'id_produto'
      Required = True
    end
    object memItemdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o do Produto'
      FieldName = 'descricao'
      Required = True
      Size = 500
    end
    object memItemvalor_total: TCurrencyField
      DisplayLabel = 'Valor Total'
      FieldName = 'valor_total'
      Required = True
    end
    object memItemquantidade: TCurrencyField
      DisplayLabel = 'Qauntidade'
      FieldName = 'quantidade'
      Required = True
      OnSetText = memItemquantidadeSetText
      EditFormat = '0.00'
      currency = False
    end
    object memItemvalor_unitario: TCurrencyField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'valor_unitario'
      Required = True
    end
    object memItemvalor_total_itens: TAggregateField
      FieldName = 'valor_total_itens'
      Visible = True
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'sum(valor_total)'
    end
  end
  object dtsPedido: TDataSource
    DataSet = memPedido
    Left = 144
    Top = 88
  end
end
