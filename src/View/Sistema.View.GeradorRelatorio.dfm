object frmGerarRelatorio: TfrmGerarRelatorio
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio'
  ClientHeight = 141
  ClientWidth = 293
  Color = clBtnFace
  Constraints.MaxHeight = 179
  Constraints.MaxWidth = 305
  Constraints.MinHeight = 179
  Constraints.MinWidth = 305
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object lbDataInicial: TLabel
    Left = 16
    Top = 11
    Width = 58
    Height = 15
    Caption = 'Data inicial'
  end
  object lbDataFinal: TLabel
    Left = 176
    Top = 11
    Width = 52
    Height = 15
    Caption = 'Data Final'
  end
  object dtpInicial: TDateTimePicker
    Left = 16
    Top = 32
    Width = 97
    Height = 23
    Date = 45452.000000000000000000
    Time = 0.637955960650288000
    TabOrder = 0
  end
  object dtpFinal: TDateTimePicker
    Left = 176
    Top = 32
    Width = 97
    Height = 23
    Date = 45452.000000000000000000
    Time = 0.637955960650288000
    TabOrder = 1
  end
  object btnGerarRelatorio: TButton
    Left = 198
    Top = 107
    Width = 75
    Height = 25
    Caption = 'Gerar'
    TabOrder = 2
    OnClick = btnGerarRelatorioClick
  end
  object chkGerarTodoPeriodo: TCheckBox
    Left = 16
    Top = 80
    Width = 121
    Height = 17
    Caption = 'Todo o periodo'
    TabOrder = 3
  end
end
