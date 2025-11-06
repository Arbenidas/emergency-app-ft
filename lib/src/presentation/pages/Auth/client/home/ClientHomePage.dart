import 'package:flutter/material.dart';

class ClientHomePage extends StatefulWidget {
  const ClientHomePage({super.key});

  @override
  State<ClientHomePage> createState() => _ClienthomepageState();
}

class _ClienthomepageState extends State<ClientHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Text("Pantalla de inicio"),
      ),
    );
  }
}