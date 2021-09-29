import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petapp/Common/routes.dart';

class TextButtonField extends StatefulWidget {
  final String buttonText;
  final String text;

  TextButtonField({Key? key, required this.buttonText, required this.text})
      : super(key: key);

  @override
  _TextButtonFieldState createState() => _TextButtonFieldState();
}

class _TextButtonFieldState extends State<TextButtonField> {
  @override
  Widget build(BuildContext context) {
   return Container(
        child: Row(
      children: <Widget>[
        Text(widget.text.toString()),
        TextButton(
          child: Text(
            widget.buttonText.toString(),
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () {
            //signup screen
            Navigator.pushNamed(
                context, Routes.signUpRoute);
          },
        )
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    ));
  }
}
