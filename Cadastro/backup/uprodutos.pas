unit uprodutos;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    BTexcluir: TButton;
    BTconfirmar: TButton;
    BTprocurar: TButton;
    BTatualizar: TButton;
    BTlimpar: TButton;
    TLinformeocodigo: TLabel;
    TDnome_1: TEdit;
    TDcodigo_de_barras: TEdit;
    TDnome_2: TEdit;
    TDprocurar: TEdit;
    TDunidade: TEdit;
    TDvalor_de_compra: TEdit;
    TDmargem: TEdit;
    TDvalor_de_venda: TEdit;
    titulo: TLabel;
    nome_1: TLabel;
    codigodebarras: TLabel;
    nome_2: TLabel;
    unidade: TLabel;
    valordecompra: TLabel;
    margem: TLabel;
    valordevenda: TLabel;
    procedure BTatualizarClick(Sender: TObject);
    procedure BTconfirmarClick(Sender: TObject);
    procedure BTlimparClick(Sender: TObject);
    procedure BTprocurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

  if TDnome_1.Text = '' then
  begin
    ShowMessage('Informe o campo Nome');
    TDnome_1.SetFocus;
    Exit;
  end;

  if TDnome_2.Text = '' then
  begin
    ShowMessage('Informe o campo Nome!');
    TDnome_2.SetFocus;
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
             DM.ZQprodutos.SQL.Add('INSERT INTO PRODUTO (nome_1, codigo_de_barras, nome_2, unidade, valor_de_compra, margem, valor_de_venda)');
             DM.ZQprodutos.SQL.Add('VALUES (:nome_1, :codigo_de_barras, :nome_2, :unidade, :valor_de_compra, :margem, :valor_de_venda)');
             DM.ZQprodutos.ParamByName('nome_1').AsString := TDnome_1.Text;
             DM.ZQprodutos.ParamByName('codigo_de_barras').AsString := TDcodigo_de_barras.Text;
             DM.ZQprodutos.ParamByName('nome_2').AsString := TDnome_2.Text;
             DM.ZQprodutos.ParamByName('unidade').AsString := TDunidade.Text;
             DM.ZQprodutos.ParamByName('valor_de_compra').AsString := TDvalor_de_compra.Text;
             DM.ZQprodutos.ParamByName('margem').AsString := TDmargem.Text;
             DM.ZQprodutos.ParamByName('valor_de_venda').AsString := TDvalor_de_venda.Text;
             DM.ZQprodutos.ExecSQL;
       end;
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

  if TDnome_1.Text = '' then
  begin
    ShowMessage('Informe o campo Nome!');
    TDnome_1.SetFocus;
    Exit;
  end;

  if TDnome_2.Text = '' then
  begin
    ShowMessage('Informe o campo Nome!');
    TDnome_2.SetFocus;
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
    DM.ZQprodutos.SQL.Add('UPGRADE produto SET nome_1 = :nome_1, codigo_de_barras = :codigo_de_barras, nome_2 = :nome_2, unidade = :unidade, valor_de_compra = :valor_de_compra, margem = :margem, valor_de_venda = :valor_de_venda');
    DM.ZQprodutos.ParamByName('nome_1').AsString := TDnome_1.Text;
    DM.ZQprodutos.ParamByName('codigo_de_barras').AsString := TDcodigo_de_barras.Text;
    DM.ZQprodutos.ParamByName('nome_2').AsString := TDnome_2.Text;
    DM.ZQprodutos.ParamByName('unidade').AsString := TDunidade.Text;
    DM.ZQprodutos.ParamByName('valor_de_compra').AsString := TDvalor_de_compra.Text;
    DM.ZQprodutos.ParamByName('margem').AsString := TDmargem.Text;
    DM.ZQprodutos.ParamByName('valor_de_venda').AsString := TDvalor_de_venda.Text;
  end;
end;

procedure TForm2.BTlimparClick(Sender: TObject);
begin
     TDprocurar.Text := '';
     TDnome_1.Text := '';
     TDnome_2.Text := '';
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
    ShowMessage('Código de cliente não encontrado!');
    TDprocurar.SetFocus;
    Exit;
  end;
  TDnome_1.Text := DM.ZQprodutos.FieldByName('nome_1').AsString;
  TDcodigo_de_barras.Text := DM.ZQprodutos.FieldByName('codigo_de_barras').AsString;
  TDnome_2.Text := DM.ZQprodutos.FieldByName('nome_2').AsString;
  TDunidade.Text := DM.ZQprodutos.FieldByName('unidade').AsString;
  TDvalor_de_compra.Text := DM.ZQprodutos.FieldByName('valor_de_compra').AsString;
  TDmargem.Text := DM.ZQprodutos.FieldByName('margem').AsString;
  TDvalor_de_venda.Text := DM.ZQprodutos.FieldByName('valor_de_venda').AsString;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin

end;

end.

