import 'package:app_emergencia/src/domain/models/AuthResponse.dart';
import 'package:app_emergencia/src/presentation/utils/BlocFormItem.dart';

abstract class LoginEvent {}


class LoginInitEvent extends LoginEvent{

}


class EmailChanged extends LoginEvent{
  final Blocformitem email;
  EmailChanged({
    required this.email,
  });
}

class PasswordChange extends LoginEvent{
  final Blocformitem password;
  PasswordChange({
    required this.password,
  });
}

class saveUserSession extends LoginEvent{
  final AuthResponse authResponse;
  saveUserSession(
    {required this.authResponse}
  );
}

class FormSubmit extends LoginEvent{
   
}