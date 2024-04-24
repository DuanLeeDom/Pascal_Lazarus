unit uDM;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, mysql57conn, Menus, ZConnection, ZDataset;

type

  { TDM }

  TDM = class(TDataModule)
    ZConnection1: TZConnection;
    ZConnection2: TZConnection;
    ZQclientes: TZQuery;
    ZQprodutos: TZQuery;
  private

  public

  end;

var
  DM: TDM;

implementation

{$R *.lfm}

end.

