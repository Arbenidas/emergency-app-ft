import 'package:app_emergencia/src/domain/models/user.dart';

class AuthResponse {
    String token;
    User user;

    AuthResponse({
        required this.token,
        required this.user,
    });

    //...
    factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        token: json["token"] ?? '', // <--- AÑADIDO
        user: User.fromJson(json["user"]),
    );
//...

    Map<String, dynamic> toJson() => {
        "token": token,
        "user": user.toJson(),
    };
}