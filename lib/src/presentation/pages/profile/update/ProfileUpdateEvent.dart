import 'package:app_emergencia/src/domain/models/user.dart';
import 'package:app_emergencia/src/presentation/utils/BlocFormItem.dart';
 class ProfileUpdateEvent{}

class ProfileUpdateInitEvent{
  final User? user;

  ProfileUpdateInitEvent({
    required this.user
  });


}


class NameChanged extends ProfileUpdateEvent{
  final Blocformitem name;
  NameChanged({required this.name});
}

class LastNameChanged extends ProfileUpdateEvent{
  final Blocformitem lastname;
  LastNameChanged({required this.lastname});

}
class Phonechanged extends ProfileUpdateEvent{
  final Blocformitem phone;
  Phonechanged({required this.phone});
}

class FormSubmit extends ProfileUpdateEvent{ }