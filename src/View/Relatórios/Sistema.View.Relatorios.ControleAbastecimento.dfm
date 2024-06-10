object frmRelatorioControleAbastecimento: TfrmRelatorioControleAbastecimento
  Left = 0
  Top = 0
  Caption = 'frmRelatorioControleAbastecimento'
  ClientHeight = 733
  ClientWidth = 1017
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object RpControleAbastecimento: TRLReport
    Left = 8
    Top = 8
    Width = 1403
    Height = 992
    DataSource = DataSourceRelatorio
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -17
    Font.Name = 'Arial'
    Font.Style = []
    PageSetup.Orientation = poLandscape
    Transparent = False
    object RpGroupDataAbastecimento: TRLGroup
      Left = 47
      Top = 137
      Width = 1309
      Height = 264
      DataFields = 'DataAbastecimento'
      Transparent = False
      object RpGroupTipoCombustivel: TRLGroup
        Left = 0
        Top = 8
        Width = 1309
        Height = 64
        DataFields = 'TipoCombustivel'
        Transparent = False
        object RpGroupNumeroBomba: TRLGroup
          Left = 0
          Top = 0
          Width = 1309
          Height = 64
          DataFields = 'NumeroBomba'
          Transparent = False
          object RpBandAgrupamentoTitulos: TRLBand
            Left = 0
            Top = 16
            Width = 1309
            Height = 48
            BandType = btHeader
            Color = clMedGray
            ParentColor = False
            Transparent = False
            object RLLabelDataAbastecimento: TRLLabel
              Left = 11
              Top = 21
              Width = 168
              Height = 19
              Caption = 'Data Abastecimento:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -17
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = False
            end
            object RLDBDataAbastecimento: TRLDBText
              Left = 185
              Top = 21
              Width = 146
              Height = 19
              DataField = 'DataAbastecimento'
              DataSource = DataSourceRelatorio
              Text = ''
              Transparent = False
            end
            object RLLabelTipoCombustivel: TRLLabel
              Left = 357
              Top = 21
              Width = 144
              Height = 19
              Caption = 'Tipo combust'#237'vel:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -17
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = False
            end
            object RLDBTipoCombustivel: TRLDBText
              Left = 507
              Top = 21
              Width = 123
              Height = 19
              DataField = 'TipoCombustivel'
              DataSource = DataSourceRelatorio
              Text = ''
              Transparent = False
              BeforePrint = RLDBTipoCombustivelBeforePrint
            end
            object RLDBNumeroBomba: TRLDBText
              Left = 791
              Top = 21
              Width = 113
              Height = 19
              DataField = 'NumeroBomba'
              DataSource = DataSourceRelatorio
              Text = ''
              Transparent = False
            end
            object RLLabelNumeroBomba: TRLLabel
              Left = 652
              Top = 21
              Width = 133
              Height = 19
              Caption = 'N'#250'mero Bomba:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -17
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = False
            end
          end
          object RpBandValorAbastecimento: TRLBand
            Left = 0
            Top = 8
            Width = 1309
            Height = 56
            Transparent = False
            object RLLabelValorAbastecimento: TRLLabel
              Left = 11
              Top = 21
              Width = 134
              Height = 19
              Caption = 'Valor Abastecido:'
              Transparent = False
            end
            object RLDBValorAbastecimento: TRLDBText
              Left = 151
              Top = 21
              Width = 124
              Height = 19
              DataField = 'ValorAbastecido'
              DataSource = DataSourceRelatorio
              Text = ''
              Transparent = False
            end
          end
        end
      end
      object RLBand1: TRLBand
        Left = 0
        Top = 0
        Width = 1309
        Height = 8
        BandType = btHeader
        Color = clBlack
        ParentColor = False
        Transparent = False
      end
      object RLBand4: TRLBand
        Left = 0
        Top = 72
        Width = 1309
        Height = 48
        BandType = btColumnFooter
        object RLDBValorTotal: TRLDBResult
          Left = 745
          Top = 16
          Width = 89
          Height = 19
          DataField = 'Total'
          DataSource = DataSourceRelatorio
          Info = riSum
          Text = ''
        end
        object RLLabelValorTotal: TRLLabel
          Left = 652
          Top = 16
          Width = 87
          Height = 19
          Caption = 'Valor Total:'
          Transparent = False
        end
      end
    end
    object RpBandCabecalho: TRLBand
      Left = 47
      Top = 47
      Width = 1309
      Height = 90
      BandType = btHeader
      Transparent = False
      object RLLabel1: TRLLabel
        Left = 440
        Top = 26
        Width = 428
        Height = 38
        Align = faCenter
        Alignment = taCenter
        Caption = 'Controle de abastecimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -33
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
    end
  end
  object DataSourceRelatorio: TDataSource
    Left = 65520
    Top = 464
  end
end
