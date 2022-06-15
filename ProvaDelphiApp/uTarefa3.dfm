object fTarefa3: TfTarefa3
  Left = 0
  Top = 0
  Caption = 'Tarefa 3'
  ClientHeight = 375
  ClientWidth = 677
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 528
    Top = 269
    Width = 40
    Height = 13
    Caption = 'Total R$'
  end
  object Label3: TLabel
    Left = 528
    Top = 315
    Width = 81
    Height = 13
    Caption = 'Total divis'#245'es R$'
  end
  object dbGridProjeto: TDBGrid
    Left = 0
    Top = 35
    Width = 677
    Height = 228
    Align = alTop
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object PanelSuperior: TPanel
    Left = 0
    Top = 0
    Width = 677
    Height = 35
    Align = alTop
    BevelOuter = bvNone
    ShowCaption = False
    TabOrder = 1
    ExplicitWidth = 642
    object Label1: TLabel
      Left = 5
      Top = 13
      Width = 96
      Height = 13
      Caption = 'Valores por projeto:'
    end
    object Panel1: TPanel
      Left = 408
      Top = 24
      Width = 185
      Height = 41
      Caption = 'Panel1'
      TabOrder = 0
    end
  end
  object edtTotal: TEdit
    Left = 528
    Top = 288
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object edtTotalDiv: TEdit
    Left = 528
    Top = 334
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object btnObterTotal: TButton
    Left = 447
    Top = 286
    Width = 75
    Height = 25
    Caption = 'Obter Total'
    TabOrder = 4
    OnClick = btnObterTotalClick
  end
  object btnObterTotalDiv: TButton
    Left = 416
    Top = 332
    Width = 106
    Height = 25
    Caption = 'Obter Total divis'#245'es'
    TabOrder = 5
    OnClick = btnObterTotalDivClick
  end
end
