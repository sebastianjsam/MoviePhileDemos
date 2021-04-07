import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MoviePhile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'MoviePhile'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var url = Uri.parse("https://api.thecatapi.com/v1/categories");
  String textoMostrar = "Datos ***";
  void _registrar() async {
    final respuesta = await http.get(url);

    if (respuesta.statusCode == 200) {
      textoMostrar = jsonDecode(respuesta.body).toString();
    } else {
      textoMostrar = "Error con la respuesta";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                  decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nombres',
              )),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                  decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'apellidos',
              )),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                  decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nick',
              )),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                  decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Correo',
              )),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                  decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'contraseña',
              )),
            ),
            Text(textoMostrar),
            ElevatedButton(
              onPressed: () {
                _registrar();
                setState(() {
                  textoMostrar = textoMostrar;
                });
              },
              child: Text('Registrar'),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
