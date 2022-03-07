import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final bool? isPasswordField;
  final TextEditingController texfieldController;
  TextFormFieldWidget(
      {required this.hintText,
      this.isPasswordField = false,
      required this.texfieldController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      width: 300,
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.cyan,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: TextFormField(
        controller: texfieldController,
        obscureText: isPasswordField!,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
        ),
        onTap: () {},
      ),
    );
  }
}
