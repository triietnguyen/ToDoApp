class Todo {
  String? id;
  String? title;
  String? description;
  bool? complete;
  DateTime? time;
  Map<String, dynamic>? additionalFields;

  Todo({
    this.id,
    this.title,
    this.description,
    this.complete,
    this.time,
    this.additionalFields,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      complete: json['complete'],
      time: DateTime.parse(json['time']),
      additionalFields: json['additionalFields'] ?? {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'complete': complete,
      'time': time?.toIso8601String(),
      'additionalFields': additionalFields,
    };
  }
}
