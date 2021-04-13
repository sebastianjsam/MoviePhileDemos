import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart' as https;
import 'package:moviephile/Models/ValidateDatos.dart';
import 'package:moviephile/utils/TextApp.dart';

class ConnectionApi {
  static String url = TextApp.CONNECTION_API_URL;
  //
  static Future<Map<String, dynamic>> RegisterUser(
      String nameApellido, String nick, String email, String password) async {
    var response = null;
    try {
      response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            {'Name': nameApellido, 'Email': email, 'Password': password}),
      );
    } catch (e) {
      print("Error: Post");
    }
    Map<String, dynamic> user = jsonDecode(response.body);
    if (response.statusCode == 200) {
      user = jsonDecode(response.body);
      return user;
    } else {
      user = jsonDecode(response.body);
      return user;
    }
  }

  static void Errores(var Errores) {
    var ErroresSeparados = Errores.split(',');
    String erroresPasword = "";
    String erroresEmail = "";
    for (var Es in ErroresSeparados) {
      if (Es.contains('Passwords')) {
        erroresPasword += Es + '\n';
      } else {
        erroresEmail += Es + '\n';
      }
    }
    if (erroresEmail != "") {
      TextApp.INVALID_EMAIL = erroresEmail;
      ValidateDatos.isEmailInvalid = true;
    }
    if (erroresPasword != "") {
      TextApp.INVALID_PASSWORD = erroresPasword;
      ValidateDatos.ispassWordInvalid = true;
    }
  }
}
