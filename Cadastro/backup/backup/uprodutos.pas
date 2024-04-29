unit uprodutos;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, MaskEdit,
  ExtCtrls;

type

  { TFRMprodutos }

  TFRMprodutos = class(TForm)
    BTexcluir: TButton;
    BTconfirmar: TButton;
    BTprocurar: TButton;
    BTatualizar: TButton;
    BTlimpar: TButton;
    BTsair: TButton;
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
    procedure TDmargemExit(Sender: TObject);
    procedure TDvalor_de_vendaExit(Sender: TObject);

  private

  public

  end;

var
  FRMprodutos: TFRMprodutos;

implementation

{$R *.lfm}

uses uDM;

{ TFRMprodutos }

procedure TFRMprodutos.BTconfirmarClick(Sender: TObject);
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

  // Confirmação para inserir um novo produto
  if MessageDlg('Tem certeza que deseja inserir um novo produto?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    // Confirmação das informações
    if MessageDlg('As informações estão corretas?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      // Insere novo registro
      DM.ZQprodutos.Close;
      DM.ZQprodutos.SQL.Clear;
      DM.ZQprodutos.SQL.Add('INSERT INTO PRODUTOS (produto, descricao, unidade, margem, codigo_de_barras, valor_de_venda, valor_de_compra)');
      DM.ZQprodutos.SQL.Add('VALUES (:produto, :descricao, :unidade, :margem, :codigo_de_barras, :valor_de_venda, :valor_de_compra)');
      DM.ZQprodutos.ParamByName('produto').AsString := TDnome.Text;
      DM.ZQprodutos.ParamByName('descricao').AsString := TDdescricao.Text;
      DM.ZQprodutos.ParamByName('unidade').AsString := TDunidade.Text;
      DM.ZQprodutos.ParamByName('margem').AsString := TDmargem.Text;
      DM.ZQprodutos.ParamByName('codigo_de_barras').AsString := TDcodigo_de_barras.Text;
      DM.ZQprodutos.ParamByName('valor_de_venda').AsString := TDvalor_de_venda.Text;
      DM.ZQprodutos.ParamByName('valor_de_compra').AsString := TDvalor_de_compra.Text;
      DM.ZQprodutos.ExecSQL;
      BTlimpar.Click;
    end;
  end;
end;

procedure TFRMprodutos.BTexcluirClick(Sender: TObject);
begin
  if MessageDlg('Desejá excluir o produto?', mtWarning, [mbyes,mbno],0)= mryes then
  begin
    DM.ZQprodutos.Close;
    DM.ZQprodutos.SQL.Clear;
    DM.ZQprodutos.SQL.Add('DELETE FROM produtos WHERE codigo = :codigo');
    DM.ZQprodutos.ParamByName('codigo').AsInteger := StrToInt(TDprocurar.Text);
    DM.ZQprodutos.ExecSQL;

    ShowMessage('Excluido com sucesso!');
    BTlimpar.click
  end;
end;

procedure TFRMprodutos.BTatualizarClick(Sender: TObject);
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
    DM.ZQprodutos.SQL.Add('UPDATE produtos SET produto = :produto, descricao = :descricao, unidade = :unidade, margem = :margem, codigo_de_barras = :codigo_de_barras,');
    DM.ZQprodutos.SQL.Add('valor_de_venda = :valor_de_venda, valor_de_compra = :valor_de_compra WHERE codigo = :codigo');
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

procedure TFRMprodutos.BTlimparClick(Sender: TObject);
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

procedure TFRMprodutos.BTprocurarClick(Sender: TObject);
begin
  if TDprocurar.Text = '' then
  begin
    ShowMessage('Informe o campo Código!');
    TDprocurar.SetFocus;
    Exit;
  end;

  DM.ZQprodutos.close;
  DM.ZQprodutos.SQL.Clear;
  DM.ZQprodutos.SQL.Add('SELECT * FROM produtos WHERE codigo = :codigo');
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

procedure TFRMprodutos.BTsairClick(Sender: TObject);
begin
  if MessageDlg('QUER FINALIZAR O PROGRAMA?', mtCustom, [mbyes, mbno],0)= mryes then
  begin
    Application.Terminate;
  end
end;


procedure TFRMprodutos.FormCreate(Sender: TObject);
begin

end;

// DESCOBRIR VALOR DE VENDA
procedure TFRMprodutos.TDmargemExit(Sender: TObject);
var
  resultado: Double;
  compra: Double;
  porcentagem: Double;
begin
  if TDmargem.Text <> '' then
  begin
     if TDvalor_de_compra.Text <> '' then
     begin
        // Converter texto para números
        compra := StrToFloat(TDvalor_de_compra.Text);
        porcentagem := StrToFloat(TDmargem.Text);

        // Calcular o valor de venda com base na margem de lucro
        resultado := compra + (compra * (porcentagem / 100));

        // Atualizar o campo de texto do valor com o resultado
        TDvalor_de_venda.Text := FormatFloat('#,##0.00', resultado); // Formata como moeda
      end
      else
          if TDmargem.Text = '' then
          begin
            ShowMessage('Por favor preencher a coluna Margem!');
            TDmargem.SetFocus;
            Exit;
          end;

          if TDvalor_de_compra.Text = '' then
          begin
            ShowMessage('Informe o campo Valor de Compra!');
            TDvalor_de_compra.SetFocus;
            Exit;
      end;
  end;
end;

// DESCOBRIR MARGEM
procedure TFRMprodutos.TDvalor_de_vendaExit(Sender: TObject);
var
  compra: Double;
  venda: Double;
begin

  if TDvalor_de_venda.Text <> '' then
  begin
       if TDvalor_de_compra.Text <> '' then
       begin
         // Converter texto para números
         compra := StrToFloat(TDvalor_de_compra.Text);
         venda := StrToFloat(TDvalor_de_venda.Text);

         // Atualizar o campo de texto do valor com o resultado
         TDmargem.Text := FloatToStr(((venda - compra) / compra) * 100);
       end
       else
         if TDvalor_de_compra.Text = '' then
         begin
          ShowMessage('Informe o campo Valor de Compra!');
          TDvalor_de_compra.SetFocus;
          Exit;
         end
  else
      ShowMessage('Informe o campo Valor de Venda!');
      TDvalor_de_venda.SetFocus;
      Exit;
  end;
end;
end.

