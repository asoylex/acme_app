class Survey {
  final String id;
  final String name;
  final String description;

  Survey({
    required this.id,
    required this.name,
    required this.description,
  });

  factory Survey.fromMap(
    Map data,
    String id,
  ) {
    data = data;
    return Survey(
      id: id,
      name: data['name'],
      description: data['description'],
    );
  }
}
