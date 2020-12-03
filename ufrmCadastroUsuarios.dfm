inherited FormCadastroUsuarios: TFormCadastroUsuarios
  Caption = 'Cadastro de Usu'#225'rios'
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [8]
    Left = 24
    Top = 48
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  inherited TabTitulo: TPageControl
    inherited TabCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 676
      ExplicitHeight = 397
      inherited Label3: TLabel
        Left = 18
        Top = 41
        Width = 48
        Height = 19
        Caption = 'Nome:'
        Font.Height = -16
        ParentFont = False
        ExplicitLeft = 18
        ExplicitTop = 41
        ExplicitWidth = 48
        ExplicitHeight = 19
      end
      object Label4: TLabel
        Left = 16
        Top = 86
        Width = 50
        Height = 19
        Caption = 'Login: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 16
        Top = 136
        Width = 54
        Height = 19
        Caption = 'Senha: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object EditNome: TEdit
        Left = 88
        Top = 43
        Width = 317
        Height = 21
        MaxLength = 50
        TabOrder = 0
      end
      object EditLogin: TEdit
        Left = 88
        Top = 88
        Width = 317
        Height = 21
        MaxLength = 20
        TabOrder = 1
      end
      object EditSenha: TEdit
        Left = 88
        Top = 138
        Width = 317
        Height = 21
        MaxLength = 20
        PasswordChar = '*'
        TabOrder = 2
      end
    end
    inherited TabPesquisa: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 676
      ExplicitHeight = 397
      inherited ButFiltrar: TButton
        Height = 21
        OnClick = ButFiltrarClick
        ExplicitHeight = 21
      end
      inherited ComboFiltrar: TComboBox
        Text = 'Nome'
        Items.Strings = (
          'Nome'
          'Login')
      end
    end
  end
  inherited dsTabela: TDataSource
    DataSet = DataModuleDados.CDS_usuarios
  end
  inherited ImageListCadastro: TImageList
    Left = 528
    Top = 104
  end
end
