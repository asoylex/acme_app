import 'package:acme_app/models/questions.dart';
import 'package:acme_app/services/db.dart';
import 'package:acme_app/ui/screens/surveys/components/checkbox.dart';
import 'package:acme_app/ui/widgets/text_field_simple.dart';
import 'package:acme_app/ui/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateQuestion extends StatefulWidget {
  final String idSurvey;
  CreateQuestion({required this.idSurvey});

  @override
  State<CreateQuestion> createState() => _CreateQuestionState();
}

class _CreateQuestionState extends State<CreateQuestion> {
  final TextEditingController title = TextEditingController();
  final TextEditingController name = TextEditingController();
  bool isRequired = false;
  String selectedTypeField = '';
  List<String> typeFields = ['texto', 'fecha', 'numerico'];

  @override
  void initState() {
    super.initState();
    selectedTypeField = typeFields[1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Crear Pregunta"),
      ),
      body: Center(
        child: Form(
          child: Column(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Creando Pregunta",
                    style: TextStyle(
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
                  TextFormFieldWidget(
                      hintText: "Titulo de la Pregunta",
                      texfieldController: title),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Nombre:",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextFormFieldWidget(
                      hintText: "Nombre de la pregunta",
                      texfieldController: name),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Es requerido?",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  CheckBoxSurvey(
                    isRequired: isRequired,
                  ),
                  Text(
                    "Tipo de Campo",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Container(
                    width: 200,
                    padding: EdgeInsets.all(20),
                    child: DropdownButton(
                      isExpanded: true,
                      value: selectedTypeField,
                      onChanged: (val) {
                        setState(() {
                          selectedTypeField = val as String;
                          print(selectedTypeField);
                        });
                      },
                      items: typeFields
                          .map(
                            (field) => DropdownMenuItem(
                              child: Text(field,
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                              value: field,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: ElevatedButton(
              onPressed: () {},
              child: const Icon(Icons.delete),
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
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: ElevatedButton(
              onPressed: () async {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
                await Future.delayed(Duration(milliseconds: 600));
                Navigator.pop(context);
                final db = context.read<DatabaseService>();
                db.createQuestions(Question(
                    idSurvey: widget.idSurvey,
                    title: title.text,
                    name: name.text,
                    typeField: selectedTypeField,
                    isRequired: isRequired));
                Navigator.pop(context);
              },
              child: const Icon(Icons.save),
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(25),
              ),
            ),
          )
        ],
      ),
    );
  }
}
