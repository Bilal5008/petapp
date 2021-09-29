import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:petapp/Common/buttonfield.dart';
import 'package:petapp/Common/buttontextfield.dart';
import 'package:petapp/Common/edittextfield.dart';
import 'package:petapp/Common/textbuttonfield.dart';




class LoginScreen extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Login In')),
        body: Container(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Pet Application',
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      )),
                  EditTextField(child: 'User name'),
                  EditTextField(child: 'Password'),
                  ButtonTextField(child: 'Forgot Password'),
                  TextButtonField(buttonText: 'Sign Up', text: 'Does not have account?'),
                  ButtonField(buttonText: 'login'),
                ],
              ),
            )
        ),

        // body: Padding(
        //     padding: EdgeInsets.all(10),
        //     child: ListView(
        //       children: [
        //         Container(
        //             alignment: Alignment.center,
        //             padding: EdgeInsets.all(10),
        //             child: Text(
        //               'Pet Application',
        //               style: TextStyle(
        //                   color: Colors.blue,
        //                   fontWeight: FontWeight.w500,
        //                   fontSize: 30),
        //             )),
        //         EditTextField(child: 'User name'),
        //         EditTextField(child: 'Password'),
        //         ButtonTextField(child: 'Forgot Password'),
        //         TextButtonField(
        //             buttonText: 'Sign Up', text: 'Does not have account?'),
        //         ButtonField(buttonText: 'login'),
        //       ],
        //     ))
      );

  }
}
