import 'package:app_emergencia/src/domain/models/AuthResponse.dart';
import 'package:app_emergencia/src/domain/utils/Resource.dart';

abstract class Authrepository {

  Future<Resource<AuthResponse>> login(String email,String password);

}