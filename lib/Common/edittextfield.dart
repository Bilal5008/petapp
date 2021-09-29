import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditTextField extends StatefulWidget {
  final String child;

  EditTextField({Key? key, required this.child}) : super(key: key);

  @override
  _EditTextFieldState createState() => _EditTextFieldState();
}

class _EditTextFieldState extends State<EditTextField> {
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.all(10),
      child: TextField(
        controller: nameController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText:  widget.child.toString(),
        ),
      ),
    );
  }
}
