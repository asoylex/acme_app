import 'package:flutter/material.dart';

class TypeDataCheckBox extends StatefulWidget {
  bool isRequired;
  String typeField;
  TypeDataCheckBox({required this.isRequired, required this.typeField});

  @override
  State<TypeDataCheckBox> createState() => _TypeDataCheckBoxState();
}

class _TypeDataCheckBoxState extends State<TypeDataCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(widget.typeField),
          Checkbox(
              checkColor: Theme.of(context).primaryColor,
              value: widget.isRequired,
              onChanged: (value) {
                setState(() {
                  widget.isRequired = value!;
                });
              }),
        ],
      ),
    );
  }
}
