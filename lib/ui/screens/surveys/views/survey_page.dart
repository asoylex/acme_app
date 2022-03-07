import 'package:acme_app/models/questions.dart';
import 'package:acme_app/models/surveys.dart';
import 'package:acme_app/services/db.dart';
import 'package:acme_app/ui/screens/surveys/views/create_survey_page.dart';
import 'package:acme_app/ui/screens/surveys/views/edit_survey_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class SurveyPage extends StatelessWidget {
  List<Survey> surveys = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Encuestas'),
        actions: [
          IconButton(
            onPressed: () => FirebaseAuth.instance.signOut(),
            icon: const Icon(Icons.power_settings_new),
          )
        ],
      ),
      body: Center(
        child: StreamBuilder<List<Survey>>(
          stream: context.read<DatabaseService>().streamSurveys(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  surveys = snapshot.data!;
                  return Card(
                    elevation: 2,
                    child: ListTile(
                      leading: const Icon(
                        Icons.playlist_add_check_outlined,
                        size: 35,
                      ),
                      title: Column(
                        children: [
                          Text(
                            surveys[index].id,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("Nombre: " + surveys[index].name),
                          Text("Descripción: " + surveys[index].description),
                          const Text("Total Ecuestas: "),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.edit,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  EditSurveyPage(survey: surveys[index]),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: snapshot.data!.length,
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CreateSurveyPage(),
                  ),
                );
              },
              child: const Icon(Icons.add),
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
