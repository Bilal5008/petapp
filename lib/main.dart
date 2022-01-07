import 'package:flutter/material.dart';
import 'package:petapp/networking/app_config.dart';
import 'package:petapp/networking/environment.dart';
import 'Authentication/DashBoard/addpet.dart';
import 'Authentication/Login/forgetpassword.dart';
import 'Authentication/SignUp/signup.dart';
import 'Common/routes.dart';
import 'feature/InstagramPage.dart';
import 'feature/facebookpage.dart';
import 'feature/moviedetail/moviedetailscreen.dart';
import 'feature/moviedetail/moviedetailscreen2.dart';
import 'feature/movielist/layoutpractice.dart';
import 'feature/movielist/movielistresponse/alllist_response.dart';
import 'feature/movielist/movielistscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    AppConfig.instance.setEnvironment(Environment.dev);
    return MaterialApp(
      routes: {
        Routes.forgetPasswordRoute: (context) => ForgetPasswordScreen(),
        Routes.signUpRoute: (context) => SignUpScreen(),
        Routes.dashboardRoute: (context) => AddPetScreen(),
      },
      title: 'Splash Screen',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme
            .copyWith(primary: Colors.grey, secondary: Colors.black),
      ),

      // routes: {
      //   '/details': (context) => MovieDetailScreen(),
      // },
      initialRoute: '/',
      onGenerateRoute: (settings) {
        // If you push the PassArguments route
        if (settings.name == Routes.routeName) {
          // Cast the arguments to the correct
          // type: ScreenArguments.
          final args = settings.arguments as Result;

          // Then, extract the required data from
          // the arguments and pass the data to the
          // correct screen.
          return MaterialPageRoute(
            builder: (context) {
              return MovieDetailScreen(
                result: args,
              );
            },
          );
        } else if (settings.name == Routes.routeName2) {
          final args = settings.arguments as Result;

          // Then, extract the required data from
          // the arguments and pass the data to the
          // correct screen.
          return MaterialPageRoute(
            builder: (context) {
              return MovieDetailScreen2(
                result: args,
              );
            },
          );
        } else if (settings.name == "/") {
          return MaterialPageRoute(
            builder: (context) {
              return MovieListScreen();
            },
          );
        } else if (settings.name == "/practise") {
          return MaterialPageRoute(
            builder: (context) {
              return LayoutPractice();
            },
          );
        } else if (settings.name == "/instagram") {
          return MaterialPageRoute(
            builder: (context) {
              return InstagramPage();
            },
          );
        }else if (settings.name == "/facebook") {
          return MaterialPageRoute(
            builder: (context) {
              return FaceBookPage();
            },
          );
        }
        // The code only supports
        // PassArgumentsScreen.routeName right now.
        // Other values need to be implemented if we
        // add them. The assertion here will help remind
        // us of that higher up in the call stack, since
        // this assertion would otherwise fire somewhere
        // in the framework.
        assert(false, 'Need to implement ${settings.name}');
        return null;
      },

      debugShowCheckedModeBanner: false,
    );
  }
}
