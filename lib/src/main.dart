import 'package:app_emergencia/src/blocProviders.dart';
import 'package:app_emergencia/src/injection.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/client/home/ClientHomePage.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/login/LoginPage.dart';
import 'package:app_emergencia/src/presentation/pages/Auth/register/RegisterPage.dart';
import 'package:app_emergencia/src/presentation/pages/profile/update/ProfileUpdatePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: FToastBuilder(),
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => Loginpage(),
          'register': (BuildContext context) => RegisterPage(),
          'client/home': (BuildContext context)=>ClientHomePage( ),
          'profile/update': (BuildContext context) => ProfileUpdatePage(),
        },
      ),
    );
  }
}
