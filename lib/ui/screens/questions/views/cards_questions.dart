import 'package:acme_app/models/questions.dart';
import 'package:acme_app/services/db.dart';
import 'package:acme_app/ui/screens/questions/components/menu_type_field.dart';
import 'package:acme_app/ui/screens/surveys/components/checkbox.dart';
import 'package:acme_app/ui/widgets/buttons_options.dart';
import 'package:acme_app/ui/widgets/text_field_simple.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardQuestions extends StatefulWidget {
  String idSurvey;

  CardQuestions({required this.idSurvey});

  @override
  State<CardQuestions> createState() => _CardQuestionsState();
}

class _CardQuestionsState extends State<CardQuestions> {
  List<Question> questions = [];
  String selectedTypeField = '';
  List<String> typeFields = ['texto', 'fecha', 'numerico'];

  @override
  void initState() {
    // TODO: implement initState
    selectedTypeField = "texto";
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Question>>(
      stream: context.read<DatabaseService>().streamQuestions(widget.idSurvey),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  questions = snapshot.data!;
                  return Card(
                    elevation: 3,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Pregunta " + (index + 1).toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Título:",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        TextFieldSimple(
                            textValue: questions[index].title, readOnly: false),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Nombre del Campo:",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        TextFieldSimple(
                            textValue: questions[index].name, readOnly: false),
                        Text(
                          "Es requerido?",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        CheckBoxSurvey(
                          isRequired: questions[index].isRequired,
                        ),
                        Text(
                          "Tipo de Campo",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        MenuTypeField(
                          selectedTypeField: questions[index].typeField,
                        ),
                        ButtonsOptions(
                          isSurvey: false,
                          idDocument: questions[index].id.toString(),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                itemCount: snapshot.data!.length),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
