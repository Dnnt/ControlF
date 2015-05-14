;~ Control de Facturacion en AutoIt
;~ Autor : Daniel Andres Vargas


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

Func K6()
   Send("+{F6}")
;~    Sleep(5)
   ControlSend("DMS Nuevo M�dulo Comercial","Seguro de comenzar un nuevo documento ignorando el actual?","[CLASS:Button; INSTANCE:1]","")
   Send("{ENTER}")
EndFunc

Func menu()
   Switch TrayGetMsg()
	  Case $mVersion
		 MsgBox(0,"","Version: " & $version,2)
	  Case $mExit
		 $contrasena =InputBox("Contrase�a","Ingrese la contrase�a de Usuario Autorizado","","*",-1,-1,512,382,3)
		 If $contrasena=123 Then
			$salir=0
			MsgBox(0,"","Cerrando Control de Facturaci�n",2)
		 Else
			MsgBox(0,"Error de Contrase�a","Verifique Contrase�a" & @CRLF & @CRLF & "Si no es un usuario autorizado no tiene permitida esta opci�n" ,2)
	     EndIf
   EndSwitch
EndFunc


While $salir
menu()
   HotKeySet("{F3}","F3")
   $v1= WinExists("DMS Nuevo M�dulo Comercial","Cantidad errada")
   $v2= WinExists("Buscar Pedidos","N�mero de Pedido")
	  Sleep(5)
	  If $v1 Then
		 $conteo=$conteo+1
		 TrayTip("Error de conteo",$conteo,5)
		 WinWaitClose("DMS Nuevo M�dulo Comercial","Cantidad errada")
		 WinActivate("Control de Empaque","Cantidad Empacada?")
		 WinClose("Control de Empaque","Cantidad Empacada?")
		 WinActivate("1 1304 / fic08 / ")
		 K6()
	  ElseIf $v2 Then
		 $conteo=0
		 WinWaitClose("Buscar Pedidos","N�mero de Pedido")

	  EndIf
WEnd