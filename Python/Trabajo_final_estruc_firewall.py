
#Vector que guardaraa una lista de ips bloqueadas
lista_bloqueos = ["10.0.0.5", "10.0.0.10","10.0.0.15","10.0.0.20","10.0.0.25"]

# Matriz que guardara nuestros registros de paquetes con su ip, puerto, protocolo y estado.
registros = []

# Función que nos sirve para guardar cada registro de paquetes
def RegistroPaquete():
    ip = input("Introduzca la IP de origen: ")
    puerto = input("Introduzca el puerto: ")
    protocolo = input("introduzca el protocolo (TCP/UDP/SSH/SMTP/HTTP): ")

    # validamos si la ip que registramos se encuentra en la lista de bloqueo
    if ip in lista_bloqueos:
        estado = "BLOQUEADO POR LAS REGLAS DEL FIREWALL"
    else:
        estado = "PERMITIDO"

    # agrega o guarda cada registro en nuestra matriz
    registros.append([ip, puerto, protocolo, estado])

    print(f"Paquete de {ip}:{puerto}/{protocolo} -> {estado}")

# Función para mostrar los registros guardados en nuestra mmatriz
def MostrarRegistros():
    print("\n=== REGISTROS DE PAQUETES ===")
    for reg in registros:
        print(f"IP: {reg[0]} | Puerto: {reg[1]} | Protocolo: {reg[2]} | Estado: {reg[3]}")

# Función que genera las alertas de las ips que se encuentran bloqueadas
def GenerarAlertas():
    print("\n******* ALERTAS DE IPS BLOQUEADAS *******")
    for reg in registros:
        if reg[3] == "BLOQUEADO POR LAS REGLAS DEL FIREWALL":
            print(f"ALERTA: se ha intentado el acceso desde {reg[0]} en puerto {reg[1]} ({reg[2]})")

# menu principal que se ejecutara al correr el firewall donde tenemos todas las funciones del mismo
def main():
    while True:
        print("\n******* MENU PRINCIPAL DEL FIREWALL *******")
        print("\n@@@@@@@ Elija una de las siguientes opciones @@@@@@@")
        print("1. Registrar paquete")
        print("2. Mostrar registros")
        print("3. Generar alertas")
        print("4. Salir")

        opcion = input("Seleccione una opción: ")

        if opcion == "1":
            RegistroPaquete()
        elif opcion == "2":
            MostrarRegistros()
        elif opcion == "3":
            GenerarAlertas()
        elif opcion == "4":
            print("....... Saliendo, gracias por el firewall .......")
            break
        else:
            print("Opción no disponible, intente nuevamente.")

# llamamos a ejecucion el menu principal al correr el programa
if __name__ == "__main__":
    main()
