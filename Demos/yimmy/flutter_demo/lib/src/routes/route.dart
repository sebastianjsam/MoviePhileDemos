import 'package:flutter/material.dart';
import 'package:flutter_demo/src/pages/Login_page.dart';
import 'package:flutter_demo/src/pages/Registro_page.dart';
import 'package:flutter_demo/src/pages/alert_page.dart';
import 'package:flutter_demo/src/pages/avatar_page.dart';
import 'package:flutter_demo/src/pages/card_page.dart';
import 'package:flutter_demo/src/pages/home_page.dart';

Map<String, WidgetBuilder> getObtenerRutas() {
  return <String, WidgetBuilder>{
    //Rutas a las cuales estan creadas y que podemos acceder
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
    'inputs': (BuildContext context) => RegistroPage(),
    'login': (BuildContext context) => LoginPage(),
  };
}
