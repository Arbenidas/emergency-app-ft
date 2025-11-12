import 'dart:convert';
import 'package:app_emergencia/src/domain/utils/ListToString.dart';
import 'package:http/http.dart' as http;
import 'package:app_emergencia/src/data/api/ApiConfig.dart';
import 'package:app_emergencia/src/domain/models/user.dart';
import 'package:app_emergencia/src/domain/utils/Resource.dart';

class UserService {

  Future<String> token;

  UserService (this.token);

Future<Resource<User>> update(int id,User user) async{
  try {   

    Uri url =Uri.http(ApiConfig.API_PROJECT,'/users/$id');
    Map<String, String> headers={
      'Content-Type': 'application/json',
      'Authorization': await token
    };

    String body = jsonEncode({
          'name': user.name,
          'lastname':user.lastname,
          'phone': user.phone
    });

    final response = await  http.put(url,headers: headers, body: body);
    final data = json.decode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      User  UserResponse = User.fromJson(data);
      return Success(UserResponse);
    }else{
      return ErrorData(listToString(data['message']));
    }
    
  } catch (e) {
    print('Error: $e');
    return ErrorData(e.toString());
  }
}

}