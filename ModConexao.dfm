object DataModuleDados: TDataModuleDados
  OldCreateOrder = False
  Height = 544
  Width = 717
  object SQLConnection: TSQLConnection
    ConnectionName = 'financeiro'
    DriverName = 'MySQL'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=MySQL'
      'DriverUnit=Data.DBXMySQL'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver260.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=24.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXMySqlMetaDataCommandFactory,DbxMySQLDr' +
        'iver260.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXMySqlMetaDataCommandFact' +
        'ory,Borland.Data.DbxMySQLDriver,Version=24.0.0.0,Culture=neutral' +
        ',PublicKeyToken=91d62ebb5b0d1b1b'
      'LibraryName=dbxmys.dll'
      'LibraryNameOsx=libsqlmys.dylib'
      'VendorLib=LIBMYSQL.dll'
      'VendorLibWin64=libmysql.dll'
      'VendorLibOsx=libmysqlclient.dylib'
      'HostName=localhost'
      'Database=financeiro'
      'User_Name=root'
      'Password=123456'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'Compressed=False'
      'Encrypted=False'
      'BlobSize=-1'
      'ErrorResourceFile=')
    Connected = True
    Left = 40
    Top = 16
  end
  object SDS_caixa: TSQLDataSet
    CommandText = 'SELECT * FROM CAIXA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 200
    Top = 16
  end
  object DSP_caixa: TDataSetProvider
    DataSet = SDS_caixa
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 320
    Top = 16
  end
  object CDS_caixa: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_caixa'
    Left = 440
    Top = 16
    object CDS_caixaid: TIntegerField
      DisplayWidth = 10
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CDS_caixanumero_doc: TStringField
      DisplayLabel = 'N '#176' do documento'
      DisplayWidth = 19
      FieldName = 'numero_doc'
      Required = True
    end
    object CDS_caixadescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 200
      FieldName = 'descricao'
      Size = 200
    end
    object CDS_caixavalor: TFMTBCDField
      DisplayLabel = 'Valor'
      DisplayWidth = 21
      FieldName = 'valor'
      Required = True
      currency = True
      Precision = 20
      Size = 2
    end
    object CDS_caixatipo: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 3
      FieldName = 'tipo'
      Required = True
      FixedChar = True
      Size = 1
    end
    object CDS_caixadt_cadastro: TDateField
      DisplayLabel = 'Data de Cadastro'
      DisplayWidth = 14
      FieldName = 'dt_cadatro'
      Required = True
    end
  end
  object SDS_contas_pagar: TSQLDataSet
    CommandText = 'SELECT * FROM CONTAS_PAGAR'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 200
    Top = 96
  end
  object DSP_contas_pagar: TDataSetProvider
    DataSet = SDS_contas_pagar
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 320
    Top = 96
  end
  object CDS_contas_pagar: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_contas_pagar'
    Left = 440
    Top = 96
    object CDS_contas_pagarid: TIntegerField
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CDS_contas_pagarnumero_doc: TStringField
      DisplayLabel = 'N'#176' do Documento'
      FieldName = 'numero_doc'
      Required = True
    end
    object CDS_contas_pagardescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 200
    end
    object CDS_contas_pagarparcela: TIntegerField
      DisplayLabel = 'Parcelas'
      FieldName = 'parcela'
      Required = True
    end
    object CDS_contas_pagarvalor_parcela: TFMTBCDField
      DisplayLabel = 'Valor da Parcela'
      FieldName = 'valor_parcela'
      Required = True
      Precision = 20
      Size = 2
    end
    object CDS_contas_pagarvalor_compra: TFMTBCDField
      DisplayLabel = 'Valor da Compra'
      FieldName = 'valor_compra'
      Required = True
      Precision = 20
      Size = 2
    end
    object CDS_contas_pagarvalor_abatido: TFMTBCDField
      DisplayLabel = 'Desconto'
      FieldName = 'valor_abatido'
      Required = True
      Precision = 20
      Size = 2
    end
    object CDS_contas_pagardt_compra: TDateField
      DisplayLabel = 'Data da Compra'
      FieldName = 'dt_compra'
      Required = True
    end
    object CDS_contas_pagardt_cadastro: TDateField
      DisplayLabel = 'Data do Cadastro'
      FieldName = 'dt_cadastro'
      Required = True
    end
    object CDS_contas_pagardt_vencimento: TDateField
      DisplayLabel = 'Data de Vencimento'
      FieldName = 'dt_vencimento'
      Required = True
    end
    object CDS_contas_pagardt_pagamento: TDateField
      DisplayLabel = 'Data de Pagamento'
      FieldName = 'dt_pagamento'
    end
    object CDS_contas_pagarstatus: TStringField
      DisplayLabel = 'Status'
      FieldName = 'status'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object SDS_contas_receber: TSQLDataSet
    CommandText = 'SELECT * FROM CONTAS_RECEBER'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 200
    Top = 184
  end
  object DSP_contas_receber: TDataSetProvider
    DataSet = SDS_contas_receber
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 320
    Top = 184
  end
  object CDS_contas_receber: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_contas_receber'
    Left = 440
    Top = 184
    object CDS_contas_receberid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object CDS_contas_receberdocumento: TStringField
      FieldName = 'documento'
      Required = True
    end
    object CDS_contas_receberdescricao: TStringField
      FieldName = 'descricao'
      Size = 200
    end
    object CDS_contas_receberparcelas: TIntegerField
      FieldName = 'parcelas'
      Required = True
    end
    object CDS_contas_recebervalor_parcela: TFMTBCDField
      FieldName = 'valor_parcela'
      Required = True
      Precision = 20
      Size = 2
    end
    object CDS_contas_recebervalor_compra: TFMTBCDField
      FieldName = 'valor_compra'
      Required = True
      Precision = 20
      Size = 2
    end
    object CDS_contas_recebervalor_abatido: TFMTBCDField
      FieldName = 'valor_abatido'
      Required = True
      Precision = 20
      Size = 2
    end
    object CDS_contas_receberdt_compra: TDateField
      FieldName = 'dt_compra'
      Required = True
    end
    object CDS_contas_receberdt_vencimento: TDateField
      FieldName = 'dt_vencimento'
      Required = True
    end
    object CDS_contas_receberdt_cadastro: TDateField
      FieldName = 'dt_cadastro'
      Required = True
    end
    object CDS_contas_receberdt_pagamento: TDateField
      FieldName = 'dt_pagamento'
    end
    object CDS_contas_receberstatus: TStringField
      FieldName = 'status'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object SDS_usuarios: TSQLDataSet
    CommandText = 'SELECT * FROM USUARIOS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 200
    Top = 272
  end
  object DSP_usuarios: TDataSetProvider
    DataSet = SDS_usuarios
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 320
    Top = 272
  end
  object CDS_usuarios: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_usuarios'
    Left = 440
    Top = 272
    object CDS_usuariosid: TIntegerField
      DisplayWidth = 10
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CDS_usuariosnome: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 35
      FieldName = 'nome'
      Required = True
      Size = 50
    end
    object CDS_usuarioslogin: TStringField
      DisplayLabel = 'Login'
      DisplayWidth = 20
      FieldName = 'login'
      Required = True
    end
    object CDS_usuariossenha: TStringField
      DisplayLabel = 'Senha'
      DisplayWidth = 20
      FieldName = 'senha'
      Required = True
    end
    object CDS_usuariosstatus: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 5
      FieldName = 'status'
      Required = True
      FixedChar = True
      Size = 1
    end
    object CDS_usuariosdt_cadastro: TStringField
      DisplayLabel = 'Data do Cadastro'
      DisplayWidth = 14
      FieldName = 'dt_cadastro'
      Size = 10
    end
  end
end
