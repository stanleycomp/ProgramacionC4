Funcion permiso <- evaluacion(ip,puerto,protocolo)
	permiso <- Falso
	
	
	si (puerto=80 o puerto=443) y (protocolo= "tcp" o protocolo="udp")
		permiso<-verdadero
	FinSi
	
	si puerto=21 entonces 
		permiso<- Falso
	FinSi
	
	si protocolo="ppp" Entonces
		permiso<-falso
	FinSi
	
	si puerto=22 Entonces
	permiso<-Verdadero	
FinSi

si Subcadena(ip,1,9)="192.168" y protocolo= "smtp" Entonces
	permiso<- Verdadero
FinSi

FinFuncion

Algoritmo firewall_basico
	definir ip, protocol,protocolo como cadena
	definir puerto,opciones Como Entero
	definir resultado Como Logico
	
	repetir 
		escribir "************Menu de Opciopnes del Firewall********"
		escribir "1. realizar una consulta"
		escribir "2. Salir "
		escribir "-------Seleccione una opcion-------"
		leer opciones
		
		Segun opciones Hacer
			1: 
				escribir "*********Consulta en el firewall*******"
				escribir " introduzca una ip de origen"
				leer ip
				Escribir "Introduzca un puerto"
				leer puerto
				Escribir "Introduzca un protocolo"
				leer protocol
				resultado<- evaluacion(ip,puerto,protocol)
				si resultado Entonces
					escribir "El paquete es ermitido segun las reglas del firewall"
				SiNo
					escribir "El paquete consultado no es permitido por las politicas del firewall"
					
				FinSi
			2:
				escribir "Saliendo del sistema !Gracias por su consulta!"
				
			De Otro Modo:
				escribir " La opcion seleccionada no es valida favor intentar nuevamente"
				escribir ' '
		FinSegun
	Hasta Que opciones =2
	
FinAlgoritmo
