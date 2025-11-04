import 'package:app_emergencia/src/presentation/pages/Auth/register/RegisterContent.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/register/bloc/RegisterBloc.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/register/bloc/RegisterState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return RegisterContent(state);
        },
      ),
    );
  }
}
