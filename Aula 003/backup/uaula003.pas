unit uAula003;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TfrmAula003 }

  TfrmAula003 = class(TForm)
    btnPROCESSA: TButton;
    Memo1: TMemo;
    procedure btnPROCESSAClick(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
  private

  public

  end;

var
  frmAula003: TfrmAula003;

implementation

{$R *.lfm}

{ TfrmAula003 }

procedure TfrmAula003.Memo1Change(Sender: TObject);
begin

end;

procedure TfrmAula003.btnPROCESSAClick(Sender: TObject);
var
  cNOME: string;
  nIDADE: integer;
  lMaiorIdade: boolean;
begin
     cNOME := 'Daniel';
     nIDADE := 4;
     Memo1.Lines.Add('Nome= '+cNOME+' idade='+ IntToStr(nIDADE) );
     if nIDADE >= 18 then
        Memo1.Lines.Add(cNOME+ ' e maior de idade !')
     else
         Memo1.Lines.Add(cNome+ ' e menor de idade !');


end;

end.

