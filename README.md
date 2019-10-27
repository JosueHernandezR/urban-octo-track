# urban-octo-track
MXHACKS

**¿Qué es Urban tracker?**
  
  Urban tracker es una aplicación de rastreo en tiempo real, en colaboración con Aruba, Urban tracker es capaz de hacer seguimiento de un objeto, animal o incluso una persona, proporcionando únicamente el identificador único del dispositivo.

**¿Cómo usar Urban tracker?**
  
  Por el momento contamos con dos características completamente gratuitas en nuestra beta del sistema.
  1. Localización en tiempo real, gracias a esta funcionalidad, el usuario puede moitorear en tiempo real la ubicación del dispositivo, con lo cual puede ver hacia dónde se dirige, el traslado y el tiempo que le está tomando llegar a él.
  2. Resumen de localización semanal, nosotros sabemos que no todo el tiempo necesitas saber dónde está tu emisor, pero si quieres tener una idea de dónde es que estuvo la mayoría del tiempo, para ello generamos esta funcionalidad, con ella podrás tener un resumen con los lugares más concurridos.
Y asi podriamos continuar durante un largo rato, las posibilidades son infinitas!

**¿Urban tracker es para mi?**
  
  Existen muchas aplicaciones para urban tracker, tal vez alguna de ellas sea aplicable contigo, aquí te dejamos algunas de las más utilizadas por nuestros usuarios actuales
    -- Seguimiento de autos ¿Eres dueño de un taxi y quieres sacarle el máximo provecho? Urban tracker es para ti, gracias al seguimiento diario, podemos hacer un historial del camino recorrido del auto, de esta manera, podrás saber si se está ocupando el tiempo eficientemente o se necesitan realizar algunos ajustes en la forma de trabajo.
    -- Localización de personas vulnerables Muchas veces los adultos mayores necesitan atención especial al salir, sin embargo necesitan sentirse independientes, con Urban tracker puedes encontrar el equilibrio, al ser compacto, la persona olvidara que tiene este dispositivo, pero tu podras saber donde está a solo 6 clicks de distancia.
Tecnologías utilizadas

El core de nuestro proyecto fue creado gracias a la API de Aruba, con ella, podemos realizar una consulta que no regresa el router al que está conectado nuestro emisor, y a partir de él, obtener la longitud y latitud del dispositivo, gracias a la API de google maps developer, podemos mostrar gráficamente estas coordenadas y hacer que el usuario final, entienda de mejor forma los datos recabados por nuestra aplicación, en el desarrollo web utilizamos Flask, con el cual realizamos todas las interacciones  con la base de datos y unificamos las diferentes API’s que utilizamos, generando un servicio que estara corriendo todo el tiempo del lado del servidor, para el desarrollo móvil utilizamos flutter y nos inspiramos en material design para el patron de nuestros diseños.

**Donde puedo utilizar Urban Tracker**
  
  Por el momento solo tenemos cobertura en las alcaldías Coyoacan, Tlalpan, Alvaro Obregón y Cuauhtémoc de la CDMX, pero estamos trabajando para ampliar nuestra cobertura a más delegaciones y posteriormente a más estados.

**Cornograma de actividades Hackaton UNAM 2019**
  
Primera fase
  Iniciar sesión
    Datos requeridos: correo electrónico, contraseña
  Cerrar sesión
  Registrarse
    Datos requeridos: correo electrónico, contraseña, nombre, apellidos, fecha de nacimiento, código postal.
Segunda fase
  Trackeo de un dispositivo
Tercera fase
  Agregar dispositivo
    Datos requeridos: Nombre, tipo (persona, animal, objeto), direccion MAC, tiempo de actualización
  Historial de puntos trackeados
  Todos los puntos trackeados de un dispositivo en un lapso determinado
  Zonas concurridas de un dispositivo trackeado
Cuarta fase
  Trackeo en tiempo real
  
**Descripcion de las carpetas**

appFlask - Alberga nuestra pagina web, en ella se encuentran nuestras vistas, modelos y todo lo relacionado a nuestra pagina web en lenguaje Python.

Urban Track/urban_track - Alberga nuestra app movil, en ella esta el codigo fuente en lenguaje Dart.

ServiceMaps - Alberga el servicio de trackeo en tiempo real.

