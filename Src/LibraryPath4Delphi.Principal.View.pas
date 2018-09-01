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
  dxSkinsdxStatusBarPainter, dxStatusBar, cxMemo;

type
  TLibraryPath4DView = class(TForm)
    Panel1: TPanel;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    Label2: TLabel;
    Label23: TLabel;
    btnAdd: TcxButton;
    edtDelphiVersion: TComboBox;
    edtDiretorioFramework: TcxButtonEdit;
    dxStatusBar1: TdxStatusBar;
    btnRemove: TcxButton;
    memoListProibidos: TcxMemo;
    lbl1: TLabel;
    edtPastaPrincipal: TcxTextEdit;
    lbl2: TLabel;
    procedure btnAddClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtDelphiVersionChange(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
  private
    FPathInstall: TJclBorRADToolInstallations;
    FDelphiVersion: Integer;
    tPlatform: TJclBDSPlatform;

    procedure FindDirs(pDirRoot: String; bAdicionar: Boolean = True);
    procedure AddLibrarySearchPath;
    procedure RemoveDirectoriesAndOldPackages;
    procedure LoadDV();
  public
    { Public declarations }
  end;

var
  LibraryPath4DView: TLibraryPath4DView;

implementation

uses
  LibraryPath4D.Util;

{$R *.dfm}

procedure TLibraryPath4DView.btnAddClick(Sender: TObject);
begin
  AddLibrarySearchPath;
  ShowMessage('Processo finalizado!!!');
end;

procedure TLibraryPath4DView.btnRemoveClick(Sender: TObject);
begin
  RemoveDirectoriesAndOldPackages;
end;

procedure TLibraryPath4DView.edtDelphiVersionChange(Sender: TObject);
begin
  FDelphiVersion := edtDelphiVersion.ItemIndex;
end;

// adicionar o paths ao library path do delphi
procedure TLibraryPath4DView.AddLibrarySearchPath;
begin
  FindDirs(IncludeTrailingPathDelimiter(edtDiretorioFramework.Text));
end;

procedure TLibraryPath4DView.FindDirs(pDirRoot: String; bAdicionar: Boolean = True);
var
  vDirList: TSearchRec;
begin
  pDirRoot := IncludeTrailingPathDelimiter(pDirRoot);

  if FindFirst(pDirRoot + '*.*', faDirectory, vDirList) = 0 then
  begin
    try
      repeat
        if ((vDirList.Attr and faDirectory) <> 0) and (vDirList.Name <> '.') and
          (vDirList.Name <> '..') and (not TPath4DUtil.EhProibido(memoListProibidos.Lines.Text, vDirList.Name)) then
        begin
          with FPathInstall.Installations[FDelphiVersion] do
          begin
            if bAdicionar then
            begin
              AddToLibrarySearchPath(pDirRoot + vDirList.Name, tPlatform);
              AddToLibraryBrowsingPath(pDirRoot + vDirList.Name, tPlatform);
            end
            else
              RemoveFromLibrarySearchPath(pDirRoot + vDirList.Name, tPlatform);
          end;
          // -- Procura subpastas
          FindDirs(pDirRoot + vDirList.Name, bAdicionar);
        end;
      until FindNext(vDirList) <> 0;
    finally
      FindClose(vDirList)
    end;
  end;
end;

procedure TLibraryPath4DView.FormCreate(Sender: TObject);
begin
  LoadDV;
end;

procedure TLibraryPath4DView.LoadDV;
var
  I: Integer;
begin
  FPathInstall := TJclBorRADToolInstallations.Create;

  // popular o combobox de versões do delphi instaladas na máquina
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
      edtDelphiVersion.Items.Add('Delphi 10.1 Berlin')
    else if FPathInstall.Installations[I].VersionNumberStr = 'd25' then
      edtDelphiVersion.Items.Add('Delphi 10.2 Tokyo');
  end;
end;

procedure TLibraryPath4DView.RemoveDirectoriesAndOldPackages;
var
  vListPaths: TStringList;
  I: Integer;
  vFolderName:string;
begin
  vFolderName := Trim(edtPastaPrincipal.Text);
  vListPaths := TStringList.Create;
  try
    vListPaths.StrictDelimiter := True;
    vListPaths.Delimiter := ';';
    with FPathInstall.Installations[FDelphiVersion] do
    begin
      // remover do search path
      vListPaths.Clear;
      vListPaths.DelimitedText := RawLibrarySearchPath[tPlatform];
      for I := vListPaths.Count - 1 downto 0 do
      begin
        if Pos(AnsiUpperCase(vFolderName), AnsiUpperCase(vListPaths[I])) > 0 then
          vListPaths.Delete(I);
      end;
      RawLibrarySearchPath[tPlatform] := vListPaths.DelimitedText;
      // remover do browse path
      vListPaths.Clear;
      vListPaths.DelimitedText := RawLibraryBrowsingPath[tPlatform];
      for I := vListPaths.Count - 1 downto 0 do
      begin
        if Pos(vFolderName, AnsiUpperCase(vListPaths[I])) > 0 then
          vListPaths.Delete(I);
      end;
      RawLibraryBrowsingPath[tPlatform] := vListPaths.DelimitedText;
      // remover do Debug DCU path
      vListPaths.Clear;
      vListPaths.DelimitedText := RawDebugDCUPath[tPlatform];
      for I := vListPaths.Count - 1 downto 0 do
      begin
        if Pos(vFolderName, AnsiUpperCase(vListPaths[I])) > 0 then
          vListPaths.Delete(I);
      end;
      RawDebugDCUPath[tPlatform] := vListPaths.DelimitedText;
      // remover pacotes antigos
      for I := IdePackages.Count - 1 downto 0 do
      begin
        if Pos(vFolderName, AnsiUpperCase(IdePackages.PackageFileNames[I])) > 0 then
          IdePackages.RemovePackage(IdePackages.PackageFileNames[I]);
      end;
    end;
  finally
    vListPaths.Free;
  end;
end;

end.
