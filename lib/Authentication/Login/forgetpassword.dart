import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petapp/Common/buttonfield.dart';
import 'package:petapp/Common/edittextfield.dart';


class ForgetPasswordScreen extends StatefulWidget {
  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('ForgetPassword')),
        body: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                EditTextField(child: 'Email Address'),
                ButtonField(buttonText: 'Send Email'),
              ],
            )));
  }
}
