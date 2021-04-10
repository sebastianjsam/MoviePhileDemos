import 'package:flutter/material.dart';

class RegistroPage extends StatefulWidget {
  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  String _nombre;
  String _apellido;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro Usuario'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearNombre(),
          Divider(),
          _crearApellido(),
          Divider(),
          //  _crearPersona(),
          RaisedButton(
            child: Text('Registrar'),
            color: Colors.blue,
            textColor: Colors.white,
            shape: StadiumBorder(),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

// Metodo que estructura el campo del nombre de usuario
// return el campo de ingresar en nombre
  Widget _crearNombre() {
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('letras 100'),
          hintText: 'Nombre usuario',
          labelText: 'Nombre',
          helperText: 'Solo nombre',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

// Metodo que estructura el campo del nombre de apellido
// return el campo de ingresar en apellido
  Widget _crearApellido() {
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('letras 100'),
          hintText: 'Apellido usuario',
          labelText: 'Apellido',
          helperText: 'Solo apellido',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),
      onChanged: (valor) {
        setState(() {
          _apellido = valor;
        });
      },
    );
  }

// Metodo que estructura el campo texto que nuestra los campo que se estan escribiendo
// return el campo un texto
  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre' + ' Apellido es $_apellido'),
    );
  }
}
