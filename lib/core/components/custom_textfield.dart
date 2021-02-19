import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  String labelText;

  CustomTextField({Key key, this.controller, this.labelText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.white,
      style: TextStyle(
        color: Colors.white,
      ),
      controller: controller,
      decoration: InputDecoration(
          focusColor: Colors.white,
          labelText: labelText,
          labelStyle: GoogleFonts.poppins(
            color: Colors.white,
          )),
    );
  }
}
