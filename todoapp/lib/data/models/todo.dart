class Todo {
  String? id;
  String? title;
  String? description;
  bool? important;
  DateTime? time;
  Map<String, dynamic>? additionalFields;

  Todo({
    this.id,
    this.title,
    this.description,
    this.important,
    this.time,
    this.additionalFields,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      important: json['important'],
      time: DateTime.parse(json['time']),
      additionalFields: json['additionalFields'] ?? {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'important': important,
      'time': time?.toIso8601String(),
      'additionalFields': additionalFields,
    };
  }
}
