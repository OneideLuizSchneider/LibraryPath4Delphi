program LibraryPath4Delphi;

uses
  Vcl.Forms,
  LibraryPath4Delphi.Principal.View in 'Src\LibraryPath4Delphi.Principal.View.pas' {Form3},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Light');
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
