unit uDM;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ZConnection, ZDataset;

type

  { TDM }

  TDM = class(TForm)
    ZConnection: TZConnection;
    ZQcabecalho: TZQuery;
    ZQpedidos: TZQuery;
  private

  public

  end;

var
  DM: TDM;

implementation

{$R *.lfm}

end.

