import 'package:app_emergencia/src/main.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/client/home/bloc/ClientHomeBloc.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/client/home/bloc/ClientHomeEvent.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/client/home/bloc/ClientHomeState.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/client/mapSeeker/ClientMapSeekerPage.dart';
import 'package:app_emergencia/src/presentation/pages/profile/info/ProfileInfoPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientHomePage extends StatefulWidget {
  const ClientHomePage({super.key});

  @override
  State<ClientHomePage> createState() => _ClienthomepageState();
}

class _ClienthomepageState extends State<ClientHomePage> {
  List<Widget> pageList = <Widget>[
    ClientMapSeekerPage(),
    ProfileInfoPage()
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Menu de opciones")),
      body: BlocBuilder<ClientHomeBloc, ClientHomeState>(
        builder: (context, state) {
          return pageList[state.pageIndex];
        },
      ),
      drawer: BlocBuilder<ClientHomeBloc, ClientHomeState>(
        builder: (context, state) {
          return Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color.fromARGB(255, 14, 39, 145),
                        Color.fromARGB(255, 34, 156, 249),
                      ],
                    ),
                  ),
                  child: Text("menu del cliente",
                  style: TextStyle(
                    color: Colors.white
                  ),),
                ),ListTile(
                  title: Text("Mapa de busqueda"),
                  selected: state.pageIndex == 0,
                  onTap: () {
                    context.read<ClientHomeBloc>().add(
                      ChangeDrawerPage(pageIndex: 0));
                    Navigator.pop(context);
                  },
                ), 
                ListTile(
                  title: Text("Perfil de susuario"),
                  selected: state.pageIndex == 1,
                  onTap: () {
                    context.read<ClientHomeBloc>().add(
                      ChangeDrawerPage(pageIndex: 0));
                    Navigator.pop(context);
                  },
                ), 
                ListTile(
                  title: Text("Cerrar sesion"),
                  selected: state.pageIndex == 2,
                  onTap: () {
                    context.read<ClientHomeBloc>().add(
                      Logout());
                    Navigator.pushAndRemoveUntil(
                      context, 
                      MaterialPageRoute(builder: (context)=> MyApp()), 
                      (route)=> false)
                      ;
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
