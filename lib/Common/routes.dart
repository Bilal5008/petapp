import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:petapp/feature/moviedetail/moviedetailscreen.dart';
import 'package:petapp/feature/movielist/movielistscreen.dart';

class Routes {
  static String loginRoute = 'Login';
  static const String forgetPasswordRoute =
      '/Authentication/Login/forgetpassword';
  static const String signUpRoute = 'SignUp';
  static const String dashboardRoute = 'Dashboard';
  static const routeName = '/passArguments';
  static const routeName2 = '/passArguments2';
}

// variable for our route names
const String movieList = 'movieList';
const String movieDetails = 'movieDetails';

// controller function with switch statement to control page route flow
// Route<dynamic> controller(RouteSettings settings) {
//   switch (settings.name) {
//     case movieList:
//       return MaterialPageRoute(builder: (context) => MovieListScreen());
//     case movieDetails:
//       return MaterialPageRoute(builder: (context) => MovieDetailScreen());
//     default:
//       throw ('this route name does not exist');
//   }
// }

