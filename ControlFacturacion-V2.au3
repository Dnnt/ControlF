#include <MsgBoxConstants.au3>
#include <TrayConstants.au3>

;~ Variables
$version = 0.1
$conteo=0
$mVersion=TrayCreateItem("Version")
$mExit = TrayCreateItem("Salir")
$salir = 1
Opt ("TrayMenuMode",3)

;~ Area de Funciones mas 2
Func F3()
   $codigo=InputBox("Control","Ingrese el codiogo del producto" )
EndFunc

Func menu()
   Switch TrayGetMsg()
	  Case $mVersion
		 MsgBox(0,"","Version: " & $version)
	  Case $mExit
		$salir=0
   EndSwitch
EndFunc


While $salir
menu()
   HotKeySet("{F3}","F3")
   $v1= WinExists("Sin título: Bloc de notas")
   $v2= WinExists("Calculadora")
	  Sleep(5)
	  If $v1 Then
		 $conteo=$conteo+1
		 TrayTip("Error de conteo",$conteo,5)
		 WinWaitClose("Sin título: Bloc de notas")
	  ElseIf $v2 Then
		 $conteo=0
		 WinWaitClose("Calculadora")
	  EndIf
WEnd