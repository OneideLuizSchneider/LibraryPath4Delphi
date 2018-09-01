object LibraryPath4DView: TLibraryPath4DView
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'LibraryPath4Delphi - APP'
  ClientHeight = 408
  ClientWidth = 797
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 791
    Height = 41
    Align = alTop
    Caption = 'LibraryPath4D - APP'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object cxPageControl1: TcxPageControl
    AlignWithMargins = True
    Left = 3
    Top = 50
    Width = 791
    Height = 319
    Align = alTop
    TabOrder = 1
    Properties.ActivePage = cxTabSheet1
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 315
    ClientRectLeft = 4
    ClientRectRight = 787
    ClientRectTop = 24
    object cxTabSheet1: TcxTabSheet
      Caption = 'Config.'
      ImageIndex = 0
      object Label2: TLabel
        Left = 17
        Top = 7
        Width = 321
        Height = 13
        Caption = 
          'Diret'#243'rio onde ser'#225' instalado (o diret'#243'rio ser'#225' criado se n'#227'o ex' +
          'istir)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label23: TLabel
        Left = 593
        Top = 7
        Width = 67
        Height = 13
        Caption = 'Delphi Version'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbl1: TLabel
        Left = 17
        Top = 61
        Width = 208
        Height = 13
        Caption = 'Lista de Pastas a Ignorar separado por '#39#39' ; '#39#39
      end
      object lbl2: TLabel
        Left = 480
        Top = 61
        Width = 194
        Height = 13
        Caption = 'Pasta base para REMOVER subdiretorios'
      end
      object btnAdd: TcxButton
        Left = 33
        Top = 200
        Width = 285
        Height = 57
        Caption = 'Add Library PATH Delphi'
        LookAndFeel.NativeStyle = False
        TabOrder = 0
        OnClick = btnAddClick
      end
      object edtDelphiVersion: TComboBox
        Left = 593
        Top = 26
        Width = 172
        Height = 21
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnChange = edtDelphiVersionChange
      end
      object edtDiretorioFramework: TcxButtonEdit
        Left = 17
        Top = 26
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        TabOrder = 2
        Text = 'C:\Users\DELPHIBERLIN\Desktop\Componentes\NAME_FRAMEWORK\'
        Width = 536
      end
      object btnRemove: TcxButton
        Left = 480
        Top = 200
        Width = 285
        Height = 57
        Caption = 'Remove Library PATH Delphi'
        LookAndFeel.NativeStyle = False
        TabOrder = 3
        OnClick = btnRemoveClick
      end
      object memoListProibidos: TcxMemo
        Left = 17
        Top = 80
        Lines.Strings = (
          '__history;_history;.svn;.git;__recovery;DCU;Win32;Win64')
        TabOrder = 4
        Height = 89
        Width = 301
      end
      object edtPastaPrincipal: TcxTextEdit
        Left = 480
        Top = 80
        TabOrder = 5
        Text = 'NAME_FRAMEWORK'
        Width = 285
      end
    end
  end
  object dxStatusBar1: TdxStatusBar
    Left = 0
    Top = 388
    Width = 797
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
      end>
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = True
    LookAndFeel.SkinName = ''
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
  end
end
