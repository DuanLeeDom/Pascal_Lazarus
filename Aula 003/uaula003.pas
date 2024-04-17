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
begin



end;

end.

