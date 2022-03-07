class Question {
  String? id;
  String idSurvey;
  String name;
  String title;
  String typeField;
  bool isRequired;

  Question(
      {this.id,
      required this.idSurvey,
      required this.title,
      required this.name,
      required this.typeField,
      required this.isRequired});

  factory Question.fromMap(Map data, String id) {
    data = data;
    return Question(
      id: id,
      idSurvey: data['idSurvey'],
      title: data['title'],
      name: data['name'],
      typeField: data['typeField'],
      isRequired: data['isRequired'],
    );
  }
}
