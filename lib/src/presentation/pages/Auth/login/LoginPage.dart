import 'package:app_emergencia/src/domain/utils/Resource.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/login/bloc/LoginBloc.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/login/bloc/LoginEvent.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/login/bloc/LoginState.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/login/loginContent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
                final response = state.response;
                if (response is ErrorData) {
                  print('Error data: ${response.message}');
                }else if(response is Success){
                  print('Succes Data: ${response.data}');
                }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              final response = state.response;
              if(response is Loading){
                return Stack(
                  children: [
                    LoginContent(state),
                    Center(
                      child: CircularProgressIndicator(),
                    
                    ),
                  ],
                );
              }
              return LoginContent(state);
            },
          ),
        ),
      ),
    );
  }
}
