import 'package:flutter/material.dart';

class CheckBoxSurvey extends StatefulWidget {
  bool isRequired;
  CheckBoxSurvey({required this.isRequired});

  @override
  State<CheckBoxSurvey> createState() => _CheckBoxSurveyState();
}

class _CheckBoxSurveyState extends State<CheckBoxSurvey> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        checkColor: Theme.of(context).primaryColor,
        value: widget.isRequired,
        onChanged: (value) {
          setState(() {
            widget.isRequired = value!;
          });
        });
  }
}
