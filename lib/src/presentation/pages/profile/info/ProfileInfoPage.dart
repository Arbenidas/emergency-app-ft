// lib/src/presentation/pages/profile/info/ProfileInfoPage.dart

import 'package:app_emergencia/src/presentation/pages/profile/info/ProfileInfoContent.dart';
import 'package:app_emergencia/src/presentation/pages/profile/info/bloc/ProfileInfoBloc.dart';
import 'package:app_emergencia/src/presentation/pages/profile/info/bloc/ProfileInfoState.dart';
// 1. Asegúrate de importar tu evento
import 'package:app_emergencia/src/presentation/pages/profile/info/bloc/ProfileInforEvent.dart'; 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileInfoPage extends StatefulWidget {
  // 2. El constructor NO debe recibir un User. El BLoC lo manejará.
  const ProfileInfoPage({super.key});

  @override
  State<ProfileInfoPage> createState() => _ProfileInfoPageState();
}

class _ProfileInfoPageState extends State<ProfileInfoPage> {
  
  // 3. Agrega initState para cargar los datos del usuario
  @override
  void initState() {
    super.initState();
    // Pide al BLoC que obtenga la información del usuario
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ProfileInfoBloc>().add(GetUserInfo());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileInfoBloc, ProfileInfoState>(
        builder: (context, state) {
          return ProfileInfoContent(state.user);
        },
      ),
    );
  }
}