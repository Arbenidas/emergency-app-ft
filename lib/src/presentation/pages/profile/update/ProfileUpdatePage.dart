import 'package:app_emergencia/src/domain/models/user.dart';
import 'package:app_emergencia/src/presentation/pages/profile/update/ProfileUpdateContent.dart';
import 'package:flutter/material.dart';

class ProfileUpdatePage extends StatefulWidget {
  const ProfileUpdatePage({super.key});

  @override
  State<ProfileUpdatePage> createState() => _ProfileUpdatePageState();
}

class _ProfileUpdatePageState extends State<ProfileUpdatePage> {

  User? user;


  @override
  Widget build(BuildContext context) {
    user = ModalRoute.of(context)?.settings.arguments as User;
    return  Scaffold(
      body: ProfileUpdateContent(user),
    );
  }
}