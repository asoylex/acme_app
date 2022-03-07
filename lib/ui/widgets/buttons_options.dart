import 'package:acme_app/models/surveys.dart';
import 'package:acme_app/services/db.dart';
import 'package:acme_app/ui/screens/questions/views/create_question.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:acme_app/services/db.dart';

class ButtonsOptions extends StatefulWidget {
  String idDocument;
  bool isSurvey;
  TextEditingController? name = TextEditingController();
  TextEditingController? description = TextEditingController();

  ButtonsOptions(
      {required this.idDocument,
      required this.isSurvey,
      this.description,
      this.name});

  @override
  State<ButtonsOptions> createState() => _ButtonsOptionsState();
}

class _ButtonsOptionsState extends State<ButtonsOptions> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: ElevatedButton(
            onPressed: () {
              if (widget.isSurvey) {
                context.read<DatabaseService>().removeSurvey(widget.idDocument);
                Navigator.pop(context);
              } else {
                context
                    .read<DatabaseService>()
                    .removeQuestion(widget.idDocument);
              }
            },
            child: const Icon(
              Icons.delete,
              size: 15,
            ),
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColor,
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(25),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        if (widget.isSurvey)
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CreateQuestion(
                      idSurvey: widget.idDocument,
                    ),
                  ),
                );
              },
              child: const Icon(
                Icons.add,
                size: 15,
              ),
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(25),
              ),
            ),
          )
      ],
    );
  }
}
