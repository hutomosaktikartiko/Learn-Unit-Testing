class DataModel {
  int? userId, id;
  String? title;
  bool? completed;

  DataModel({
    this.userId, this.id,
    this.title, this.completed,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}