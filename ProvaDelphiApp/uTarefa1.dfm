object fTarefa1: TfTarefa1
  Left = 0
  Top = 0
  Caption = 'Tarefa 1'
  ClientHeight = 393
  ClientWidth = 811
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object lblColunas: TLabel
    Left = 32
    Top = 32
    Width = 38
    Height = 13
    Caption = 'Colunas'
  end
  object lblTabela: TLabel
    Left = 272
    Top = 32
    Width = 37
    Height = 13
    Caption = 'Tabelas'
  end
  object lblCondicoes: TLabel
    Left = 509
    Top = 32
    Width = 49
    Height = 13
    Caption = 'Condi'#231#245'es'
  end
  object lblSQLGerado: TLabel
    Left = 40
    Top = 232
    Width = 57
    Height = 13
    Caption = 'SQL Gerado'
  end
  object memoColunas: TMemo
    Left = 32
    Top = 51
    Width = 209
    Height = 142
    TabOrder = 0
  end
  object memoTabela: TMemo
    Left = 272
    Top = 51
    Width = 209
    Height = 142
    TabOrder = 1
  end
  object memoCondicoes: TMemo
    Left = 509
    Top = 51
    Width = 209
    Height = 142
    Lines.Strings = (
      '')
    TabOrder = 2
  end
  object btnGeraSQL: TButton
    Left = 724
    Top = 120
    Width = 75
    Height = 25
    Caption = 'GeraSQL'
    TabOrder = 3
    OnClick = btnGeraSQLClick
  end
  object memoSQLGerado: TMemo
    Left = 40
    Top = 251
    Width = 678
    Height = 102
    TabOrder = 4
  end
  object spQuery1: TspQuery
    Left = 736
    Top = 48
  end
end
