

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petapp/Common/buttonfield.dart';
import 'package:petapp/Common/edittextfield.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(title: Text('Sign Up')),
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(10),
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
                  EditTextField(child: 'First Name'),
                  EditTextField(child: 'Last Name'),
                  EditTextField(child: 'Email'),
                  EditTextField(child: 'Phone Number'),
                  EditTextField(child: 'Password'),
                  EditTextField(child: 'Confirm Password'),
                  ButtonField(buttonText: 'Sign Up'),
                ],
              )),
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
