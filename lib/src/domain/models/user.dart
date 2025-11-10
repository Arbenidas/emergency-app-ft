import 'package:app_emergencia/src/domain/models/Role.dart';
class User {
    int? id;
    String name;
    String lastname;
    String email;
    String phone;
    String password;
    String dui;
    dynamic image;
    List<Role>? roles;
    dynamic notificationToken;

    User({
         this.id,
        required this.name,
        required this.lastname,
        required this.email,
        required this.phone,
        required this.password,
        required this.dui,
         this.image,
         this.roles,
         this.notificationToken,
    });

    //...
    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"] ?? '', // <--- AÑADIDO
        lastname: json["lastname"] ?? '', // <--- AÑADIDO
        email: json["email"] ?? '', // <--- AÑADIDO
        phone: json["phone"] ?? '', // <--- AÑADIDO
        image: json["image"],
        password: json["password"] ?? '', // <--- AÑADIDO
        notificationToken: json["notification_token"],
        dui: json["dui"] ?? '', // <--- AÑADIDO
        roles: json["roles"] == null ? [] : List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
    );
//...

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastname": lastname,
        "email": email,
        "phone": phone,
        "dui":dui,
        "password": password,
        "image": image,
        "roles": roles != null ? List<dynamic>.from(roles!.map((x) => x.toJson()))
        :[],
        "notification_token": notificationToken,
    };

}