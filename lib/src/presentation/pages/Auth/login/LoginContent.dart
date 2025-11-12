import 'package:app_emergencia/src/presentation/pages/Auth/login/bloc/LoginBloc.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/login/bloc/LoginEvent.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/login/bloc/LoginState.dart';
import 'package:app_emergencia/src/presentation/pages/widgets/DefaultButton.dart';
import 'package:app_emergencia/src/presentation/pages/widgets/DefaultTextField.dart';
import 'package:app_emergencia/src/presentation/utils/BlocFormItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginContent extends StatelessWidget {

  final LoginState state;

   LoginContent(this.state);



  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(255, 14, 39, 145),
                  Color.fromARGB(255, 34 , 156, 249),
                ]),
            ),
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 _textloginRotated("Login"),
                SizedBox(height: 80),
                _textRegisterRotated(context)
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.895,
            // width: MediaQuery.of(context).size.width *0.8,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(255, 14, 29, 166),
                  Color.fromARGB(255, 30 , 112, 227),
                ]),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
            ),
            margin: EdgeInsets.only(left: 60),
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  Text(
                    "Welcome",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  Text("Back", style: TextStyle(fontSize: 25, color: Colors.white)),
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/img/car.png',
                      width: 150,
                      height: 150,
                    ),
                  ),
                  Text(
                    "Log in..",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                 DefaultTextfield(
                  text: "Email",
                  icon: Icons.email_outlined, 
                  onChange: (String text) { 
                    return context.read<LoginBloc>().add(EmailChanged(email: Blocformitem(value: text)));
                   },
                   validator: (value) {
                     return state.email.error;
                   },),
                  SizedBox(height: 20),
                  DefaultTextfield(
                  text: "Contraseña", 
                  icon: Icons.lock_outline,
                  onChange: (String text) { 
                   return context.read<LoginBloc>().add(PasswordChange(password: Blocformitem(value: text)));

                   },validator: (value) {
                     return state.password.error;
                   },
                   ),
                  SizedBox(height: MediaQuery.of(context).size.height *0.15),
                  Defaultbutton(
                    texto: "Iniciar sesion",
                    color: Colors.white, 
                    onPressed: () {
                      if (state.formKey!.currentState!.validate()) {
                          context.read<LoginBloc>().add(FormSubmit());
                      }else{
                        print("Formulario no valido");
                      }
                   },),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(width: 30, height: 1, color: Colors.white),
                      Text(" O ", style: TextStyle(color: Colors.white)),
                      Container(width: 30, height: 1, color: Colors.white),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child:_TextNoRegisterYet(context), 
                  ),
                  
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _TextNoRegisterYet(BuildContext context){

    return Row(
  mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "No tienes cuenta?",
        style: TextStyle(color: Colors.grey.shade200),
      ),
      GestureDetector(
         onTap: () => {
          Navigator.pushNamed(context,'register')
        },
        child: Text(
          " Registrate",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
    );
  }

  Widget _textloginRotated(String texto){

    return RotatedBox(
                quarterTurns: 1,
                child: Text(
                  texto,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
    
  }
  Widget _textRegisterRotated(BuildContext context){

    return GestureDetector(
     // En tu archivo LoginContent.dart
onTap: () {
  Navigator.pushNamed(context, 'register'); // <--- ESTA ES LA SOLUCIÓN
},
      child: RotatedBox(
                  quarterTurns: 1,
                  child: Text(
                    "registro",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
    );
    
  }
}
