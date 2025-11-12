import 'dart:io';

import 'package:app_emergencia/src/data/dataSource/remote/service/UserService.dart';
import 'package:app_emergencia/src/domain/models/user.dart';
import 'package:app_emergencia/src/domain/repository/UserRepository.dart';
import 'package:app_emergencia/src/domain/utils/Resource.dart';

class UserRepositoryImpl extends UserRespository {

UserService userservice;

UserRepositoryImpl(this.userservice);

  
  @override
  Future<Resource<User>> update(int id, User user, File? file) {
  return userservice.update(id, user);
  }

}