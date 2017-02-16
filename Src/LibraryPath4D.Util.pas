unit LibraryPath4D.Util;

interface

uses
  Classes,
  System.SysUtils;

type

  TPath4DUtil = class sealed
  private
  public
    class function EhProibido(const pListEhProibido: string;
      const pPasta: string): Boolean; static;
  end;

implementation

{ TPath4DUtil }

class function TPath4DUtil.EhProibido(const pListEhProibido,
  pPasta: string): Boolean;
var
  vList: TStringList;
  I: Integer;
begin
  Result := False;
  vList := TStringList.Create;
  try
    vList.StrictDelimiter := False;
    vList.Delimiter := ';';
    vList.DelimitedText := Trim(pListEhProibido);
    for I := 0 to vList.Count - 1 do
    begin
      Result := Pos(AnsiUpperCase(vList[I]), AnsiUpperCase(pPasta)) > 0;
      if Result then
        Break;
    end;
  finally
    vList.Free;
  end;
end;

end.
