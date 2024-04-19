unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus;

type

  { TfrmPrincipal }

  TfrmPrincipal = class(TForm)
    btnProcessa: TButton;
    edtDATA: TEdit;
    Label1: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    procedure btnProcessaClick(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
  private

  public

  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.lfm}

{ TfrmPrincipal }

procedure TfrmPrincipal.Memo1Change(Sender: TObject);
begin

end;

procedure TfrmPrincipal.btnProcessaClick(Sender: TObject);
var
  cNomeDiaDaSemana: array[1..7] of String = ('Domingo','Segunda','Terca','Quarta','Quinta','Sexta','Sabado');
  dData: TDateTime;
  nDia: Integer;
  cDiaSemana: String;
begin
     // Forma Normal
     dData := StrToDate(edtDATA.Text);
     nDia := DayOfWeek(dData);
     cDiaSemana := cNomeDiaDaSemana[nDia];
     Memo1.Lines.Add('Dia da Semana: '+ cNomeDiaDaSemana[nDia]);
     // Forma Simplificada
     Memo2.Lines.Add('Dia da Semana: '+ cNomeDiaDaSemana[DayOfWeek(StrToDate(edtDATA.Text)]);
end;

end.
