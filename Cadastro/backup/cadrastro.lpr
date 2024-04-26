program cadrastro;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, zcomponent, uPrincipal, uDM, uclientes, uprodutos
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFRMclientes, FRMclientes);
  Application.CreateForm(TFRMprodutos, FRMprodutos);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

