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

class passwordChange extends LoginEvent{
  final Blocformitem password;
  passwordChange({
    required this.password,
  });
}

class FormSubmit extends LoginEvent{
   
}