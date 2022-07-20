object frmRedefinirSenha: TfrmRedefinirSenha
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Redefinir Senha'
  ClientHeight = 288
  ClientWidth = 452
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 452
    Height = 288
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 452
      Height = 45
      Align = alTop
      BevelOuter = bvNone
      Padding.Left = 10
      Padding.Top = 10
      TabOrder = 0
      object lblUsuario: TLabel
        Left = 10
        Top = 10
        Width = 442
        Height = 32
        Align = alTop
        Alignment = taCenter
        Caption = 'Usu'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -24
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 80
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 45
      Width = 452
      Height = 243
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 452
        Height = 48
        Align = alTop
        BevelOuter = bvNone
        Padding.Left = 10
        Padding.Top = 10
        TabOrder = 3
        object Label2: TLabel
          Left = 10
          Top = 10
          Width = 442
          Height = 21
          Align = alTop
          Alignment = taCenter
          Caption = '!!! Informe a sua Nova Senha !!!'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Segoe UI Semilight'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 217
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 48
        Width = 452
        Height = 129
        Align = alTop
        BevelOuter = bvNone
        Padding.Left = 10
        Padding.Right = 10
        TabOrder = 0
        object Label4: TLabel
          Left = 10
          Top = 65
          Width = 432
          Height = 19
          Align = alTop
          Caption = 'Confirme a sua Senha:'
          ExplicitWidth = 161
        end
        object Label3: TLabel
          Left = 10
          Top = 0
          Width = 432
          Height = 19
          Align = alTop
          Caption = 'Digite aqui a sua nova Senha:'
          ExplicitWidth = 211
        end
        object edtConfirmacaoSenha: TEdit
          Left = 10
          Top = 84
          Width = 432
          Height = 27
          Align = alTop
          BevelInner = bvNone
          BevelOuter = bvNone
          PasswordChar = '*'
          TabOrder = 1
        end
        object edtSenha: TEdit
          Left = 10
          Top = 19
          Width = 432
          Height = 27
          Align = alTop
          BevelInner = bvNone
          BevelOuter = bvNone
          PasswordChar = '*'
          TabOrder = 0
        end
        object Panel4: TPanel
          Left = 10
          Top = 111
          Width = 432
          Height = 7
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
        end
        object Panel8: TPanel
          Left = 10
          Top = 46
          Width = 432
          Height = 19
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 3
        end
      end
      object Panel6: TPanel
        Left = 242
        Top = 177
        Width = 210
        Height = 66
        Align = alRight
        BevelOuter = bvNone
        Padding.Left = 10
        Padding.Top = 3
        Padding.Right = 30
        TabOrder = 2
        object btnEntrar: TButton
          Left = 10
          Top = 3
          Width = 170
          Height = 38
          Align = alTop
          Caption = 'Cancelar'
          TabOrder = 0
          OnClick = btnEntrarClick
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 177
        Width = 209
        Height = 66
        Align = alLeft
        BevelOuter = bvNone
        Padding.Left = 30
        Padding.Top = 3
        Padding.Right = 10
        TabOrder = 1
        object Button1: TButton
          Left = 30
          Top = 3
          Width = 169
          Height = 38
          Align = alTop
          Caption = 'Confirmar'
          TabOrder = 0
          OnClick = Button1Click
        end
      end
    end
  end
end
