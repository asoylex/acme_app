import 'package:acme_app/models/questions.dart';
import 'package:acme_app/models/surveys.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Survey>> streamSurveys() {
    var ref = _db.collection('surveys');
    return ref.snapshots().map((list) => list.docs
        .map((doc) => Survey.fromMap(
              doc.data(),
              doc.id,
            ))
        .toList());
  }

  Stream<List<Question>> streamQuestions(String idSurvey) {
    var ref =
        _db.collection('questions').where('idSurvey', isEqualTo: idSurvey);
    return ref.snapshots().map((list) => list.docs
        .map((doc) => Question.fromMap(
              doc.data(),
              doc.id,
            ))
        .toList());
  }

  Future<void> createSurveys(String name, String description) async {
    return _db.collection('surveys').doc().set({
      "name": name,
      "description": description,
    });
  }

  Future<void> createQuestions(Question question) async {
    return _db.collection('questions').doc().set({
      "idSurvey": question.idSurvey,
      "title": question.title,
      "name": question.name,
      "isRequired": question.isRequired,
      "typeField": question.typeField,
    });
  }

  Future<void> updateSurvey(Survey survey) async {
    var ref = _db.collection('surveys');
    await ref
        .doc(survey.id)
        .update({'name': survey.name, 'description': survey.description});
    return;
  }

  Future<void> removeSurvey(String id) async {
    var ref = _db.collection('surveys');
    await ref.doc(id).delete();
    return;
  }

  Future<void> removeQuestion(String id) async {
    var ref = _db.collection('questions');
    await ref.doc(id).delete();
    return;
  }
}
