import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

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

  Future<String> RegisterUser(
      String name, String email, String password) async {
    print("registrar");
    print(jsonEncode(
        {'Name': name, 'Email': 'prueba5@gmail.com', 'Password': 'Aa124567_'}));
    final response = await http.post(
      Uri.parse('http://10.0.2.2:53865/api/Auth/Register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'Name': 'Batman1',
        'Email': 'prueba1gmail.com',
        'Password': 'Aa124567_'
      }),
    );
    Map<String, dynamic> user = jsonDecode(response.body);
    print("****" + user.toString());
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      //return Album.fromJson(jsonDecode(response.body));
      print("xd");
      print((response.body).toString());
      var json = jsonDecode(response.body);

      Map<String, dynamic> user = jsonDecode(response.body);
      print(user);
      print(user['errors']);
      print("result " + user['result'].toString());

      print("JsonDecode " + (jsonDecode(response.body)).toString());
      setState(() {
        if (user['result'] == false) {
          textoMostrar = (user['errors']).toString();
        } else {
          textoMostrar = 'Registro Exitoso';
        }
      });

      return (user['errors']).toString();
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      //throw Exception('Failed');
      //return "Failed ";

      print("Failed" + response.statusCode.toString());
      Map<String, dynamic> user = jsonDecode(response.body);
      print(user);
      print(user['errors']);

      setState(() {
        textoMostrar = 'Error' + user['errors'].toString();
      });
      return "Failed ";
    }
  }

  Future<http.Response> registrarseBackend() {
    return http.post(
      Uri.https('https://192.168.0.19:44307/api/Auth/', 'Register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "Name": "Batman1",
        "Email": "prueba1@gmail.com",
        "Password": "Aa124567_"
      }),
    );
  }

  final myController = TextEditingController();
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
              height: 100,
              width: 100,
              child: Image(
                  image: AssetImage(
                'assets/images/avatar.png',
              )),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                  controller: myController,
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
                //_registrar();
                var r = RegisterUser(myController.text, 'seas', 'as');
                setState(() {
                  //String futuro =
                  //(RegisterUser('sebas', 'seas', 'as')).toString();

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
