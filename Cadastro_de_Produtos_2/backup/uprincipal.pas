unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, MaskEdit,
  ExtCtrls, ComCtrls, DBGrids, DBCtrls, ActnList, Menus, rxmemds;

type

  { TFRMprincipal }

  TFRMprincipal = class(TForm)
    BTconfirmacao_cadastro: TButton;
    BTlimpar: TButton;
    BTadicionar: TButton;
    DSitens: TDataSource;
    DBGrid1: TDBGrid;
    TEnome_do_produto: TEdit;
    Label2: TLabel;
    RXitens: TRxMemoryData;
    RXitenscodigo_produto: TLongintField;
    RXitensnome_produto: TStringField;
    RXitensquantidade: TFloatField;
    RXitensvalor_total: TFloatField;
    RXitensvalor_unitario: TFloatField;
    TEcodigodoproduto: TEdit;
    TEquantidade: TEdit;
    TEvalordeunitario: TEdit;
    TEvalortotal: TEdit;
    TLcodigodoproduto: TLabel;
    TLquantidade: TLabel;
    TLvalordeunitario: TLabel;
    TLvalortotal: TLabel;
    TEtotal_1: TEdit;
    TEdesconto_1: TEdit;
    Timer1: TTimer;
    TMdata: TMaskEdit;
    TMhora: TMaskEdit;
    TEcliente: TEdit;
    TEsubtotal: TEdit;
    TEdesconto: TEdit;
    TEtotalprincipal: TEdit;
    Label1: TLabel;
    TLcliente: TLabel;
    TLdata: TLabel;
    TLdesconto: TLabel;
    TLhora: TLabel;
    TLsubtotal: TLabel;
    TLtotal: TLabel;
    procedure BTadicionarClick(Sender: TObject);
    procedure BTconfirmacao_cadastroClick(Sender: TObject);
    procedure BTconfirmacao_produtoClick(Sender: TObject);
    procedure BTlimparClick(Sender: TObject);
    //procedure DSitensDataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure TEcodigodoprodutoExit(Sender: TObject);
    procedure TEdescontoExit(Sender: TObject);
    //procedure TEdescontoExit(Sender: TObject);
    procedure TEquantidadeExit(Sender: TObject);
    procedure TEsubtotalExit(Sender: TObject);
    procedure TEtotalprincipalChange(Sender: TObject);
    procedure TEtotalprincipalExit(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  FRMprincipal: TFRMprincipal;

implementation

{$R *.lfm}

uses uDM;

{ TFRMprincipal }

procedure TFRMprincipal.BTconfirmacao_cadastroClick(Sender: TObject);
var
  ultimoID: integer;
begin

  if TEcliente.Text = '' then
  begin
    ShowMessage('Informar o campo Cliente!');
    TEcliente.SetFocus;
    Exit;
  end;

  if TEsubtotal.Text = '' then
  begin
    ShowMessage('Informar o campo Sub Total!');
    TEsubtotal.SetFocus;
    Exit;
  end;

  if TEdesconto.Text = '' then
  begin
    ShowMessage('Informar o campo Desconto!');
    TEdesconto.SetFocus;
    Exit;
  end;

  if TEtotalprincipal.Text = '' then
  begin
    ShowMessage('Informar o campo Total!');
    TEtotalprincipal.SetFocus;
    Exit;
  end;

  // confirmação para dar um CREATE
  if MessageDlg('Tem certeza que deseja inserir um novo cadastro?', mtConfirmation,[mbyes,mbno],0)= mryes then
  begin
    if MessageDlg('As informações estão corretas?', mtConfirmation,[mbyes,mbno],0)= mryes then
    begin
      DM.ZQcabecalho.close;
      DM.ZQcabecalho.SQL.Clear;
      DM.ZQcabecalho.SQL.Add('SELECT MAX(id) AS max_id FROM cabecalho');
      DM.ZQcabecalho.Open;
      if not DM.ZQcabecalho.IsEmpty then
      begin
        ultimoID := DM.ZQcabecalho.FieldByName('max_id').AsInteger;
        ShowMessage('O último ID Inserido foi: ' + IntToStr(ultimoID));
        BTlimpar.Click
      end
      else
          ShowMessage('Não há IDs inseridos.');
          DM.ZQcabecalho.close;
          DM.ZQcabecalho.close;
          DM.ZQcabecalho.SQL.Clear;
          DM.ZQcabecalho.SQL.Add('INSERT INTO cabecalho (data, hora, cliente, sub_total, desconto, total)');
          DM.ZQcabecalho.SQL.Add('VALUES (:data, :hora, :cliente, :sub_total, :desconto, :total)');
          DM.ZQcabecalho.ParamByName('data').AsString := TMdata.Text;
          DM.ZQcabecalho.ParamByName('hora').AsString := TMhora.Text;
          DM.ZQcabecalho.ParamByName('cliente').AsString := TEcliente.Text;
          DM.ZQcabecalho.ParamByName('sub_total').AsString := TEsubtotal.Text;
          DM.ZQcabecalho.ParamByName('desconto').AsString := TEdesconto_1.Text;
          DM.ZQcabecalho.ParamByName('total').AsString := TEtotal_1.Text;
          DM.ZQcabecalho.ExecSQL;
      end;
    end;                                                             //ARRUMAR E CRIAR AQUI ATENÇÃO
  end;

procedure TFRMprincipal.BTconfirmacao_produtoClick(Sender: TObject);
begin

end;

procedure TFRMprincipal.BTadicionarClick(Sender: TObject);
var
  total: double;
begin
  if TEcodigodoproduto.Text = '' then
  begin
    ShowMessage('Informar o código do produto!');
    TEcodigodoproduto.SetFocus;
    Exit;
  end;

  if TEquantidade.Text = '' then
  begin
    ShowMessage('Informar a Quantidade do Produto!');
    TEquantidade.SetFocus;
    Exit;
  end;

  if RXitens.Active = false then RXitens.Active := True;
  RXitens.Append;
  RXitenscodigo_produto.AsInteger := StrToInt(TEcodigodoproduto.Text);
  RXitensnome_produto.AsString := TEnome_do_produto.Text;
  RXitensquantidade.AsFloat := StrToFloat(TEquantidade.Text);
  RXitensvalor_unitario.AsFloat := StrToFloat(TEvalordeunitario.Text);
  RXitensvalor_total.AsFloat := StrToFloat(StringReplace(TEvalortotal.Text, '.', '', [rfReplaceAll]));
  RXitens.Post;
  //TEtotalprincipal.Text := stringreplace(FormatFloat('###,##0.00', resultado), '.', '', [rfReplaceAll]);
  TEcodigodoproduto.Clear;
  TEnome_do_produto.Clear;
  TEquantidade.Clear;
  TEvalordeunitario.Clear;
  TEvalortotal.Clear;

  total := 0.0;
  RXitens.First;
  while not RXitens.EOF do
  begin
      total := total + RXitensvalor_total.AsFloat;
      RXitens.next;
  end;

  TEsubtotal.Text := FormatFloat('#,##0.00', total);

  TEcodigodoproduto.SetFocus;
  Exit;
end;

procedure TFRMprincipal.BTlimparClick(Sender: TObject);
begin
  TEcliente.Text := '';
  TEsubtotal.Text := '';
  TEdesconto.Text := '';
  TEtotalprincipal.Text := '';
  TEdesconto_1.Text := '';
  TEtotal_1.Text := '';
end;

procedure TFRMprincipal.FormCreate(Sender: TObject);
begin

end;


procedure TFRMprincipal.TEcodigodoprodutoExit(Sender: TObject);
begin
  if TEcodigodoproduto.Text = '' then
  Exit;

  with DM do
  begin
      ZQpedidos.Close;
      ZQpedidos.SQL.Clear;
      ZQpedidos.SQL.Add('SELECT * FROM produtos WHERE codigo = :codigo');
      ZQpedidos.ParamByName('codigo').AsInteger := StrToInt(TEcodigodoproduto.Text);
      ZQpedidos.Open;

      if ZQpedidos.IsEmpty then
      begin
        ShowMessage('Código de Produto não encontrado!');
        TEcodigodoproduto.SetFocus;
      end
      else
      begin
          TEnome_do_produto.Text := ZQpedidos.FieldByName('produto').AsString;
          TEvalordeunitario.Text := FloatToStr(ZQpedidos.FieldByName('valor_de_venda').Asfloat);
      end;
  end;
end;


// SAIR E REALIZAR O TOTAL

procedure TFRMprincipal.TEdescontoExit(Sender: TObject);
var
  resultado: Double;
  subtotal: Double;
  porcentagem: Double;
  porcentagem_convertida: Double;
  ResultadoFormatado: string;
begin
  if TEsubtotal.Text = '' then
  begin
    ShowMessage('Informar o campo Subtotal!');
    TEsubtotal.SetFocus;
    Exit;
  end;

  if TEdesconto.Text = '' then
  begin
    ShowMessage('Informar o Campo Desconto!');
    TEdesconto.SetFocus;
    Exit;
  end;
  // Atribuição dos valores
  subtotal := StrToFloat(StringReplace(TEsubtotal.Text, '.', '', [rfReplaceAll]));
  porcentagem := StrToFloat(TEdesconto.Text);

  // Converter a porcentagem
  porcentagem_convertida := porcentagem / 100;
  resultado := subtotal - (subtotal * porcentagem_convertida);

  // Exibir o valor total formatado
  ResultadoFormatado := FormatFloat('R$ #,##0.00', resultado);
  TEtotalprincipal.Text := FloatToStr(resultado);
  TEtotal_1.Text := FormatFloat('R$ #,##0.00', resultado);

  // Exemplo de formatação do desconto
  TEdesconto_1.Text := FormatFloat('###,0%', porcentagem);
end;

{procedure TFRMprincipal.TEdescontoExit(Sender: TObject);
var
  resultado: double;
  subtotal: double;
  porcentagem: double;
  porcentagem_convertida: double;
  Total: Double;
  ResultadoFormatado: string;
begin
  if TEsubtotal.Text = '' then
  begin
    ShowMessage('Informar o campo Cód Produto!');
    TEcodigodoproduto.SetFocus;
    Exit;
  end;

  if TEsubtotal.Text <> '' then
  begin
    if TEdesconto.Text = '' then
    begin
      ShowMessage('Informar o Campo Desconto!');
      TEdesconto.SetFocus;
      Exit;
    end;
  end;

  // Atribuição dos valores
  subtotal := StrToFloat(TEsubtotal.Text);
  porcentagem := StrToFloat(TEdesconto.Text);

  // Converter a porcentagem
  porcentagem_convertida := porcentagem / 100;
  resultado := subtotal - (subtotal * porcentagem_convertida);

  // Mandar para caixa de saída
  // Formatar o resultado substituindo o ponto decimal por vírgula
  ResultadoFormatado := StringReplace(FloatToStr(Total), '.', ',', [rfReplaceAll]);

  // Exibir o valor total formatado
  TEvalortotal.Text := ResultadoFormatado;

  // Exemplo de formatação do valor total e do desconto
  TEtotal_1.Text := FormatFloat('R$ #,##0.00', Total);
  TEdesconto_1.Text := FormatFloat('###,0%', porcentagem);
end;}

procedure TFRMprincipal.TEquantidadeExit(Sender: TObject);
var
  valor_unitario: double;
  quantidade: double;
  resultado: double;
begin
  if TEquantidade.Text <> '' then
  begin
    quantidade := StrToFloat(TEquantidade.Text);
    valor_unitario := StrToFloat(TEvalordeunitario.Text);

    // Conta para Multiplicação do preço da quantidade
    resultado := valor_unitario * quantidade;

    // Converter para o formato string
    TEvalortotal.Text := FormatFloat('#,##0.00', resultado);
  end;
end;


procedure TFRMprincipal.TEsubtotalExit(Sender: TObject);
var
  resultado: double;
  subtotal: double;
  porcentagem: double;
  total: double;
  porcentagem_convertida: double;
begin
  if ((TEdesconto.Text = '') and (TEtotalprincipal.Text = '')) and (TEcodigodoproduto.Text = '') then
  begin
       ShowMessage('Informar o campo Cód Produto!');
       TEcodigodoproduto.SetFocus;
       Exit;
  end;
  if (TEdesconto.Text = '') and (TEtotalprincipal.Text <> '') then
  begin
       // Atribuição dos valores
       subtotal := StrToFloat(TEsubtotal.Text);
       porcentagem := StrToFloat(TEdesconto.Text);
       // Converter a porcentagem
       porcentagem_convertida := porcentagem / 100;
       resultado := subtotal - (subtotal * porcentagem_convertida);
  end
  else
  begin
      // Colocar nas variaveis
      subtotal := StrToFloat(TEsubtotal.Text);
      total := StrToFloat(TEtotalprincipal.Text);
      // Calcular a Porcentagem de desconto
      porcentagem := ((subtotal - total) / subtotal) * 100;
      // Mandar para caixa de saída
      TEdesconto.Text := FormatFloat('###,0', porcentagem);
      TEdesconto_1.Text := FormatFloat('###,0%', porcentagem);
  end;
end;

procedure TFRMprincipal.TEtotalprincipalChange(Sender: TObject);
begin

end;

procedure TFRMprincipal.TEtotalprincipalExit(Sender: TObject);
var
  subtotal: double;
  porcentagem: double;
  total: double;
begin
  // Verificação se está preenchido o campo Sub Total!
  if TEsubtotal.Text = '' then
  begin
    ShowMessage('Informar o campo Cód Produto!');
    TEcodigodoproduto.SetFocus;
    Exit;
  end;
{
  // Colocar nas variaveis
  subtotal := StrToFloat(TEsubtotal.Text);
  total := StrToFloat(TEtotalprincipal.Text);

  // Calcular a Porcentagem de desconto
  porcentagem := ((subtotal - total) / subtotal) * 100;

  // Mandar para caixa de saída
  TEdesconto.Text := FormatFloat('###,0', porcentagem);
  TEdesconto_1.Text := FormatFloat('###,0%', porcentagem);
}
end;

procedure TFRMprincipal.Timer1Timer(Sender: TObject);
begin
  TMhora.Text := FormatDateTime('hh:mm:ss', Time);
  TMdata.Text := FormatDateTime('dd/mm/yyyy', Date);
end;


end.

