import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_phile/model/Token.dart';
import 'package:movie_phile/model/user_login.dart';
import 'package:movie_phile/utilities/environment.dart';

final _base = Environment.baseUrl;
final _tokenEndpoint = "/auth/login";
final _url = _base + _tokenEndpoint;

Future<Token> getToken(UserLogin userLogin) async {
  print(_url);
  final http.Response response = await http.post(
    Uri.parse(_url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(userLogin.toJson()),
  );
  
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    var objectResponse = Token.fromJson(jsonResponse);
    print(jsonResponse);
    return objectResponse;
  } else {
    print((response.body).toString());
    return null;
    // throw Exception(json.decode(response.body));
  }
}