import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petapp/Authentication/Login/login.dart';

class ButtonField extends StatefulWidget {
  final String buttonText;

  ButtonField({Key? key, required this.buttonText}) : super(key: key);

  @override
  _ButtonFieldState createState() => _ButtonFieldState();
}

class _ButtonFieldState extends State<ButtonField> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.buttonText.toString() == 'login')
          {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginScreen()));
          }

      },
      child: Container(
        height: 50.0,
        decoration: new BoxDecoration(
            color: Colors.green,
            borderRadius: new BorderRadius.all(Radius.circular(6.0))),
        child: new Center(
          child: new Text(
            widget.buttonText.toString(),
            style: new TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
