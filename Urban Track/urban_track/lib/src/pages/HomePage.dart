import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.transparent,
      //backgroundImage: ,
      appBar: AppBar(
        title: Text("Inicio"),
      ),
      drawer: _crearMenu(),
      body: ListView(
        // Center(
        //   child: new Image.asset(
        //       'assets/images.jpg',
        //       fit: BoxFit.fill,
        //     ),
        // ),
        //Cambiar de ser necesario los ajustes
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
          ),
          _cardTipo2(),
          SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
          ),
          _cardTipo3(),
          SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
          ),
          _cardTipo4(),
          
        ],
      ),
    );
  }

  //Información
  Widget _cardTipo1() {
     return Card(
       elevation: 10.0,
       shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0) ),
       child: Column(
         children: <Widget>[
           ListTile(
             title: Text("¿Qué es Urban Rracker?",
                style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(45),
                    fontFamily: "Poppins-Bold",
                    letterSpacing: .6)),
             subtitle: Text("Urban tracker es una aplicación de rastreo en tiempo real, en colaboración con Aruba, Urban tracker es capaz de hacer seguimiento de un objeto, animal o incluso una persona, proporcionando únicamente el identificador único del dispositivo.",
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: ScreenUtil.getInstance().setSp(26)),
                    textAlign: TextAlign.justify,
              ),
           ),
         ],
       ),
     );
  }
  Widget _cardTipo2() {
     return Card(
       elevation: 10.0,
       shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0) ),
       child: Column(
         children: <Widget>[
           ListTile(
              title: Text("¿Cómo usar Urban Tracker?",
                style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(45),
                    fontFamily: "Poppins-Bold",
                    letterSpacing: .6)
              ),
              subtitle: Text("Por el momento contamos con dos características completamente gratuitas en nuestra beta del sistema.",
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: ScreenUtil.getInstance().setSp(26)),
                textAlign: TextAlign.justify,
              ),
           ),
         ],
       ),
     );
  }

  Widget _cardTipo3() {
     return Card(
       elevation: 10.0,
       shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0) ),
       child: Column(
         children: <Widget>[
           ListTile(
              title: Text("¿Cómo usar Urban Tracker?",
                style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(45),
                    fontFamily: "Poppins-Bold",
                    letterSpacing: .6)
              ),
              subtitle: Text("""Por el momento contamos con dos características completamente gratuitas en nuestra beta del sistema.
1.- Localización en tiempo real, gracias a esta funcionalidad, el usuario puede moitorear en tiempo real la ubicación del dispositivo, con lo cual puede ver hacia dónde se dirige, el traslado y el tiempo que le está tomando llegar a él.
2.- Resumen de localización semanal, nosotros sabemos que no todo el tiempo necesitas saber dónde está tu emisor, pero si quieres tener una idea de dónde es que estuvo la mayoría del tiempo, para ello generamos esta funcionalidad, con ella podrás tener un resumen con los lugares más concurridos.              
              """,
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: ScreenUtil.getInstance().setSp(26)),
                textAlign: TextAlign.justify,
              ),
              
           ),
         ],
       ),
     );
  }

  Widget _cardTipo4() {
     return Card(
       elevation: 10.0,
       shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0) ),
       child: Column(
         children: <Widget>[
           ListTile(
              title: Text("¿Urban tracker es para mi?",
                style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(45),
                    fontFamily: "Poppins-Bold",
                    letterSpacing: .6)
              ),
              subtitle: Text("""Existen muchas aplicaciones para urban tracker, tal vez alguna de ellas sea aplicable contigo, aquí te dejamos algunas de las más utilizadas por nuestros usuarios actuales.

Seguimiento de autos ¿Eres dueño de un taxi y quieres sacarle el máximo provecho? Urban tracker es para ti, gracias al seguimiento diario, podemos hacer un historial del camino recorrido del auto, de esta manera, podrás saber si se está ocupando el tiempo eficientemente o se necesitan realizar algunos ajustes en la forma de trabajo.
              
Localización de personas vulnerables Muchas veces los adultos mayores necesitan atención especial al salir, sin embargo necesitan sentirse independientes, con Urban tracker puedes encontrar el equilibrio, al ser compacto, la persona olvidara que tiene este dispositivo, pero tu podras saber donde está a solo 6 clicks de distancia.              
              """,
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: ScreenUtil.getInstance().setSp(26)),
                textAlign: TextAlign.justify,
              ),
           ),
         ],
       ),
     );
  }

  Drawer _crearMenu() {

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Usuario',
              style: TextStyle(
                fontSize: ScreenUtil.getInstance().setSp(45),
                fontFamily: "Poppins-Bold",
                letterSpacing: .6,
                color     : Colors.black
              )
            ),
            accountEmail: Text('example@mail.com',
              style: TextStyle(
                fontFamily: "Poppins-Medium",
                fontSize  : ScreenUtil.getInstance().setSp(30),
                color     : Colors.black
                )
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text('U',
                style: TextStyle(
                fontSize: ScreenUtil.getInstance().setSp(70),
                fontFamily: "Poppins-Bold",
                letterSpacing: .6,
                color: Colors.white
                )
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image_02.png')
              )
            ),
          ),
          // DrawerHeader(
          //   child: Container(),
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage('assets/image_02.png'),
          //     ),
          //   ),
          // ),
          ListTile(
            leading: Icon(Icons.person, color: Colors.blue,),
            title: Text('Perfil',
              style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(35),
                    fontFamily: "Poppins-Medium",
                    letterSpacing: .6)
            ),
            
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.devices_other , color: Colors.blue,),
            title: Text('Administrar dispositivos',
              style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(35),
                    fontFamily: "Poppins-Medium",
                    letterSpacing: .6)
            
            ),
            onTap: (){},
          ),
        ],
      ),
    );

  }
  

}