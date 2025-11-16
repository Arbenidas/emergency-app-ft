import 'package:app_emergencia/src/domain/models/user.dart';
import 'package:app_emergencia/src/presentation/utils/BlocFormItem.dart';
 abstract class ProfileUpdateEvent{}

class ProfileUpdateInitEvent extends ProfileUpdateEvent{
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

class UpdateUserSession extends ProfileUpdateEvent{
  final User? user;

  UpdateUserSession({required this.user});
}

class PickImage extends ProfileUpdateEvent{}

class TakePhoto extends ProfileUpdateEvent {}

class FormSubmit extends ProfileUpdateEvent{ }