# Dhcp
##Actualizamos e instalamos el isc-dhcp-server

![imagen](https://github.com/freddy13513/Dhcp/assets/146179724/d1e9a5b7-719e-4f64-a27c-320578aa6699)

##Entramos en el fichero isc-dhcp_server y modificamos la linea que dice INTERFACESv4=”enp0s3” que es el nombre de la tarjeta de red

![imagen](https://github.com/freddy13513/Dhcp/assets/146179724/3cb1d220-addc-42cc-8eee-25bf0a45855c)

##Reiniciamos el servicio.

![imagen](https://github.com/freddy13513/Dhcp/assets/146179724/e958c60d-c0b1-4edd-b551-68bbc791081f)

##Con ip a vemos las tarjetas y las redes que disponemos

![imagen](https://github.com/freddy13513/Dhcp/assets/146179724/1845adad-2baf-4a8e-88ba-c6b827bcf3ef)

##En el fichero dhcp.conf  como la linea comentada para definir un rango

![imagen](https://github.com/freddy13513/Dhcp/assets/146179724/e333592e-2041-46da-841f-3e576678d940)

#Y lo pegamos al final configurando los valores necesarios.
teniendo en cuenta el rango que vamos a dar, los dns

![imagen](https://github.com/freddy13513/Dhcp/assets/146179724/31b66e07-9a46-4962-ba22-11b59f184c1b)

#volvemos a reiniciar el servicio

![imagen](https://github.com/freddy13513/Dhcp/assets/146179724/bd3b41f7-c391-45ed-94ab-ce67d6884407)

#este fichero es importante tenerlo en cuenta 

![imagen](https://github.com/freddy13513/Dhcp/assets/146179724/afeacee7-d230-4ef8-a8de-9df5529f26e8)

##Con los comandos
systemctl stop NetworkManager paramos el servicio 
systemctl status NetwwokManager comprobamos el estado 
systemctl disable NetwwokManager lo eliminamos

![imagen](https://github.com/freddy13513/Dhcp/assets/146179724/20873b02-555d-4529-97ad-d1b9fd3fe472)

##Editamos el fichero  network/interfaces en la cual tenemos las dos tarjetas de red con sus ip red mascara y puerta de salida. 

![imagen](https://github.com/freddy13513/Dhcp/assets/146179724/ec94927e-8afc-45f1-a89f-9fad5bba000d)

##Reiniciamos el servicio.

![imagen](https://github.com/freddy13513/Dhcp/assets/146179724/42ec9a8b-561d-4ae2-922e-730fb7689281)

##Aquí podemos comparar qué puedo hacer ping entre el cliente y servidor
![imagen](https://github.com/freddy13513/Dhcp/assets/146179724/48c1ff65-9878-46f1-b3f1-ab87158b4626)

##Aquí vemos que tenemos salida a internet desde el cliente 
![imagen](https://github.com/freddy13513/Dhcp/assets/146179724/5d692d3d-3f38-4390-9ffd-c33a67dac133)

##Con este comando quitamos la ip
![imagen](https://github.com/freddy13513/Dhcp/assets/146179724/82c0019b-634c-404b-82ee-2a3e3730dda4)

##Y con este la renovamos
![imagen](https://github.com/freddy13513/Dhcp/assets/146179724/8f9d3dc3-cfb0-41fb-aecf-b94b3691f86e)

##Para tener salida a internet desde el clientes tenemos que crear las reglas ip table creamos este script y lo ejecutamos
![imagen](https://github.com/freddy13513/Dhcp/assets/146179724/672a5c89-7d82-43a7-af60-6c2d9a300b62)

ejecutamos el script
![imagen](https://github.com/freddy13513/Dhcp/assets/146179724/2d816fbf-cf97-48de-b6e2-cabf9f9a68f7)

reiniciamos el servicio
![imagen](https://github.com/freddy13513/Dhcp/assets/146179724/77ba9de9-a285-48b6-bad5-89b17149f9c0)

seguramente al apagar el servidor y volver a encender ya no tengamos internet en el cliente para eso revisamos con este comando si el resultado es 0 tenemos que lanzar de nuevo el script  y que el resultado sea 1
![imagen](https://github.com/freddy13513/Dhcp/assets/146179724/14bf4416-5446-4a8b-8789-780f6144d493)

Aquí nos devuelve 1
![imagen](https://github.com/freddy13513/Dhcp/assets/146179724/26101b68-8582-4630-944c-ee2c50af0d94)

ejecutamos de nuevo el script y con el comando iptables -L -n vemos que está funcionando con más detalle
![imagen](https://github.com/freddy13513/Dhcp/assets/146179724/8321da42-ce96-4d98-a0ac-d66992aa9c12)

##Failover
En el fichero etc/dhcp/dhcpd.conf  editamos ya añadimos lo que se muestra en pantalla que es primario la dirección ip la ip del servidor secundario  y en el bloque de abajo la red la mascara la puerta de enlace y los dns.
![imagen](https://github.com/freddy13513/Dhcp/assets/146179724/ab342743-f9bf-441f-b658-1da5fccf6e3a)

Reiniciamos el servicio. 

![imagen](https://github.com/freddy13513/Dhcp/assets/146179724/9794085b-29cd-4d2e-99c8-13c839cc3ce3)

Configuramos la ip estática en el servidor de respaldo. (red interna) la otra tarjeta de red la cometamos para evitar que falle 
![imagen](https://github.com/freddy13513/Dhcp/assets/146179724/937b0aba-c29b-4882-9104-0c2e7e3abf1f)

Reiniciamos el servicio.
![imagen](https://github.com/freddy13513/Dhcp/assets/146179724/dbce8af1-6235-4827-86d6-93037037c466)

En el servidor de respaldo configuramos lo mismo teniendo en cuenta que debemos invertir las ip y cambiar primary por secondary. 
![imagen](https://github.com/freddy13513/Dhcp/assets/146179724/1331cf04-3370-4e53-a9e3-7ee53bd5d291)

Reiniciamos el servicio en esta máquina también.
![imagen](https://github.com/freddy13513/Dhcp/assets/146179724/1ac4fb1a-e82d-4e9a-8c39-489d88b9e05a)

Vemos que hacen ping.
![imagen](https://github.com/freddy13513/Dhcp/assets/146179724/6cc9fb48-97b2-4375-b163-0e7f169300f7)

Con este comando vamos viendo los cambios que ocurren al apagar o encender algunos de los otros equipos journelctl -f
![imagen](https://github.com/freddy13513/Dhcp/assets/146179724/2fb8a10a-986c-4c7d-88b7-5a994d2117da)







