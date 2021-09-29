import 'package:flutter/material.dart';
import 'package:petapp/networking/app_config.dart';
import 'package:petapp/networking/environment.dart';
import 'Authentication/DashBoard/addpet.dart';
import 'Authentication/Login/forgetpassword.dart';
import 'Authentication/SignUp/signup.dart';
import 'Common/routes.dart';
import 'feature/movielist/movielistscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppConfig.instance.setEnvironment(Environment.dev);
    return MaterialApp(
      routes: {
        Routes.forgetPasswordRoute: (context) => ForgetPasswordScreen(),
        Routes.signUpRoute: (context) => SignUpScreen(),
        Routes.dashboardRoute: (context) => AddPetScreen(),
      },
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MovieListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
