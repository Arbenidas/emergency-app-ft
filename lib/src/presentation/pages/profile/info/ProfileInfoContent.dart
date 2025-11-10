import 'package:app_emergencia/src/domain/models/user.dart';
import 'package:flutter/material.dart';

class ProfileInfoContent extends StatelessWidget {
  final User? user;

  ProfileInfoContent(this.user);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //primera parte del stack
        Column(
          children: [
            _HeaderProfile(context),
            Spacer(),
            _actionProfile("editar Perfil", Icons.edit),
            _actionProfile("Cerrar sesion", Icons.exit_to_app),
            SizedBox(height: 50),
          ],
        ),
        // Ahora esta llamada usa el MÉTODO _cardUser de esta clase
        _cardUser(context), 
      ],
    );
  }

  // MÉTODO MOVIDO DENTRO DE LA CLASE
  Widget _cardUser(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 120, bottom: 20, left: 20, right: 20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.30,
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              width: 150,
              child: AspectRatio(
                aspectRatio: 1,
                child: ClipOval(
                  child: FadeInImage.assetNetwork(
                    placeholder: "assets/img/user_image.png",
                    image:
                        "https://cdn.pixabay.com/photo/2023/02/18/11/00/icon-7797704_640.png",
                    fit: BoxFit.cover,
                    fadeInDuration: Duration(seconds: 1),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                // Ahora 'user' es accesible porque _cardUser es un método de la clase
                // Usamos '??' para poner un valor por defecto si es nulo
                user?.name ?? 'Nombre de Usuario', 
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                // Corregido: usa el email del usuario
                user?.email ?? 'email@ejemplo.com', 
                style:
                    TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
              ),
            )
          ],
        ),
      ),
    );
  }

  // MÉTODO MOVIDO DENTRO DE LA CLASE
  Widget _actionProfile(String option, IconData icon) {
    return ListTile(
      title: Text(
        option,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      leading: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 12, 38, 145),
              Color.fromARGB(255, 34, 156, 249),
            ],
          ),
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }

  // MÉTODO MOVIDO DENTRO DE LA CLASE
  Widget _HeaderProfile(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: 40),
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 12, 38, 145),
            Color.fromARGB(255, 34, 156, 249),
          ],
        ),
      ),
      child: Text(
        "PERFIL DEL USUARIO",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}