object Form3: TForm3
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'LibraryPath4Delphi - APP'
  ClientHeight = 334
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
    Caption = 'LibraryPath4Delphi - APP'
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
    Height = 239
    Align = alTop
    TabOrder = 1
    Properties.ActivePage = cxTabSheet1
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 235
    ClientRectLeft = 4
    ClientRectRight = 787
    ClientRectTop = 24
    object cxTabSheet1: TcxTabSheet
      Caption = 'Config.'
      ImageIndex = 0
      object Label2: TLabel
        Left = 33
        Top = 29
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
        Top = 29
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
      object cxButton1: TcxButton
        Left = 33
        Top = 96
        Width = 732
        Height = 57
        Caption = 'Add Library PATH Delphi'
        TabOrder = 0
        OnClick = cxButton1Click
      end
      object edtDelphiVersion: TComboBox
        Left = 593
        Top = 48
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
        Left = 33
        Top = 48
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        TabOrder = 2
        Text = 'C:\Users\DELPHIBERLIN\Desktop\Componentes\Teste\'
        Width = 536
      end
    end
  end
  object dxStatusBar1: TdxStatusBar
    Left = 0
    Top = 314
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
    ExplicitTop = 458
  end
end
