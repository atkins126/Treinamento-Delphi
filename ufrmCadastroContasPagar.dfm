inherited FormCadastroContasPagar: TFormCadastroContasPagar
  Caption = 'Cadastro de Contas a Pagar'
  PixelsPerInch = 96
  TextHeight = 13
  inherited TabTitulo: TPageControl
    ActivePage = TabCadastro
    inherited TabCadastro: TTabSheet
      TabVisible = True
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 676
      ExplicitHeight = 397
      inherited Label3: TLabel
        Left = 24
        Top = 24
        Width = 123
        Height = 18
        Caption = 'N'#176' do Documento:'
        Font.Height = -15
        ParentFont = False
        ExplicitLeft = 24
        ExplicitTop = 24
        ExplicitWidth = 123
        ExplicitHeight = 18
      end
      object Label2: TLabel
        Left = 24
        Top = 72
        Width = 142
        Height = 18
        Caption = 'Descri'#231#227'o da compra:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 24
        Top = 172
        Width = 80
        Height = 18
        Caption = 'N'#176' Parcelas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 24
        Top = 122
        Width = 114
        Height = 18
        Caption = 'Valor da Compra:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 295
        Top = 24
        Width = 113
        Height = 18
        Caption = 'Data da Compra:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 252
        Top = 172
        Width = 60
        Height = 18
        Caption = 'Varia'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object EditNumDocumento: TEdit
        Left = 153
        Top = 21
        Width = 112
        Height = 21
        TabOrder = 0
      end
      object EditDescricao: TEdit
        Left = 172
        Top = 69
        Width = 453
        Height = 21
        TabOrder = 1
      end
      object EditParcelas: TEdit
        Left = 118
        Top = 169
        Width = 92
        Height = 21
        NumbersOnly = True
        TabOrder = 2
      end
      object EditValorCompra: TEdit
        Left = 144
        Top = 119
        Width = 286
        Height = 21
        TabOrder = 3
      end
      object EditDtCompra: TEdit
        Left = 414
        Top = 21
        Width = 211
        Height = 21
        TabOrder = 4
      end
      object EditVariacao: TEdit
        Left = 318
        Top = 169
        Width = 112
        Height = 21
        TabOrder = 5
      end
      object BitBtn1: TBitBtn
        Left = 468
        Top = 152
        Width = 157
        Height = 38
        Caption = 'Gerar Parcelar'
        TabOrder = 6
        OnClick = BitBtn1Click
      end
      object BitBtn2: TBitBtn
        Left = 468
        Top = 108
        Width = 157
        Height = 38
        Caption = 'Limpar Parcelas'
        TabOrder = 7
        OnClick = BitBtn2Click
      end
      object DBGrid1: TDBGrid
        Left = -4
        Top = 218
        Width = 663
        Height = 177
        DataSource = dsParcelas
        DrawingStyle = gdsGradient
        Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
        TabOrder = 8
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid1DrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'Parcelas'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor'
            Width = 299
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Vencimento'
            Width = 540
            Visible = True
          end>
      end
    end
    inherited TabPesquisa: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 676
      ExplicitHeight = 397
      inherited DBGridDados: TDBGrid
        Top = 184
        Height = 211
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'numero_doc'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'parcela'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor_parcela'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor_compra'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor_abatido'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_compra'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_cadastro'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_vencimento'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_pagamento'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'status'
            Visible = True
          end>
      end
    end
  end
  inherited dsTabela: TDataSource
    DataSet = ClientParcelas
    Left = 176
    Top = 272
  end
  inherited ImageListCadastro: TImageList
    Left = 96
    Top = 272
  end
  inherited ActAcoes: TActionList
    Left = 8
    Top = 272
  end
  object ClientParcelas: TClientDataSet
    PersistDataPacket.Data = {
      600000009619E0BD010000001800000003000000000003000000600008506172
      63656C617304000100000000000556616C6F7208000400000001000753554254
      5950450200490006004D6F6E6579000A56656E63696D656E746F040006000000
      00000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 272
    object ClientParcelasParcelas: TIntegerField
      FieldName = 'Parcelas'
    end
    object ClientParcelasValor: TCurrencyField
      FieldName = 'Valor'
    end
    object ClientParcelasVencimento: TDateField
      FieldName = 'Vencimento'
    end
  end
  object dsParcelas: TDataSource
    DataSet = ClientParcelas
    Left = 304
    Top = 272
  end
end
