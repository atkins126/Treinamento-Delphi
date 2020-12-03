inherited FormCadastroCaixa: TFormCadastroCaixa
  Caption = 'Caixa'
  PixelsPerInch = 96
  TextHeight = 13
  inherited TabTitulo: TPageControl
    inherited TabCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 676
      ExplicitHeight = 397
      inherited Label3: TLabel
        Left = 24
        Top = 32
        Width = 134
        Height = 19
        Caption = 'N'#176' do Documento:'
        Font.Height = -16
        ParentFont = False
        ExplicitLeft = 24
        ExplicitTop = 32
        ExplicitWidth = 134
        ExplicitHeight = 19
      end
      object Label2: TLabel
        Left = 24
        Top = 76
        Width = 73
        Height = 19
        Caption = 'Descri'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 382
        Top = 32
        Width = 43
        Height = 19
        Caption = 'Valor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object EditNumeroDoc: TEdit
        Left = 162
        Top = 34
        Width = 199
        Height = 21
        TabOrder = 0
      end
      object EditDescricao: TEdit
        Left = 112
        Top = 74
        Width = 513
        Height = 21
        TabOrder = 1
      end
      object RadioGroup: TRadioGroup
        Left = 24
        Top = 120
        Width = 185
        Height = 65
        Caption = 'Forma de Pagamento:'
        Columns = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemIndex = 1
        Items.Strings = (
          'Cr'#233'dito'
          'D'#233'bito')
        ParentFont = False
        TabOrder = 2
      end
      object EditValor: TEdit
        Left = 440
        Top = 32
        Width = 185
        Height = 21
        TabOrder = 3
      end
    end
    inherited TabPesquisa: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 676
      ExplicitHeight = 397
      inherited ButFiltrar: TButton
        OnClick = ButFiltrarClick
      end
      inherited DBGridDados: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Width = 38
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'numero_doc'
            Width = 95
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Width = 256
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'tipo'
            Width = 37
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_cadatro'
            Width = 92
            Visible = True
          end>
      end
      inherited ComboFiltrar: TComboBox
        Text = 'Documento'
        Items.Strings = (
          'Documento'
          'Descri'#231#227'o')
      end
    end
  end
end
