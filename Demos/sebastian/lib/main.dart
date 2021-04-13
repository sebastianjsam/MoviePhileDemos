import 'package:flutter/material.dart';
import 'package:moviephile/Models/ValidateDatos.dart';
import 'package:moviephile/services/ConectApi.dart';
import 'package:moviephile/utils/RoutesAPP.dart';
import 'package:moviephile/utils/TextApp.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(
              title: 'MoviePhile',
              key: key,
            ),
        '/Login': (context) => secondPage(),
      },
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
  final _nombre = TextEditingController(text: 'sebas');
  final _apellidos = TextEditingController(text: 'seb');
  final _nick = TextEditingController(text: 'seb');
  final _correo = TextEditingController(text: '1prueba@gmail.com');
  final _contrasena = TextEditingController(text: 'Aa124567_');

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
              child: Image(image: AssetImage(RoutesAPP.IMG_PERFIL_REGISTRAR)),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: _nombre,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: TextApp.NAME_TEXT,
                  errorText:
                      ValidateDatos.isNameInvalid ? TextApp.INVALID_Name : null,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                  controller: _apellidos,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: TextApp.LASTNAME_TEXT,
                    errorText: ValidateDatos.isLastNameInvalid
                        ? TextApp.INVALID_LAST_NAME
                        : null,
                  )),
            ),

            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                  controller: _correo,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: TextApp.EMAIL_TEXT,
                    errorText: ValidateDatos.isEmailInvalid
                        ? TextApp.INVALID_EMAIL
                        : null,
                  )),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                  controller: _contrasena,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: TextApp.PASSWORD_TEXT,
                    errorText: ValidateDatos.ispassWordInvalid
                        ? TextApp.INVALID_PASSWORD
                        : null,
                  )),
            ),
            //Text(textoMostrar),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  ValidateDatos.isNameInvalid =
                      ValidateDatos.validateName(_nombre.text);
                  ValidateDatos.isLastNameInvalid =
                      ValidateDatos.validateLastName(_apellidos.text);
                  ValidateDatos.isEmailInvalid =
                      ValidateDatos.validatemail(_correo.text);

                  ValidateDatos.ispassWordInvalid =
                      ValidateDatos.validatepass(_contrasena.text);
                });

                //_registrar();
                if (ValidateDatos.Datevalided()) {
                  final Map<String, dynamic> resgistroUSer =
                      await ConnectionApi.RegisterUser(
                    _nombre.text,
                    _nick.text,
                    _correo.text,
                    _contrasena.text,
                  );
                  setState(() {
                    ConnectionApi.Errores(resgistroUSer['errors'].toString());
                  });

                  if (resgistroUSer['errors'].toString() == 'null') {
                    Navigator.pushNamed(context, '/Login');
                  }
                }
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

class secondPage extends StatelessWidget {
  @override
  Widget build(Object context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Text(
                'Registro Exitoso',
                style: TextStyle(fontSize: 40),
              ),
              RaisedButton(
                child: Text('Ir page 1'),
                onPressed: () {
                  Navigator.pop(
                    context,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
