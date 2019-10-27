import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 15.0),
                blurRadius: 15.0),
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, -10.0),
                blurRadius: 10.0),
          ]),
      child: Padding(
        
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("¿Qué es Urban Rracker?",
                style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(45),
                    fontFamily: "Poppins-Bold",
                    letterSpacing: .6)),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),
            Text("Urban tracker es una aplicación de rastreo en tiempo real, en colaboración con Aruba, Urban tracker es capaz de hacer seguimiento de un objeto, animal o incluso una persona, proporcionando únicamente el identificador único del dispositivo.",
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: ScreenUtil.getInstance().setSp(26))),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),
            Text("¿Cómo usar Urban Tracker?",
                style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(45),
                    fontFamily: "Poppins-Bold",
                    letterSpacing: .6)
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),
            Text("Por el momento contamos con dos características completamente gratuitas en nuestra beta del sistema.",
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: ScreenUtil.getInstance().setSp(26))
            ),
            Text("1.- Localización en tiempo real, gracias a esta funcionalidad, el usuario puede moitorear en tiempo real la ubicación del dispositivo, con lo cual puede ver hacia dónde se dirige, el traslado y el tiempo que le está tomando llegar a él.",
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: ScreenUtil.getInstance().setSp(26))
            ),
            Text("2.- Resumen de localización semanal, nosotros sabemos que no todo el tiempo necesitas saber dónde está tu emisor, pero si quieres tener una idea de dónde es que estuvo la mayoría del tiempo, para ello generamos esta funcionalidad, con ella podrás tener un resumen con los lugares más concurridos.",
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: ScreenUtil.getInstance().setSp(26))
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),
            Text("¿Urban tracker es para mi?",
                style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(45),
                    fontFamily: "Poppins-Bold",
                    letterSpacing: .6)
            ),
            Text("""Existen muchas aplicaciones para urban tracker, tal vez alguna de ellas sea aplicable contigo, aquí te dejamos algunas de las más utilizadas por nuestros usuarios actuales.
            
            
            """,
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: ScreenUtil.getInstance().setSp(26))
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),
          ],
        ),
      ),
    );
  }
}