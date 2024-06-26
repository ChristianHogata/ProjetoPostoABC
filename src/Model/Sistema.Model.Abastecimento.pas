unit Sistema.Model.Abastecimento;

interface

uses
  Sistema.Model.Interfaces, FireDAC.DApt, Data.DB, FireDAC.Comp.Client, FireDAC.VCLUI.Wait, FireDAC.Stan.Async, System.Generics.Collections;

type
  TModelAbastecimento = class(TInterfacedObject, IModelAbastecimento, IModelAbastecimentoParametros, IModelAbastecimentoQueryParametros)
    private
      FDataSet: TFDQuery;
      FDataSource: TDataSource;
      FConexao: IModelConexao;
      FValorAbastecido: Double;
      FQuantidadeLitros: Double;
      FValorCombustivelLitro: Double;
      FTotal: Double;
      FSubTotal: Double;
      FValorImposto: Double;
      FDataAbastecimento: TDateTime;
      FTipoCombustivel: Integer;
      FNumeroBomba: Integer;
      constructor Create; overload;
      procedure inicializarDataSet;
      procedure inicializarFields;
      function CalcularSubTotal: Double;
      function CalcularValorImposto: Double;
      function CalcularQuantidadeLitros: Double;
      function CalcularValorAbastecimento: Double;
    public
      function SetParametros: IModelAbastecimentoParametros;
      function SetValorImposto(pValorImposto: Double): IModelAbastecimentoParametros;
      function SetValorCombustivelLitro(pValorCombustivelLitro: Double): IModelAbastecimentoParametros;
      function SetValorAbastecido(pValorAbastecido: Double): IModelAbastecimentoParametros;
      function SetNumeroBomba(pNumeroBomba: Integer): IModelAbastecimentoParametros;
      function SetTipoCombustivel(pTipoCombustivel: Integer): IModelAbastecimentoParametros;
      function GetValorImposto: Double;
      function GetQuantidadeCombustivelLitro: Double;
      function GetValorSubTotal: Double;
      function GetValorTotal: Double;
      function &End: IModelAbastecimento;
      function AgruparValoresAbastecimento(pQuery: string): IModelAbastecimentoQueryParametros;
      function AdicionarCondicaoQuery(pQuery: string): IModelAbastecimentoQueryParametros;
      function SetQueryAbastecimentoParametros: IModelAbastecimentoQueryParametros;
      procedure inserir;
      procedure excluir;
      procedure editar;
      procedure cancelar;
      procedure ProcessarAbastecimento();
      function GetDataSource: TDataSource;
      class function new: IModelAbastecimento;
      destructor Destroy; override;
  end;

implementation

uses
  Sistema.Model.ModelConexaoFactory, System.SysUtils;

{ TModelAbastecimento }

function TModelAbastecimento.&End: IModelAbastecimento;
begin
  Result := Self;
end;

function TModelAbastecimento.AdicionarCondicaoQuery(pQuery: string): IModelAbastecimentoQueryParametros;
begin
  FDataSet.SQL.Add(pQuery);
  Result := Self;
end;

function TModelAbastecimento.AgruparValoresAbastecimento(pQuery: string): IModelAbastecimentoQueryParametros;
begin
  FDataSet.SQL.Add(pQuery);
  Result := Self;
end;

function TModelAbastecimento.CalcularQuantidadeLitros: Double;
begin
  Result := FValorAbastecido / FValorCombustivelLitro;
end;

function TModelAbastecimento.CalcularSubTotal: Double;
begin
  Result := FValorAbastecido - ((FValorAbastecido * FValorImposto) / 100);
end;

function TModelAbastecimento.CalcularValorAbastecimento: Double;
begin
  Result := FSubTotal + FValorImposto;
end;

function TModelAbastecimento.CalcularValorImposto: Double;
begin
  Result := ((FValorAbastecido * FValorImposto) / 100);
end;

procedure TModelAbastecimento.cancelar;
begin
  FDataSet.Cancel;
end;

constructor TModelAbastecimento.Create;
begin
  FValorImposto := 0;
  FSubTotal := 0;
  FTotal := 0;
  FValorCombustivelLitro := 0;
  FQuantidadeLitros := 0;
  FValorAbastecido := 0;

  FConexao := TModelConexaoFactory.new.GetConexao;

  FDataSet := TFDQuery.Create(nil);
  FDataSet.Connection := TFDCustomConnection(FConexao.Get);

  FDataSource := TDataSource.Create(nil);
  FDataSource.DataSet := FDataSet;

  inicializarDataSet();
end;

destructor TModelAbastecimento.Destroy;
begin
  inherited;
  FDataSet.Free;
  FDataSource.Free;
end;

procedure TModelAbastecimento.editar;
begin
  FDataSet.Edit;
end;

procedure TModelAbastecimento.excluir;
begin
  FDataSource.DataSet.Delete;
end;

function TModelAbastecimento.GetDataSource: TDataSource;
begin
  FDataSet.Open;
  Result := FDataSource;
end;

function TModelAbastecimento.GetQuantidadeCombustivelLitro: Double;
begin
  Result := FQuantidadeLitros;
end;

function TModelAbastecimento.GetValorImposto: Double;
begin
  Result := FValorImposto;
end;

function TModelAbastecimento.GetValorSubTotal: Double;
begin
  Result := FSubTotal;
end;

function TModelAbastecimento.GetValorTotal: Double;
begin
  Result := FTotal;
end;

procedure TModelAbastecimento.inicializarDataSet;
begin
  inicializarFields();
  FDataSet.SQL.Add('Select * from Abastecimento ');
end;

procedure TModelAbastecimento.inicializarFields;
Var
  lFieldCodigo, lFieldTipoCombustivel, lFieldNumeroBomba: TIntegerField;
  lFieldValorAbastecido, lFieldValorImposto, lFieldQuantidadeLitros, lFieldValorTotal, lFieldSubTotal: TFloatField;
  lFieldDataAbastecimento: TDateField;
begin
  lFieldCodigo := TIntegerField.Create(nil);
  lFieldCodigo.DisplayLabel := 'C�digo';
  lFieldCodigo.FieldName := 'Id';
  lFieldCodigo.DataSet := FDataSet;

  lFieldTipoCombustivel := TIntegerField.Create(nil);
  lFieldTipoCombustivel.DisplayLabel := 'Tipo Combust�vel';
  lFieldTipoCombustivel.FieldName := 'TipoCombustivel';
  lFieldTipoCombustivel.DataSet := FDataSet;

  lFieldNumeroBomba := TIntegerField.Create(nil);
  lFieldNumeroBomba.DisplayLabel := 'N�mero Bomba';
  lFieldNumeroBomba.FieldName := 'NumeroBomba';
  lFieldNumeroBomba.DataSet := FDataSet;

  lFieldValorAbastecido := TFloatField.Create(nil);
  lFieldValorAbastecido.DisplayLabel := 'Valor Abastecido';
  lFieldValorAbastecido.FieldName := 'ValorAbastecido';
  lFieldValorAbastecido.DisplayFormat := 'R$#,##0.00';
  lFieldValorAbastecido.DataSet := FDataSet;

  lFieldValorImposto := TFloatField.Create(nil);
  lFieldValorImposto.DisplayLabel := 'Valor Imposto';
  lFieldValorImposto.FieldName := 'ValorImposto';
  lFieldValorImposto.DisplayFormat := 'R$#,##0.00';
  lFieldValorImposto.DataSet := FDataSet;

  lFieldQuantidadeLitros := TFloatField.Create(nil);
  lFieldQuantidadeLitros.DisplayLabel := 'Litros';
  lFieldQuantidadeLitros.FieldName := 'QuantidadeLitros';
  lFieldQuantidadeLitros.DisplayFormat := '#,##0.00';
  lFieldQuantidadeLitros.DataSet := FDataSet;

  lFieldValorTotal := TFloatField.Create(nil);
  lFieldValorTotal.DisplayLabel := 'Total';
  lFieldValorTotal.FieldName := 'Total';
  lFieldValorTotal.DisplayFormat := 'R$#,##0.00';
  lFieldValorTotal.DataSet := FDataSet;

  lFieldSubTotal := TFloatField.Create(nil);
  lFieldSubTotal.DisplayLabel := 'Subtotal';
  lFieldSubTotal.FieldName := 'SubTotal';
  lFieldSubTotal.DisplayFormat := 'R$#,##0.00';
  lFieldSubTotal.DataSet := FDataSet;


  lFieldDataAbastecimento := TDateField.Create(nil);
  lFieldDataAbastecimento.DisplayLabel := 'Data Abastecimento';
  lFieldDataAbastecimento.FieldName := 'DataAbastecimento';
  lFieldDataAbastecimento.DataSet := FDataSet;

end;

procedure TModelAbastecimento.inserir;
Var
  lIdRegistro: Integer;
begin
  lIdRegistro := 1;

  if FDataSet.RecordCount > 0 then
    begin
      FDataSet.Last();
      lIdRegistro := FDataSet.FieldByName('Id').AsInteger;
      Inc(lIdRegistro);
    end;

  FDataSet.Append;
  FDataSet.FieldByName('Id').AsInteger := lIdRegistro;
  FDataSet.FieldByName('ValorImposto').AsFloat := FValorImposto;
  FDataSet.FieldByName('SubTotal').AsFloat := FSubTotal;
  FDataSet.FieldByName('Total').AsFloat := FTotal;
  FDataSet.FieldByName('QuantidadeLitros').AsFloat := FQuantidadeLitros;
  FDataSet.FieldByName('ValorAbastecido').AsFloat := FValorAbastecido;
  FDataSet.FieldByName('NumeroBomba').AsInteger := FNumeroBomba;
  FDataSet.FieldByName('TipoCombustivel').AsInteger := FTipoCombustivel;
  FDataSet.FieldByName('DataAbastecimento').AsDateTime := Now();
  FDataSet.Post;
end;

class function TModelAbastecimento.new: IModelAbastecimento;
begin
  Result := Self.Create;
end;

procedure TModelAbastecimento.ProcessarAbastecimento();
begin
  FSubTotal := CalcularSubTotal();
  FValorImposto := CalcularValorImposto();
  FQuantidadeLitros := CalcularQuantidadeLitros();
  FTotal := CalcularValorAbastecimento();
end;

function TModelAbastecimento.SetNumeroBomba(pNumeroBomba: Integer): IModelAbastecimentoParametros;
begin
  FNumeroBomba := pNumeroBomba;
  Result := Self;
end;

function TModelAbastecimento.SetParametros: IModelAbastecimentoParametros;
begin
  Result := Self;
end;

function TModelAbastecimento.SetQueryAbastecimentoParametros: IModelAbastecimentoQueryParametros;
begin
  Result := Self;
end;

function TModelAbastecimento.SetTipoCombustivel(pTipoCombustivel: Integer): IModelAbastecimentoParametros;
begin
  FTipoCombustivel := pTipoCombustivel;
  Result := Self;
end;

function TModelAbastecimento.SetValorAbastecido(pValorAbastecido: Double): IModelAbastecimentoParametros;
begin
  FValorAbastecido := pValorAbastecido;
  Result := Self;
end;

function TModelAbastecimento.SetValorCombustivelLitro(pValorCombustivelLitro: Double): IModelAbastecimentoParametros;
begin
  FValorCombustivelLitro := pValorCombustivelLitro;
  Result := Self;
end;

function TModelAbastecimento.SetValorImposto(pValorImposto: Double): IModelAbastecimentoParametros;
begin
  FValorImposto := pValorImposto;
  Result := Self;
end;

end.
