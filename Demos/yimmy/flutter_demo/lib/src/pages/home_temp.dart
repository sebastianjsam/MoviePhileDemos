import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final texto = ['Huila', 'Caldas', 'Valle'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Software III'),
      ),
      body: ListView(children: _leerCadenaCorta()),
    );
  }

  /* List<Widget> _leerCadena() {
    List<Widget> lista = new List<Widget>();
    for (var item in texto) {
      final temp = ListTile(
        title: Text(item),
      );
      lista..add(temp)..add(Divider());
    }
    return lista;
  }
*/
  //Metodo mas corto de recorrer una lista
  //
  List<Widget> _leerCadenaCorta() {
    return texto.map((item) {
      return Column(
        children: [
          ListTile(
            title: Text(item + '!'),
            leading: Icon(Icons.account_balance_wallet),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider()
        ],
      );
    }).toList();
  }
}
