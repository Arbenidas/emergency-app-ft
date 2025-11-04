import 'package:app_emergencia/src/presentation/utils/BlocFormItem.dart';

abstract class RegisterEvent {}

class RegisterInitEvent extends RegisterEvent{}

class NameChanged extends RegisterInitEvent{
  final Blocformitem name;
  NameChanged({
    required this.name
  });
}
class LastNameChange extends RegisterInitEvent{
  final Blocformitem lastname;
  LastNameChange({
    required this.lastname
  });
}
class EmailChange extends RegisterInitEvent{
  final Blocformitem email;
  EmailChange({
    required this.email
  });
}
class PhoneChange extends RegisterInitEvent{
  final Blocformitem phone;
  PhoneChange({
    required this.phone
  });
}
class PasswordChange extends RegisterInitEvent{
  final Blocformitem password;
  PasswordChange({
    required this.password
  });
}

class ConfirmPasswordChange extends RegisterInitEvent{
  final Blocformitem confirmpassword;
  ConfirmPasswordChange({
    required this.confirmpassword
  });
}

class FormSubmit extends RegisterInitEvent{}
class FormReset extends RegisterInitEvent{}

