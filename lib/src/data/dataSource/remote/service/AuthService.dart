import 'dart:convert';
import 'package:app_emergencia/src/data/api/ApiConfig.dart';
import 'package:app_emergencia/src/domain/models/AuthResponse.dart';
import 'package:app_emergencia/src/domain/utils/ListToString.dart';
import 'package:app_emergencia/src/domain/utils/Resource.dart';
import 'package:http/http.dart' as http;

class Authservice {
  Future<Resource<AuthResponse>> login(String email, String password) async {
    try {
      Uri url = Uri.http(ApiConfig.API_PROJECT, '/auth/login');
      print(url);
      Map<String, String> headers = {'Content-Type': 'application/json'};
      String body = json.encode({'email': email, 'password': password});
      final response = await http.post(url, headers: headers, body: body);
      // ...
      final data = json.decode(response.body);

      // Solo considera el 200 como éxito
      if (response.statusCode == 200) { 
        AuthResponse authResponse = AuthResponse.fromJson(data);
        print('token ${authResponse.token}');
        print('Data remote ${authResponse.toJson()}');
        return Success(authResponse);
      } 
      // Todos los demás códigos (incluyendo 401) son errores
      else {
        // Manejamos el mensaje de error de forma segura
        final message = listToString(data['message']);
        return ErrorData(message);
            }
// ...
      
    } catch (e) {
      print('error: $e');
      return ErrorData(e.toString());
    }
  }
}
