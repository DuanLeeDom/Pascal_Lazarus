unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus;

type

  { TForm1 }

  TForm1 = class(TForm)
    del: TButton;
    raiz: TButton;
    bt4: TButton;
    bt5: TButton;
    bt6: TButton;
    multiplicacao: TButton;
    x_2: TButton;
    bt1: TButton;
    bt2: TButton;
    bt3: TButton;
    menos: TButton;
    abre_parenteses: TButton;
    igual: TButton;
    bt0: TButton;
    virgula: TButton;
    porcentagem: TButton;
    mais: TButton;
    fecha_parenteses: TButton;
    modd: TButton;
    pi: TButton;
    bt7: TButton;
    bt8: TButton;
    bt9: TButton;
    divisao: TButton;
    visor: TEdit;
    procedure bt4Click(Sender: TObject);
    procedure bt5Click(Sender: TObject);
    procedure bt6Click(Sender: TObject);
    procedure abre_parentesesClick(Sender: TObject);
    procedure fecha_parentesesClick(Sender: TObject);
    procedure moddClick(Sender: TObject);
    procedure piClick(Sender: TObject);
    procedure raizClick(Sender: TObject);
    procedure x_2Click(Sender: TObject);
    procedure multiplicacaoClick(Sender: TObject);
    procedure bt1Click(Sender: TObject);
    procedure bt2Click(Sender: TObject);
    procedure bt3Click(Sender: TObject);
    procedure menosClick(Sender: TObject);
    procedure delClick(Sender: TObject);
    procedure igualClick(Sender: TObject);
    procedure bt0Click(Sender: TObject);
    procedure porcentagemClick(Sender: TObject);
    procedure virgulaClick(Sender: TObject);
    procedure maisClick(Sender: TObject);
    procedure bt7Click(Sender: TObject);
    procedure bt8Click(Sender: TObject);
    procedure bt9Click(Sender: TObject);
    procedure divisaoClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  valor1: real;
  valor2: real;
  valorant: real;
  funcao: integer;
  funcaoant: integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.bt0Click(Sender: TObject);
begin
  visor.Text := visor.Text + '0';
end;

procedure TForm1.porcentagemClick(Sender: TObject);
begin

end;

procedure TForm1.virgulaClick(Sender: TObject);
begin
  valor1 := StrToFloat(visor.Text);
  visor.Text := '';
  funcao := 2;
end;

procedure TForm1.maisClick(Sender: TObject);
begin
  if funcaoant = 0 then funcaoant := funcao;
  funcao := 3;
  if funcaoant <> funcao then
  begin
    if funcaoant = 1 then valor1 := valor1 + StrToFloat (visor.Text);
    funcaoant := 3;
  end
  else
  valor1 := StrToFloat(visor.Text);
  visor.Text := '';
end;

procedure TForm1.bt7Click(Sender: TObject);
begin
  visor.Text := visor.Text + '7';
end;

procedure TForm1.bt8Click(Sender: TObject);
begin
  visor.Text := visor.Text + '8';
end;

procedure TForm1.bt9Click(Sender: TObject);
begin
  visor.Text := visor.Text + '9';
end;

procedure TForm1.divisaoClick(Sender: TObject);
begin
  valor1 := StrTofloat(visor.Text);
  visor.Text := '';
  funcao := 4;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.bt1Click(Sender: TObject);
begin
  visor.Text := visor.Text + '1';
end;

procedure TForm1.bt4Click(Sender: TObject);
begin
  visor.Text := visor.Text + '4';
end;

procedure TForm1.bt5Click(Sender: TObject);
begin
  visor.Text := visor.Text + '5';
end;

procedure TForm1.bt6Click(Sender: TObject);
begin
  visor.Text := visor.Text + '6';
end;

procedure TForm1.abre_parentesesClick(Sender: TObject);
begin

end;

procedure TForm1.fecha_parentesesClick(Sender: TObject);
begin

end;

procedure TForm1.moddClick(Sender: TObject);
begin

end;

procedure TForm1.piClick(Sender: TObject);
begin

end;

procedure TForm1.raizClick(Sender: TObject);
begin

end;

procedure TForm1.x_2Click(Sender: TObject);
begin

end;

procedure TForm1.multiplicacaoClick(Sender: TObject);
begin
  if funcaoant = 0 then funcaoant := funcao;
  funcao := 3;
  if funcaoant <> funcao then
  begin
    if funcaoant = 1 then valor1 := valor1 + StrToFloat (visor.Text);
    funcaoant := 3;
  end
  else
  valor1 := StrToFloat(visor.Text);
  visor.Text := '';
end;

procedure TForm1.bt2Click(Sender: TObject);
begin
  visor.Text := visor.Text + '2';
end;

procedure TForm1.bt3Click(Sender: TObject);
begin
  visor.Text := visor.Text + '3';
end;

procedure TForm1.menosClick(Sender: TObject);
begin
  valor1 := StrToFloat(visor.Text);
  visor.text := '';
  funcao := 2;
end;

procedure TForm1.delClick(Sender: TObject);
begin
  visor.Text := '';

end;

procedure TForm1.igualClick(Sender: TObject);
var
  soma: real;
begin
  valor2 := StrToFloat(visor.Text);
  case (funcao) of
  1:
  begin
      soma := valor1 + valor2;
      visor.text := FloatToStr(soma);
  end;
  2:
  begin
      soma := valor1 - valor2;
      visor.text := FloatToStr(soma);
  end;
  3:
  begin
      soma := valor1 * valor2;
      visor.text := FloatToStr(soma);
  end;
  4:
  begin
      if(valor2<>0)then
       begin
         soma := valor1 / valor2;
         visor.text := FloatToStr(soma);
       end
      else
          begin
               SHowMessage('Divisão por zero!!');
               visor.Text := 'ERRO';
          end
      end
  end;
end; //finaliza o case
end.

