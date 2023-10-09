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





