unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TfrmPrincipal }

  TfrmPrincipal = class(TForm)
    btnMOSTRAR: TButton;
    chkMOSTRASOBR: TCheckBox;
    edtNOME: TEdit;
    edtSOBRENOME: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnMOSTRARClick(Sender: TObject);
  private

  public

  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.lfm}

{ TfrmPrincipal }

procedure TfrmPrincipal.btnMOSTRARClick(Sender: TObject);
begin
  //
  if chkMOSTRASOBR.Checked then
     ShowMessage('Ola '+edtNOME.Text+ ' ' +edtSOBRENOME.Text)
  else
     ShowMessage('Ola '+edtNOME.Text);
  //
end;

end.

