import 'dart:io';
import 'package:flutter/material.dart';
import 'package:movie_phile/ui/screens/login_screen.dart';
import 'package:movie_phile/ui/screens/welcome.dart';

void main(){
  HttpOverrides.global = new MyHttpOverrides();
  runApp(new MyApp());
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',

      routes: {
        '/': (context) => LoginScreen(),
        '/welcome': (context) => WelcomePage()
      },
    );
  }
}