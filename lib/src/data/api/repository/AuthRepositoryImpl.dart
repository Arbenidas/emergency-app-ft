import 'package:app_emergencia/src/data/dataSource/remote/service/AuthService.dart';
import 'package:app_emergencia/src/domain/models/AuthResponse.dart';
import 'package:app_emergencia/src/domain/repository/AuthRepository.dart';
import 'package:app_emergencia/src/domain/utils/Resource.dart';

class Authrepositoryimpl implements Authrepository {

  Authservice authservice;

  Authrepositoryimpl(this.authservice);

  @override
  Future<Resource<AuthResponse>> login(String email, String password) {
    return authservice.login(email, password);
  }
    
}