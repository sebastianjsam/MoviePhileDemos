import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/film.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<List<Film>> _listadoFilms;
  String url =
      'https://api.themoviedb.org/3/movie/popular?api_key=f4437e47450c87b7f29110a3813f07d5&language=en-US&page=1';

  /**
   * Método que obtiene los datos de las películas y series alojados en el API
   * de la plataforma TMDB 
   */
  Future<List<Film>> _getFilms() async {
    final response = await http.get(Uri.parse(url));
    List<Film> films = [];
    String path_img = 'https://image.tmdb.org/t/p/w500';
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);
      addFilm(jsonData, films, path_img);
      return films;
    } else {
      throw Exception("Falló la conexion");
    }
  }

  /**
   * Método encargado de ingresar en una lista de tipo films las peliculas y series obtenidas desde la API
   * para que puedan ser vistas por el usuario desde la interfaz gráfica del dispositivo
   */
  void addFilm(jsonData, List<Film> films, String path_img) {
    for (var item in jsonData["results"]) {
      films.add(Film(item["id"], item["original_title"],
          '$path_img' '${item["poster_path"]}', item["overview"]));
    }
  }

  @override
  void initState() {
    super.initState();
    _listadoFilms = _getFilms();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaterialApp',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Popular movies'),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        body: FutureBuilder(
          future: _listadoFilms,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.count(
                crossAxisCount: 1,
                children: _listFilms(snapshot.data),
              );
            } else if (snapshot.hasError) {
              return Text("error");
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  List<Widget> _listFilms(List<Film> data) {
    List<Widget> films = [];
    for (var film in data) {
      films.add(Card(
          child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                film.nameFilm,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.red),
                textAlign: TextAlign.center,
              )),
          Expanded(child: Image.network(film.urlImage, fit: BoxFit.fill)),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(film.descriptionFilm,
                style: TextStyle(color: Colors.grey.withOpacity(0.6)),
                textAlign: TextAlign.center),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton(
                child: Text("Details"),
                splashColor: Colors.amber,
                color: Colors.redAccent,
                onPressed: () {},
              ),
            ],
          )
        ],
      )));
    }
    return films;
  }
}
