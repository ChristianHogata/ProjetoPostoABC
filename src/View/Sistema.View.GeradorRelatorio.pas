unit Sistema.View.GeradorRelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Data.DB;

type
  TfrmGerarRelatorio = class(TForm)
    dtpInicial: TDateTimePicker;
    dtpFinal: TDateTimePicker;
    btnGerarRelatorio: TButton;
    lbDataInicial: TLabel;
    lbDataFinal: TLabel;
    chkGerarTodoPeriodo: TCheckBox;
    procedure btnGerarRelatorioClick(Sender: TObject);
  private
    { Private declarations }
    FDataSourceRelatorio: TDataSource;
    procedure PrepararDataSetRelatorio;
  public
    { Public declarations }
  end;

var
  frmGerarRelatorio: TfrmGerarRelatorio;

implementation

uses
  Sistema.View.Relatorios.ControleAbastecimento, Sistema.Controller.ModelFactory;

{$R *.dfm}

procedure TfrmGerarRelatorio.btnGerarRelatorioClick(Sender: TObject);
Var
  frmRelatorioControleAbastecimento: TfrmRelatorioControleAbastecimento;
begin
  PrepararDataSetRelatorio();

  frmRelatorioControleAbastecimento := TfrmRelatorioControleAbastecimento.Create(nil);
  try
    frmRelatorioControleAbastecimento.DataSourceRelatorio.DataSet := FDataSourceRelatorio.DataSet;
    frmRelatorioControleAbastecimento.RpControleAbastecimento.Preview();
  finally
    frmRelatorioControleAbastecimento.Free;
    FreeAndNil(FDataSourceRelatorio);
  end;
end;

procedure TfrmGerarRelatorio.PrepararDataSetRelatorio;
CONST
  AGRUPAMENTO = 'group by DataAbastecimento, TipoCombustivel, NumeroBomba, QuantidadeLitros, SubTotal, ValorImposto, Total ';
begin
  if chkGerarTodoPeriodo.Checked then
    begin
      FDataSourceRelatorio :=
        TControllerModelFactory.new.GetModelAbastecimento
          .SetQueryAbastecimentoParametros
            .AgruparValoresAbastecimento(AGRUPAMENTO)
          .&End
          .getDataSource();
    end
  else
    begin
      FDataSourceRelatorio :=
        TControllerModelFactory.new.GetModelAbastecimento
          .SetQueryAbastecimentoParametros
            .AdicionarCondicaoQuery(Format('where DataAbastecimento >= ''%s'' and DataAbastecimento <= ''%s''', [FormatDateTime('yyyy-MM-dd', dtpInicial.Date), FormatDateTime('yyyy-MM-dd', dtpFinal.Date)]))
            .AgruparValoresAbastecimento(AGRUPAMENTO)
          .&End
          .getDataSource();
    end;
end;

end.
