import 'dart:convert';

import 'package:app_emergencia/src/data/api/ApiConfig.dart';
import 'package:app_emergencia/src/data/dataSource/local/SharePref.dart';
import 'package:app_emergencia/src/data/dataSource/remote/service/AuthService.dart';
import 'package:app_emergencia/src/domain/models/AuthResponse.dart';
import 'package:app_emergencia/src/domain/models/user.dart';
import 'package:app_emergencia/src/domain/repository/AuthRepository.dart';
import 'package:app_emergencia/src/domain/utils/ListToString.dart';
import 'package:app_emergencia/src/domain/utils/Resource.dart';
import 'package:http/http.dart' as http;

class Authrepositoryimpl implements Authrepository {

  Authservice authservice;
  Sharepref sharedPreferences;

  Authrepositoryimpl(this.authservice, this.sharedPreferences);

  @override
  Future<Resource<AuthResponse>> login(String email, String password) {
    return authservice.login(email, password);
  }

  @override
  Future<Resource<AuthResponse>> register(User user) async {
    try {
      Uri url = Uri.http(ApiConfig.API_PROJECT, '/auth/register');
      print(url);
      Map<String, String> headers = {'Content-Type': 'application/json'};
      String body = json.encode(user);
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
  
  @override
  Future<AuthResponse?> getUserSession() async {
    final data = await sharedPreferences.read('user');
    if(data != null){
      AuthResponse authResponse = AuthResponse.fromJson(data);
      return authResponse;
    }
    return null;
  }
  
  @override
  Future<void> saveUserSession(AuthResponse authResponse) async {
    sharedPreferences.save('user', authResponse.toJson());
  }
  
  @override
  Future<bool> logOut() async {
    // TODO: implement logOut
    return await sharedPreferences.remove('user');
  }

  }
    
