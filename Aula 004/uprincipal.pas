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
begin
     dData := StrToDate(edtDATA.Text);
     Memo1.Lines.Add('Dia da Semana: '+ cNomeDiaDaSemana[DayOfWeek(dData)]);
end;

end.
