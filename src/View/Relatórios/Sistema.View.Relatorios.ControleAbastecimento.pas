unit Sistema.View.Relatorios.ControleAbastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, RLReport, Data.DB;

type
  TfrmRelatorioControleAbastecimento = class(TForm)
    RpControleAbastecimento: TRLReport;
    RpGroupDataAbastecimento: TRLGroup;
    RpBandCabecalho: TRLBand;
    RLLabel1: TRLLabel;
    RpGroupTipoCombustivel: TRLGroup;
    RpGroupNumeroBomba: TRLGroup;
    RLBand1: TRLBand;
    RLBand4: TRLBand;
    RLDBValorTotal: TRLDBResult;
    RLLabelValorTotal: TRLLabel;
    DataSourceRelatorio: TDataSource;
    RpBandAgrupamentoTitulos: TRLBand;
    RLLabelDataAbastecimento: TRLLabel;
    RLDBDataAbastecimento: TRLDBText;
    RLLabelTipoCombustivel: TRLLabel;
    RLDBTipoCombustivel: TRLDBText;
    RLDBNumeroBomba: TRLDBText;
    RLLabelNumeroBomba: TRLLabel;
    RpBandValorAbastecimento: TRLBand;
    RLLabelValorAbastecimento: TRLLabel;
    RLDBValorAbastecimento: TRLDBText;
    procedure RLDBTipoCombustivelBeforePrint(Sender: TObject; var AText: string; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioControleAbastecimento: TfrmRelatorioControleAbastecimento;

implementation

{$R *.dfm}

procedure TfrmRelatorioControleAbastecimento.RLDBTipoCombustivelBeforePrint(
  Sender: TObject; var AText: string; var PrintIt: Boolean);
begin
  if AText = '1' then
    AText := 'Gasolina'
  else
    AText := 'Diesel';
end;

end.
