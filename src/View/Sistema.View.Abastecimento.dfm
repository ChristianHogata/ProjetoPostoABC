object frmAbastecimento: TfrmAbastecimento
  Left = 0
  Top = 0
  Caption = 'Posto ABC'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Constraints.MaxHeight = 480
  Constraints.MaxWidth = 640
  Constraints.MinHeight = 480
  Constraints.MinWidth = 640
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object CardPanelAbastecimento: TCardPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 442
    Align = alClient
    ActiveCard = CardAbastecimento
    TabOrder = 0
    ExplicitWidth = 622
    ExplicitHeight = 433
    object CardHistorico: TCard
      Left = 1
      Top = 1
      Width = 626
      Height = 440
      Caption = 'CardHistorico'
      CardIndex = 0
      TabOrder = 0
      ExplicitWidth = 620
      ExplicitHeight = 431
      object pnlHistorico: TPanel
        Left = 0
        Top = 0
        Width = 626
        Height = 440
        Align = alClient
        TabOrder = 0
        ExplicitHeight = 425
        object lbDataFinal: TLabel
          Left = 144
          Top = 59
          Width = 50
          Height = 15
          Caption = 'Data final'
        end
        object Label1: TLabel
          Left = 8
          Top = 59
          Width = 58
          Height = 15
          Caption = 'Data inicial'
        end
        object DBGridHistoricoAbastecimentos: TDBGrid
          Left = 8
          Top = 128
          Width = 609
          Height = 300
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
        end
        object btnAbastecimento: TButton
          Left = 8
          Top = 16
          Width = 75
          Height = 25
          Caption = 'Abastecer'
          TabOrder = 1
          OnClick = btnAbastecimentoClick
        end
        object btnRelatorio: TButton
          Left = 542
          Top = 16
          Width = 75
          Height = 25
          Caption = 'Relat'#243'rio'
          TabOrder = 2
          OnClick = btnRelatorioClick
        end
        object dtpDataInicial: TDateTimePicker
          Left = 8
          Top = 80
          Width = 105
          Height = 23
          Date = 45453.000000000000000000
          Time = 0.023878807871369650
          TabOrder = 3
        end
        object dtpDataFinal: TDateTimePicker
          Left = 144
          Top = 80
          Width = 105
          Height = 23
          Date = 45453.000000000000000000
          Time = 0.023878807871369650
          TabOrder = 4
        end
        object Pesquisar: TButton
          Left = 440
          Top = 78
          Width = 75
          Height = 25
          Caption = 'Pesquisar'
          TabOrder = 5
          OnClick = PesquisarClick
        end
        object chkTodoPeriodo: TCheckBox
          Left = 288
          Top = 82
          Width = 97
          Height = 17
          Caption = 'Todo Periodo'
          TabOrder = 6
        end
        object btnDeletarRegistro: TButton
          Left = 144
          Top = 16
          Width = 75
          Height = 25
          Caption = 'Deletar'
          TabOrder = 7
          OnClick = btnDeletarRegistroClick
        end
      end
    end
    object CardAbastecimento: TCard
      Left = 1
      Top = 1
      Width = 626
      Height = 440
      Caption = 'CardAbastecimento'
      CardIndex = 1
      TabOrder = 1
      ExplicitWidth = 620
      ExplicitHeight = 431
      object pnlAbastecimento: TPanel
        Left = 0
        Top = 0
        Width = 626
        Height = 440
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 620
        ExplicitHeight = 431
        object pnlComponentesAbastecimento: TPanel
          Left = -4
          Top = 0
          Width = 628
          Height = 281
          Align = alCustom
          TabOrder = 0
          object lbValorGasolina: TLabel
            Left = 64
            Top = 157
            Width = 98
            Height = 35
            Caption = 'R$ 0.00 L'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -25
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object lbValorOleo: TLabel
            Left = 424
            Top = 157
            Width = 98
            Height = 35
            Caption = 'R$ 0.00 L'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -25
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object RbBombasGasolina: TRadioGroup
            Left = 24
            Top = 208
            Width = 185
            Height = 49
            Caption = 'Bombas Gasolina'
            Columns = 2
            Items.Strings = (
              'Bomba 1'
              'Bomba 2')
            TabOrder = 0
            OnClick = RbBombasGasolinaClick
          end
          object RbBombasOleo: TRadioGroup
            Left = 385
            Top = 208
            Width = 185
            Height = 49
            Caption = 'Bombas '#211'leo'
            Columns = 2
            Items.Strings = (
              'Bomba 3'
              'Bomba 4')
            TabOrder = 1
            OnClick = RbBombasOleoClick
          end
          object pnlGasolina: TPanel
            Left = 24
            Top = 72
            Width = 185
            Height = 73
            Caption = 'Gasolina'
            Color = clGray
            ParentBackground = False
            TabOrder = 2
            OnClick = pnlGasolinaClick
          end
          object pnlOleo: TPanel
            Left = 385
            Top = 71
            Width = 185
            Height = 74
            Caption = #211'leo Diesel'
            Color = clGray
            ParentBackground = False
            TabOrder = 3
            OnClick = pnlOleoClick
          end
        end
        object pnlInformacoesDoAbastecimento: TPanel
          Left = -4
          Top = 276
          Width = 628
          Height = 162
          Align = alCustom
          TabOrder = 1
          object lbValorAAbastecer: TLabel
            Left = 24
            Top = 32
            Width = 88
            Height = 15
            Caption = 'Valor a abastecer'
          end
          object lbLitrosAbastecidos: TLabel
            Left = 136
            Top = 32
            Width = 96
            Height = 15
            Caption = 'Litros Abastecidos'
          end
          object lbSubtotal: TLabel
            Left = 248
            Top = 32
            Width = 44
            Height = 15
            Caption = 'Subtotal'
          end
          object lbValorImposto: TLabel
            Left = 361
            Top = 32
            Width = 106
            Height = 15
            Caption = 'Valor Imposto (13%)'
          end
          object lbValorTotal: TLabel
            Left = 481
            Top = 32
            Width = 54
            Height = 15
            Caption = 'Valor Total'
          end
          object edtValorAbastecimento: TEdit
            Left = 24
            Top = 48
            Width = 97
            Height = 23
            TabOrder = 0
          end
          object edtQtdLitrosAbastecido: TEdit
            Left = 136
            Top = 48
            Width = 97
            Height = 23
            TabOrder = 1
          end
          object edtSubtotal: TEdit
            Left = 248
            Top = 48
            Width = 97
            Height = 23
            TabOrder = 2
          end
          object edtValorImposto: TEdit
            Left = 361
            Top = 48
            Width = 97
            Height = 23
            TabOrder = 3
          end
          object edtValorTotalAbastecimento: TEdit
            Left = 481
            Top = 48
            Width = 97
            Height = 23
            TabOrder = 4
          end
          object btnAbastecer: TButton
            Left = 481
            Top = 104
            Width = 128
            Height = 49
            Caption = 'Abastecer'
            TabOrder = 5
            OnClick = btnAbastecerClick
          end
          object btnNovoAbastecimento: TButton
            Left = 481
            Top = 104
            Width = 128
            Height = 49
            Caption = 'Novo Abastecimento'
            Enabled = False
            TabOrder = 6
            Visible = False
            OnClick = btnNovoAbastecimentoClick
          end
        end
        object btnHistorico: TButton
          Left = 24
          Top = 24
          Width = 75
          Height = 25
          Caption = 'Hist'#243'rico'
          TabOrder = 2
          OnClick = btnHistoricoClick
        end
      end
    end
  end
end
