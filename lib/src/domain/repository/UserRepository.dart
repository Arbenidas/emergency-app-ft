import 'dart:io';

import 'package:app_emergencia/src/domain/models/user.dart';
import 'package:app_emergencia/src/domain/utils/Resource.dart';

abstract class UserRespository {

  Future<Resource<User>> update(int id, User user, File? file);


}