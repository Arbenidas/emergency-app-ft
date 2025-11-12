import 'package:app_emergencia/src/domain/models/AuthResponse.dart';
import 'package:app_emergencia/src/domain/utils/Resource.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/login/bloc/LoginBloc.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/login/bloc/LoginEvent.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/login/bloc/LoginState.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/login/loginContent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
                  Fluttertoast.showToast(msg: response.message);

                }else if(response is Success){
                  final authResponse = response.data as AuthResponse;
                  context.read<LoginBloc>().add(saveUserSession( authResponse: authResponse) );
                  Navigator.pushNamedAndRemoveUntil(context, 'client/home', (route)=>false);
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
