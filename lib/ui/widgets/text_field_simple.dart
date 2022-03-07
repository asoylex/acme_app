import 'package:flutter/material.dart';

class TextFieldSimple extends StatefulWidget {
  bool? readOnly;
  String? textValue;

  TextFieldSimple({this.readOnly, this.textValue});

  @override
  State<TextFieldSimple> createState() => _TextFieldSimpleState();
}

class _TextFieldSimpleState extends State<TextFieldSimple> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      margin: EdgeInsets.all(10),
      width: 300,
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.cyan,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      alignment: Alignment.center,
      child: TextFormField(
        readOnly: widget.readOnly ?? false,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        initialValue: widget.textValue,
      ),
    );
    ;
  }
}
