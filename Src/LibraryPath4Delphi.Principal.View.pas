unit LibraryPath4Delphi.Principal.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, JclIDEUtils, JclCompilerUtils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinOffice2007Blue,
  dxSkinOffice2010Blue, dxSkinSeven, Vcl.StdCtrls, cxButtons, Vcl.Buttons,
  Vcl.ExtCtrls, cxControls, dxSkinscxPCPainter, dxBarBuiltInMenu, cxContainer,
  cxEdit, cxCalendar, cxTextEdit, cxMaskEdit, cxButtonEdit, cxPC,
  dxSkinsdxStatusBarPainter, dxStatusBar;

type
  TForm3 = class(TForm)
    Panel1: TPanel;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    Label2: TLabel;
    Label23: TLabel;
    cxButton1: TcxButton;
    edtDelphiVersion: TComboBox;
    edtDiretorioFramework: TcxButtonEdit;
    dxStatusBar1: TdxStatusBar;
    procedure cxButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtDelphiVersionChange(Sender: TObject);
  private
    FPathInstall: TJclBorRADToolInstallations;
    FDelphiVersion: Integer;
    tPlatform: TJclBDSPlatform;

    procedure FindDirs(ADirRoot: String; bAdicionar: Boolean = True);
    procedure AddLibrarySearchPath;
    procedure LoadDV();
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.cxButton1Click(Sender: TObject);
begin
  AddLibrarySearchPath;
end;

procedure TForm3.edtDelphiVersionChange(Sender: TObject);
begin
  FDelphiVersion := edtDelphiVersion.ItemIndex;
end;

// adicionar o paths ao library path do delphi
procedure TForm3.AddLibrarySearchPath;
begin
  FindDirs(IncludeTrailingPathDelimiter(edtDiretorioFramework.Text));
end;

procedure TForm3.FindDirs(ADirRoot: String; bAdicionar: Boolean = True);
var
  oDirList: TSearchRec;

  function EProibido(const ADir: String): Boolean;
  const
    LISTA_PROIBIDOS: ARRAY [0 .. 4] OF STRING = ('quick', 'rave', 'laz',
      'VerificarNecessidade', '__history');
  var
    Str: String;
  begin
    Result := False;
    for Str in LISTA_PROIBIDOS do
    begin
      Result := Pos(AnsiUpperCase(Str), AnsiUpperCase(ADir)) > 0;
      if Result then
        Break;
    end;
  end;

begin
  ADirRoot := IncludeTrailingPathDelimiter(ADirRoot);

  if FindFirst(ADirRoot + '*.*', faDirectory, oDirList) = 0 then
  begin
    try
      repeat
        if ((oDirList.Attr and faDirectory) <> 0) and (oDirList.Name <> '.') and
          (oDirList.Name <> '..') and (not EProibido(oDirList.Name)) then
        begin
          with FPathInstall.Installations[FDelphiVersion] do
          begin
            if bAdicionar then
            begin
              AddToLibrarySearchPath(ADirRoot + oDirList.Name, tPlatform);
              AddToLibraryBrowsingPath(ADirRoot + oDirList.Name, tPlatform);
            end
            else
              RemoveFromLibrarySearchPath(ADirRoot + oDirList.Name, tPlatform);
          end;
          // -- Procura subpastas
          FindDirs(ADirRoot + oDirList.Name, bAdicionar);
        end;
      until FindNext(oDirList) <> 0;
    finally
      FindClose(oDirList)
    end;
  end;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  LoadDV;
end;

procedure TForm3.LoadDV;
var
  I: Integer;
begin
  FPathInstall := TJclBorRADToolInstallations.Create;

  // popular o combobox de vers�es do delphi instaladas na m�quina
  for I := 0 to FPathInstall.Count - 1 do
  begin
    if FPathInstall.Installations[I].VersionNumberStr = 'd3' then
      edtDelphiVersion.Items.Add('Delphi 3')
    else if FPathInstall.Installations[I].VersionNumberStr = 'd4' then
      edtDelphiVersion.Items.Add('Delphi 4')
    else if FPathInstall.Installations[I].VersionNumberStr = 'd5' then
      edtDelphiVersion.Items.Add('Delphi 5')
    else if FPathInstall.Installations[I].VersionNumberStr = 'd6' then
      edtDelphiVersion.Items.Add('Delphi 6')
    else if FPathInstall.Installations[I].VersionNumberStr = 'd7' then
      edtDelphiVersion.Items.Add('Delphi 7')
    else if FPathInstall.Installations[I].VersionNumberStr = 'd9' then
      edtDelphiVersion.Items.Add('Delphi 2005')
    else if FPathInstall.Installations[I].VersionNumberStr = 'd10' then
      edtDelphiVersion.Items.Add('Delphi 2006')
    else if FPathInstall.Installations[I].VersionNumberStr = 'd11' then
      edtDelphiVersion.Items.Add('Delphi 2007')
    else if FPathInstall.Installations[I].VersionNumberStr = 'd12' then
      edtDelphiVersion.Items.Add('Delphi 2009')
    else if FPathInstall.Installations[I].VersionNumberStr = 'd14' then
      edtDelphiVersion.Items.Add('Delphi 2010')
    else if FPathInstall.Installations[I].VersionNumberStr = 'd15' then
      edtDelphiVersion.Items.Add('Delphi XE')
    else if FPathInstall.Installations[I].VersionNumberStr = 'd16' then
      edtDelphiVersion.Items.Add('Delphi XE2')
    else if FPathInstall.Installations[I].VersionNumberStr = 'd17' then
      edtDelphiVersion.Items.Add('Delphi XE3')
    else if FPathInstall.Installations[I].VersionNumberStr = 'd18' then
      edtDelphiVersion.Items.Add('Delphi XE4')
    else if FPathInstall.Installations[I].VersionNumberStr = 'd19' then
      edtDelphiVersion.Items.Add('Delphi XE5')
    else if FPathInstall.Installations[I].VersionNumberStr = 'd20' then
      edtDelphiVersion.Items.Add('Delphi XE6')
    else if FPathInstall.Installations[I].VersionNumberStr = 'd21' then
      edtDelphiVersion.Items.Add('Delphi XE7')
    else if FPathInstall.Installations[I].VersionNumberStr = 'd22' then
      edtDelphiVersion.Items.Add('Delphi XE8')
    else if FPathInstall.Installations[I].VersionNumberStr = 'd23' then
      edtDelphiVersion.Items.Add('Delphi 10 Seattle')
    else if FPathInstall.Installations[I].VersionNumberStr = 'd24' then
      edtDelphiVersion.Items.Add('Delphi 10.1 Berlin');

    // -- Evento disparado antes de iniciar a execu��o do processo.
    //FPathInstall.Installations[I].DCC32.OnBeforeExecute := BeforeExecute;

    // -- Evento para saidas de mensagens.
    //FPathInstall.Installations[I].OutputCallback := OutputCallLine;
  end;
end;

end.
