unit uprodutos;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, MaskEdit,
  ExtCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    BTexcluir: TButton;
    BTconfirmar: TButton;
    BTprocurar: TButton;
    BTatualizar: TButton;
    BTlimpar: TButton;
    BTsair: TButton;
    MaskEdit1: TMaskEdit;
    TLinformeocodigo: TLabel;
    TDnome: TEdit;
    TDcodigo_de_barras: TEdit;
    TDdescricao: TEdit;
    TDprocurar: TEdit;
    TDunidade: TEdit;
    TDvalor_de_compra: TEdit;
    TDmargem: TEdit;
    TDvalor_de_venda: TEdit;
    titulo: TLabel;
    nome: TLabel;
    codigodebarras: TLabel;
    descricao: TLabel;
    unidade: TLabel;
    valordecompra: TLabel;
    margem: TLabel;
    valordevenda: TLabel;
    procedure BTatualizarClick(Sender: TObject);
    procedure BTconfirmarClick(Sender: TObject);
    procedure BTexcluirClick(Sender: TObject);
    procedure BTlimparClick(Sender: TObject);
    procedure BTprocurarClick(Sender: TObject);
    procedure BTsairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MaskEdit1Change(Sender: TObject);
    procedure TDmargemChange(Sender: TObject);
    procedure TDmargemExit(Sender: TObject);
    procedure TDvalor_de_compraChange(Sender: TObject);
    procedure TDvalor_de_vendaChange(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

uses uDM;

{ TForm2 }

procedure TForm2.BTconfirmarClick(Sender: TObject);
var
  ultimoID: Integer;
begin

  if TDnome.Text = '' then
  begin
    ShowMessage('Informe o campo Nome');
    TDnome.SetFocus;
    Exit;
  end;

  if TDdescricao.Text = '' then
  begin
    ShowMessage('Informe o campo Descrição!');
    TDdescricao.SetFocus;
    Exit;
  end;

  if TDunidade.Text = '' then
  begin
    ShowMessage('Informe o campo Unidade!');
    TDunidade.SetFocus;
    Exit;
  end;

  if TDmargem.Text = '' then
  begin
    ShowMessage('Informe o campo Margem!');
    TDmargem.SetFocus;
    Exit;
  end;

  if TDvalor_de_venda.Text = '' then
  begin
    ShowMessage('Informe o campo Valor de Venda!');
    TDvalor_de_venda.SetFocus;
    Exit;
  end;

  if TDcodigo_de_barras.Text = '' then
  begin
    ShowMessage('Informe o campo Código de Barras!');
    TDcodigo_de_barras.SetFocus;
    Exit;
  end;

  if TDvalor_de_compra.Text = '' then
  begin
    ShowMessage('Informe o campo Valor de Compra!');
    TDvalor_de_compra.SetFocus;
    Exit;
  end;

  if MessageDlg('Tem certeza que deseja inserir um novo produto?', mtConfirmation,[mbyes,mbno],0)= mryes then
  begin
       if MessageDlg('As informações estão corretas?', mtConfirmation,[mbyes,mbno],0)= mryes then
       begin
         DM.ZQprodutos.SQL.Text := 'SELECT MAX(codigo) AS max_codigo FROM produto';
         DM.ZQprodutos.Open;
         if not DM.ZQprodutos.IsEmpty then
         begin
              ultimoID := DM.ZQprodutos.FieldByName('max_codigo').AsInteger;
              ShowMessage('O último ID inserido foi: ' + IntToStr(ultimoID));
         end;
             ShowMessage('Não há IDs inseridos.');
             DM.ZQprodutos.close;
             DM.ZQprodutos.close;
             DM.ZQprodutos.SQL.clear;
             DM.ZQprodutos.SQL.Add('INSERT INTO PRODUTO (produto, descricao, unidade, margem, codigo_de_barras, valor_de_venda, valor_de_compra)');
             DM.ZQprodutos.SQL.Add('VALUES (:produto, :descricao, :unidade, :margem, :codigo_de_barras, :valor_de_venda, :valor_de_compra)');
             DM.ZQprodutos.ParamByName('produto').AsString := TDnome.Text;
             DM.ZQprodutos.ParamByName('descricao').AsString := TDdescricao.Text;
             DM.ZQprodutos.ParamByName('unidade').AsString := TDunidade.Text;
             DM.ZQprodutos.ParamByName('margem').AsString := TDmargem.Text;
             DM.ZQprodutos.ParamByName('codigo_de_barras').AsString := TDcodigo_de_barras.Text;
             DM.ZQprodutos.ParamByName('valor_de_venda').AsString := TDvalor_de_venda.Text;
             DM.ZQprodutos.ParamByName('valor_de_compra').AsString := TDvalor_de_compra.Text;
             DM.ZQprodutos.ExecSQL;
       end;
       BTlimpar.click
  end;
end;

procedure TForm2.BTexcluirClick(Sender: TObject);
begin
  if MessageDlg('Desejá excluir o produto?', mtWarning, [mbyes,mbno],0)= mryes then
  begin
    DM.ZQprodutos.Close;
    DM.ZQprodutos.SQL.Clear;
    DM.ZQprodutos.SQL.Add('DELETE FROM produto WHERE codigo = :codigo');
    DM.ZQprodutos.ParamByName('codigo').AsInteger := StrToInt(TDprocurar.Text);
    DM.ZQprodutos.ExecSQL;

    ShowMessage('Excluido com sucesso!');
    BTlimpar.click
  end;
end;

procedure TForm2.BTatualizarClick(Sender: TObject);
begin
  if TDprocurar.Text = '' then
  begin
    ShowMessage('É OBRIGATÓRIO INFORMAR O CÓDIGO');
    TDprocurar.SetFocus;
    Exit;
  end;

  if TDnome.Text = '' then
  begin
    ShowMessage('Informe o campo Nome!');
    TDnome.SetFocus;
    Exit;
  end;

  if TDdescricao.Text = '' then
  begin
    ShowMessage('Informe o campo Descrição!');
    TDdescricao.SetFocus;
    Exit;
  end;

  if TDunidade.Text = '' then
  begin
    ShowMessage('Informe o campo Unidade!');
    TDunidade.SetFocus;
    Exit;
  end;

  if TDmargem.Text = '' then
  begin
    ShowMessage('Informe o campo Margem!');
    TDmargem.SetFocus;
    Exit;
  end;

  if TDvalor_de_venda.Text = '' then
  begin
    ShowMessage('Informe o campo Valor de Venda!');
    TDvalor_de_venda.SetFocus;
    Exit;
  end;

  if TDcodigo_de_barras.Text = '' then
  begin
    ShowMessage('Informe o campo Codigo de Barras!');
    TDcodigo_de_barras.SetFocus;
    Exit;
  end;

  if TDvalor_de_compra.Text = '' then
  begin
    ShowMessage('Informe o campo Valor de Compra!');
    TDvalor_de_compra.SetFocus;
    Exit;
  end;

  if MessageDlg('Desejá atualizar o produto?', mtConfirmation,[mbyes,mbno],0)= mryes then
  begin
    DM.ZQprodutos.Close;
    DM.ZQprodutos.SQL.Clear;
    DM.ZQprodutos.SQL.Add('UPDATE produto SET produto = :produto, descricao = :descricao, unidade = :unidade, margem = :margem, codigo_de_barras = :codigo_de_barras, valor_de_venda = :valor_de_venda, valor_de_compra = :valor_de_compra, codigo = :codigo');
    DM.ZQprodutos.ParamByName('produto').AsString := TDnome.Text;
    DM.ZQprodutos.ParamByName('descricao').AsString := TDdescricao.Text;
    DM.ZQprodutos.ParamByName('unidade').AsString := TDunidade.Text;
    DM.ZQprodutos.ParamByName('margem').AsString := TDmargem.Text;
    DM.ZQprodutos.ParamByName('codigo_de_barras').AsString := TDcodigo_de_barras.Text;
    DM.ZQprodutos.ParamByName('valor_de_venda').AsString := TDvalor_de_venda.Text;
    DM.ZQprodutos.ParamByName('valor_de_compra').AsString := TDvalor_de_compra.Text;
    DM.ZQprodutos.ParamByName('codigo').AsInteger := StrToInt(TDprocurar.Text);
    DM.ZQprodutos.ExecSQL;

    ShowMessage('Atualizado com sucesso!');
    BTlimpar.click
  end;
end;

procedure TForm2.BTlimparClick(Sender: TObject);
begin
     TDprocurar.Text := '';
     TDnome.Text := '';
     TDdescricao.Text := '';
     TDunidade.Text := '';
     TDmargem.Text := '';
     TDvalor_de_venda.Text := '';
     TDcodigo_de_barras.Text := '';
     TDvalor_de_compra.Text := '';

end;

procedure TForm2.BTprocurarClick(Sender: TObject);
begin
  if TDprocurar.Text = '' then
  begin
    ShowMessage('Informe o campo Código!');
    TDprocurar.SetFocus;
    Exit;
  end;

  DM.ZQprodutos.close;
  DM.ZQprodutos.SQL.Clear;
  DM.ZQprodutos.SQL.Add('SELECT * FROM produto WHERE codigo = :codigo');
  DM.ZQprodutos.ParamByName('codigo').AsInteger := StrToInt(TDprocurar.Text);
  DM.ZQprodutos.Open;

  if DM.ZQprodutos.IsEmpty then
  begin
    ShowMessage('Código de produto não encontrado!');
    TDprocurar.SetFocus;
    Exit;
  end;

  TDnome.Text := DM.ZQprodutos.FieldByName('produto').AsString;
  TDdescricao.Text := DM.ZQprodutos.FieldByName('descricao').AsString;
  TDunidade.Text := DM.ZQprodutos.FieldByName('unidade').AsString;
  TDmargem.Text := DM.ZQprodutos.FieldByName('margem').AsString;
  TDcodigo_de_barras.Text := DM.ZQprodutos.FieldByName('codigo_de_barras').AsString;
  TDvalor_de_venda.Text := DM.ZQprodutos.FieldByName('valor_de_venda').AsString;
  TDvalor_de_compra.Text := DM.ZQprodutos.FieldByName('valor_de_compra').AsString;
  end;

procedure TForm2.BTsairClick(Sender: TObject);
begin
  if MessageDlg('QUER FINALIZAR O PROGRAMA?', mtWarning,[mbyes,mbno],0)= mryes then
  begin
    Application.Terminate;
  end
  else
      ShowMessage('O programa não foi terminado!');
  end;

procedure TForm2.FormCreate(Sender: TObject);
begin

end;

procedure TForm2.MaskEdit1Change(Sender: TObject);
begin

end;

procedure TForm2.TDmargemChange(Sender: TObject);
begin

end;

procedure TForm2.TDmargemExit(Sender: TObject);
begin

end;

procedure TForm2.TDvalor_de_compraChange(Sender: TObject);
var
  Value: double;
begin
  // Remover caractere não numéricos do texto
  TDvalor_de_compra.Text := StringReplace(TDvalor_de_compra.Text, 'R$', '', [rfReplaceAll]);
  TDvalor_de_compra.Text := StringReplace(TDvalor_de_compra.Text, ',', '', [rfReplaceAll]);

  // Tenta converter o texto para um valor Double
  TDvalor_de_compra.Text := 'R$ ' + FormatFloat('#,##0.00', Value);

  // Posicionar o cursor no final do texto
  TDvalor_de_compra.SelStart := Length(TDvalor_de_compra.Text);
end;

procedure TForm2.TDvalor_de_vendaChange(Sender: TObject);
var
  resultado: Double;
  porcentagem: Integer;
  compra: Double;
  vendad: Double;
  lucro: Double;
  quantidade: Double;

begin
  // Converter texto para números
  compra := StrToFloatDef(TDvalor_de_compra.Text, 0.0);
  lucro := StrToFloatDef(TDmargem.Text, 0.0);
  quantidade := StrToFloatDef(TDunidade.Text, 1.0);

  // Calcular o valor de venda com base na margem de lucro
  resultado := compra + (compra * (lucro  / 100)) * quantidade;

  // Atualizar o campo de texto do valor com o resultado
  TDvalor_de_venda.Text := FloatToStr(resultado);
end;

end.

