import 'package:acme_app/models/surveys.dart';
import 'package:acme_app/services/db.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateSurveyPage extends StatefulWidget {
  CreateSurveyPage({Key? key}) : super(key: key);

  @override
  State<CreateSurveyPage> createState() => _CreateSurveyPageState();
}

class _CreateSurveyPageState extends State<CreateSurveyPage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Crear Encuesta"),
      ),
      body: Center(
        child: Form(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Nombre de la encuesta",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              textField("Nombre", name),
              Text(
                "Descripcion de la encuesta",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              textField("Descripcion", description),
              const SizedBox(
                height: 20,
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
                db.createSurveys(
                  name.text,
                  description.text,
                );
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

  Widget textField(String value, TextEditingController _controller) {
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
        controller: _controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: value,
        ),
      ),
    );
  }
}
