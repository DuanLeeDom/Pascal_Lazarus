unit uIndentificador;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus;

type

  { TftnPrincipal }

  TftnPrincipal = class(TForm)
    ind: TLabel;
    Verificar: TButton;
    ind_1: TEdit;
    ind_3: TEdit;
    ind_2: TEdit;
    Label1: TLabel;
    procedure VerificarClick(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private

  public

  end;

var
  ftnPrincipal: TftnPrincipal;

implementation

{$R *.lfm}

{ TftnPrincipal }

procedure TftnPrincipal.VerificarClick(Sender: TObject);
begin
   if ind_1.text ='1' then
   begin
     showmessage('Correto | Num 1');
   end
   else
   begin
        showmessage('Errado | Num 1');
   end;
   if ind_2.text ='2' then
   begin
     showmessage('Correto | Num 2');
   end
   else
   begin
        showmessage('Errado | Num 2');
   end;
   if ind_3.text ='3' then
   begin
     showmessage('Correto | Num 3');
     end
     else
   begin
        showmessage('Errado | Num 3');
   end;
end;

procedure TftnPrincipal.Label1Click(Sender: TObject);
begin
end;

end.

