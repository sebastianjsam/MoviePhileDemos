import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to MoviePhile',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to MoviePhile'),
        ),
        body: Center(
          child: Text('Bienvenido a MoviePhile'),
        ),
      ),
    );
  }
}