import 'dart:io';

import 'package:app_emergencia/src/domain/models/user.dart';
import 'package:app_emergencia/src/domain/repository/UserRepository.dart';

class UpdateUserUseCase{

  UserRespository userRespository;

  UpdateUserUseCase(
    this.userRespository
  );

  run(int id, User user, File? file) =>userRespository.update(id, user, file);
}