object fTarefa2: TfTarefa2
  Left = 0
  Top = 0
  Caption = 'Tarefa 2'
  ClientHeight = 224
  ClientWidth = 635
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
  object lblThread1: TLabel
    Left = 40
    Top = 32
    Width = 43
    Height = 13
    Caption = 'Thread 1'
  end
  object lblThread2: TLabel
    Left = 40
    Top = 91
    Width = 43
    Height = 13
    Caption = 'Thread 2'
  end
  object lblSleep1: TLabel
    Left = 424
    Top = 32
    Width = 26
    Height = 13
    Caption = 'Sleep'
  end
  object lblSleep2: TLabel
    Left = 424
    Top = 91
    Width = 26
    Height = 13
    Caption = 'Sleep'
  end
  object lblContador1: TLabel
    Left = 136
    Top = 32
    Width = 49
    Height = 13
    Caption = 'Contador:'
    Visible = False
  end
  object lblContador2: TLabel
    Left = 136
    Top = 91
    Width = 69
    Height = 13
    Caption = 'Contador: %d'
    Visible = False
  end
  object ProgressBar1: TProgressBar
    Left = 40
    Top = 51
    Width = 369
    Height = 17
    DoubleBuffered = True
    ParentDoubleBuffered = False
    Step = 1
    TabOrder = 0
  end
  object ProgressBar2: TProgressBar
    Left = 40
    Top = 111
    Width = 369
    Height = 17
    DoubleBuffered = True
    ParentDoubleBuffered = False
    Step = 1
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 424
    Top = 47
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 2
    Text = '0'
  end
  object Edit2: TEdit
    Left = 424
    Top = 107
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 3
    Text = '0'
  end
  object btnIniciar: TButton
    Left = 176
    Top = 168
    Width = 81
    Height = 25
    Caption = 'Iniciar Threads'
    TabOrder = 4
    OnClick = btnIniciarClick
  end
  object btnFechar: TButton
    Left = 375
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 5
    OnClick = btnFecharClick
  end
end
