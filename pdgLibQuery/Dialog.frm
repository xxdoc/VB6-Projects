VERSION 5.00
Begin VB.Form Dialog 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Book Info"
   ClientHeight    =   4488
   ClientLeft      =   2760
   ClientTop       =   3780
   ClientWidth     =   8052
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4488
   ScaleWidth      =   8052
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox txtInfo 
      Appearance      =   0  'Flat
      Height          =   300
      Index           =   7
      Left            =   1680
      Locked          =   -1  'True
      TabIndex        =   18
      Top             =   3480
      Width           =   6135
   End
   Begin VB.TextBox txtInfo 
      Appearance      =   0  'Flat
      Height          =   300
      Index           =   6
      Left            =   1680
      Locked          =   -1  'True
      TabIndex        =   17
      Top             =   3000
      Width           =   6135
   End
   Begin VB.TextBox txtInfo 
      Appearance      =   0  'Flat
      Height          =   300
      Index           =   5
      Left            =   1680
      Locked          =   -1  'True
      TabIndex        =   16
      Top             =   2520
      Width           =   6135
   End
   Begin VB.TextBox txtInfo 
      Appearance      =   0  'Flat
      Height          =   300
      Index           =   4
      Left            =   1680
      Locked          =   -1  'True
      TabIndex        =   15
      Top             =   2040
      Width           =   6135
   End
   Begin VB.TextBox txtInfo 
      Appearance      =   0  'Flat
      Height          =   300
      Index           =   3
      Left            =   1680
      Locked          =   -1  'True
      TabIndex        =   14
      Top             =   1560
      Width           =   6135
   End
   Begin VB.TextBox txtInfo 
      Appearance      =   0  'Flat
      Height          =   300
      Index           =   2
      Left            =   1680
      Locked          =   -1  'True
      TabIndex        =   13
      Top             =   1080
      Width           =   6135
   End
   Begin VB.TextBox txtInfo 
      Appearance      =   0  'Flat
      Height          =   300
      Index           =   1
      Left            =   1680
      Locked          =   -1  'True
      TabIndex        =   12
      Top             =   600
      Width           =   6135
   End
   Begin VB.TextBox txtInfo 
      Appearance      =   0  'Flat
      Height          =   300
      Index           =   0
      Left            =   1680
      Locked          =   -1  'True
      TabIndex        =   11
      Top             =   120
      Width           =   6135
   End
   Begin VB.CommandButton cmdOpenInIE 
      Caption         =   "Open In IE"
      Height          =   375
      Left            =   2508
      TabIndex        =   10
      Top             =   3960
      Width           =   1455
   End
   Begin VB.CommandButton cmdOpenSS 
      Caption         =   "Open In SSReader"
      Height          =   375
      Left            =   4320
      TabIndex        =   9
      Top             =   3960
      Width           =   1935
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "Close"
      Height          =   375
      Left            =   6600
      TabIndex        =   0
      Top             =   3960
      Width           =   1215
   End
   Begin VB.Label lblInfo 
      Alignment       =   1  'Right Justify
      Height          =   300
      Index           =   7
      Left            =   240
      TabIndex        =   8
      Top             =   3480
      Width           =   1215
   End
   Begin VB.Label lblInfo 
      Alignment       =   1  'Right Justify
      Height          =   300
      Index           =   6
      Left            =   240
      TabIndex        =   7
      Top             =   3000
      Width           =   1215
   End
   Begin VB.Label lblInfo 
      Alignment       =   1  'Right Justify
      Height          =   300
      Index           =   5
      Left            =   240
      TabIndex        =   6
      Top             =   2520
      Width           =   1215
   End
   Begin VB.Label lblInfo 
      Alignment       =   1  'Right Justify
      Height          =   300
      Index           =   4
      Left            =   240
      TabIndex        =   5
      Top             =   2040
      Width           =   1215
   End
   Begin VB.Label lblInfo 
      Alignment       =   1  'Right Justify
      Height          =   300
      Index           =   3
      Left            =   240
      TabIndex        =   4
      Top             =   1560
      Width           =   1215
   End
   Begin VB.Label lblInfo 
      Alignment       =   1  'Right Justify
      Height          =   300
      Index           =   2
      Left            =   240
      TabIndex        =   3
      Top             =   1080
      Width           =   1215
   End
   Begin VB.Label lblInfo 
      Alignment       =   1  'Right Justify
      Height          =   300
      Index           =   1
      Left            =   240
      TabIndex        =   2
      Top             =   600
      Width           =   1215
   End
   Begin VB.Label lblInfo 
      Alignment       =   1  'Right Justify
      Height          =   300
      Index           =   0
      Left            =   240
      TabIndex        =   1
      Top             =   120
      Width           =   1215
   End
End
Attribute VB_Name = "Dialog"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit
'Dim hSet As New CAutoSetting

Private Sub cmdOpenInIE_Click()
On Error Resume Next
Dim href As String
href = txtInfo(6).Text
If href = "" Then
    MsgBox "Invaild location.", vbCritical
    Exit Sub
End If

'localfile
If InStr(href, ":") = 2 Then
    href = firstPage(href)
End If
If href = "" Then
    MsgBox "Can't find any pdg file.", vbCritical
Else
    ShellExecute Me.hWnd, "open", href, "", "", 0
End If
End Sub

Private Sub cmdOpenSS_Click()
On Error Resume Next
Dim href As String
href = txtInfo(6).Text
If InStr(href, ":") = 2 Then
    href = firstPage(href)
Else
    href = "book://ss" & txtInfo(5).Text
End If
If href = "" Then
    MsgBox "Invaild location.", vbCritical
    Exit Sub
End If
ShellExecute Me.hWnd, "open", href, "", "", 0

End Sub

Private Sub OKButton_Click()
Me.Hide
End Sub

Private Function firstPage(pdgpath As String) As String
Dim fso As New FileSystemObject
pdgpath = fso.BuildPath(pdgpath, "\")
If Dir(pdgpath + "cov001.pdg") <> "" Then firstPage = fso.BuildPath(pdgpath, "cov001.pdg"): Exit Function
If Dir(pdgpath + "bok001.pdg") <> "" Then firstPage = fso.BuildPath(pdgpath, "bok001.pdg"): Exit Function
If Dir(pdgpath + "fow001.pdg") <> "" Then firstPage = fso.BuildPath(pdgpath, "fow001.pdg"): Exit Function
If Dir(pdgpath + "!00001.pdg") <> "" Then firstPage = fso.BuildPath(pdgpath, "!00001.pdg"): Exit Function
If Dir(pdgpath + "000001.pdg") <> "" Then firstPage = fso.BuildPath(pdgpath, "000001.pdg"): Exit Function

firstPage = Dir(pdgpath + "*.pdg")
If firstPage <> "" Then
    firstPage = fso.BuildPath(pdgpath, firstPage)
Else
    firstPage = ""
End If
End Function

