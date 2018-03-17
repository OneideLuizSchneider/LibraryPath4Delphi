program LibraryPath4Delphi;

uses
  Vcl.Forms,
  LibraryPath4Delphi.Principal.View in 'Src\LibraryPath4Delphi.Principal.View.pas' {LibraryPath4DView},
  Vcl.Themes,
  Vcl.Styles,
  LibraryPath4D.Util in 'Src\LibraryPath4D.Util.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Light');
  Application.CreateForm(TLibraryPath4DView, LibraryPath4DView);
  Application.Run;
end.
