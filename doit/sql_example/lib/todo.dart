class Todo {
  String title;
  String content;
  bool? active;
  int? id;

  Todo({required this.title, required this.content,this.active, this.id});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'activce': active
    };
  }
}