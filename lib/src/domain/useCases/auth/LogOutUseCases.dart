import 'package:app_emergencia/src/domain/repository/AuthRepository.dart';

class LogOutUseCases {
  

Authrepository authrepository;

LogOutUseCases({required this.authrepository});


run()=> authrepository.logOut();

}