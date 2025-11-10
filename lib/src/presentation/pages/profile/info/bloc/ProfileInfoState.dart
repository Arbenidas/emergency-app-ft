import 'package:app_emergencia/src/domain/models/user.dart';
import 'package:equatable/equatable.dart';

class ProfileInfoState extends Equatable{

  final User? user;

ProfileInfoState({
  this.user
});

ProfileInfoState copyWith({
  User? user
}){
  return ProfileInfoState(
    user: user
  );
}


@override
  List<Object?> get props => [
    user
  ];

}