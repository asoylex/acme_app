import 'package:flutter/material.dart';

class MenuTypeField extends StatefulWidget {
  String selectedTypeField;

  MenuTypeField({required this.selectedTypeField});

  @override
  State<MenuTypeField> createState() => _MenuTypeFieldState();
}

class _MenuTypeFieldState extends State<MenuTypeField> {
  List<String> typeFields = ['texto', 'fecha', 'numerico'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: EdgeInsets.all(20),
      child: DropdownButton(
        isExpanded: true,
        value: widget.selectedTypeField,
        onChanged: (val) {
          setState(() {
            widget.selectedTypeField = val as String;
          });
        },
        items: typeFields
            .map(
              (field) => DropdownMenuItem(
                child:
                    Text(field, style: Theme.of(context).textTheme.titleMedium),
                value: field,
              ),
            )
            .toList(),
      ),
    );
  }
}
