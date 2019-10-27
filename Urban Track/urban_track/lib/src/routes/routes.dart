import 'package:flutter/material.dart';
import 'package:urban_track/src/pages/LoginPage.dart';
import 'package:urban_track/src/pages/RegisterPage.dart';

Map<String, WidgetBuilder> getApplicationRoutes(){
      return <String, WidgetBuilder> {
        '/'       : ( BuildContext context ) => LoginPage(),
        'register': ( BuildContext context ) => RegisterPage(),
        //'profile' : ( BuildContext context ) => ProfilePage(),
      };
}