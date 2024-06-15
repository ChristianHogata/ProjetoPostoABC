unit Sistema.View.GeradorRelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Data.DB,  Sistema.Controller.ModelFactory, Sistema.Controller.Interfaces;

type
  TfrmGerarRelatorio = class(TForm)
    dtpInicial: TDateTimePicker;
    dtpFinal: TDateTimePicker;
    btnGerarRelatorio: TButton;
    lbDataInicial: TLabel;
    lbDataFinal: TLabel;
    chkGerarTodoPeriodo: TCheckBox;
    procedure btnGerarRelatorioClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FDataSourceRelatorio: TDataSource;
    FControllerModelFactory: IControllerModelFactory;
    procedure PrepararDataSetRelatorio;
  public
    { Public declarations }
  end;

var
  frmGerarRelatorio: TfrmGerarRelatorio;

implementation

uses
  Sistema.View.Relatorios.ControleAbastecimento;

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
  end;
end;

procedure TfrmGerarRelatorio.FormCloseQuery(Sender: TObject;var CanClose: Boolean);
begin
  ReportMemoryLeaksOnShutdown := true;
end;

procedure TfrmGerarRelatorio.FormShow(Sender: TObject);
begin
  FControllerModelFactory := TControllerModelFactory.new();
end;

procedure TfrmGerarRelatorio.PrepararDataSetRelatorio;
CONST
  AGRUPAMENTO = 'group by DataAbastecimento, TipoCombustivel, NumeroBomba, QuantidadeLitros, SubTotal, ValorImposto, Total ';
begin
  if chkGerarTodoPeriodo.Checked then
    begin
      FDataSourceRelatorio :=
        FControllerModelFactory
          .GetModelAbastecimento
          .SetQueryAbastecimentoParametros
            .AgruparValoresAbastecimento(AGRUPAMENTO)
          .&End
          .getDataSource();
    end
  else
    begin
      FDataSourceRelatorio :=
        FControllerModelFactory
        .GetModelAbastecimento
          .SetQueryAbastecimentoParametros
            .AdicionarCondicaoQuery(Format('where DataAbastecimento >= ''%s'' and DataAbastecimento <= ''%s''', [FormatDateTime('yyyy-MM-dd', dtpInicial.Date), FormatDateTime('yyyy-MM-dd', dtpFinal.Date)]))
            .AgruparValoresAbastecimento(AGRUPAMENTO)
          .&End
          .getDataSource();
    end;
end;

end.
