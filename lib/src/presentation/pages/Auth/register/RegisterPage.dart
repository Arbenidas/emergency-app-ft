import 'package:app_emergencia/src/domain/utils/Resource.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/register/RegisterContent.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/register/bloc/RegisterBloc.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/register/bloc/RegisterEvent.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/register/bloc/RegisterState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          final response = state.response;
          if(response is ErrorData){
            Fluttertoast.showToast(msg: response.message,toastLength: Toast.LENGTH_SHORT);
          }
          else if(response is Success){
            // context.read<RegisterBloc>().add(FormReset());
          }
        },
        child: BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            return RegisterContent(state);
          },
        ),
      ),
    );
  }
}
