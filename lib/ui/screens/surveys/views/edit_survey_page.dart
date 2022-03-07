import 'package:acme_app/models/questions.dart';
import 'package:acme_app/models/surveys.dart';
import 'package:acme_app/ui/screens/questions/views/cards_questions.dart';
import 'package:acme_app/ui/widgets/buttons_options.dart';
import 'package:acme_app/ui/widgets/text_field_simple.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditSurveyPage extends StatefulWidget {
  Survey survey;

  EditSurveyPage({required this.survey});

  @override
  State<EditSurveyPage> createState() => _EditSurveyPageState();
}

class _EditSurveyPageState extends State<EditSurveyPage> {
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(widget.survey.id),
      ),
      body: Center(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Nombre de la encuesta",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                TextFieldSimple(textValue: widget.survey.name, readOnly: false),
                Text(
                  "Descripcion de la encuesta",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                TextFieldSimple(
                    textValue: widget.survey.description, readOnly: false),
                const SizedBox(
                  height: 20,
                ),
                ButtonsOptions(
                  idDocument: widget.survey.id,
                  isSurvey: true,
                ),
                CardQuestions(idSurvey: widget.survey.id)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
