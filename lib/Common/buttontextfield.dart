import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petapp/Common/routes.dart';

class ButtonTextField extends StatefulWidget {
  final String child;

  ButtonTextField({Key? key, required this.child}) : super(key: key);

  @override
  _ButtonTextFieldState createState() => _ButtonTextFieldState();
}

class _ButtonTextFieldState extends State<ButtonTextField> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(10),
        child: TextButton(
            onPressed: () {
              //forgot password screen
              const snackBar = SnackBar(content: Text('Tap'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              Navigator.pushNamed(
                  context, Routes.forgetPasswordRoute);
            },
            child: Text(widget.child.toString())),
      ),
    );
  }
}

