class TaskModel {
  int id;
  String title;
  String createdAt;

  TaskModel(this.id, this.title, this.createdAt);
  TaskModel.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.title = map['title'];
    this.createdAt = map['createdAt'];
  }
  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'createdAt': createdAt};
  }
}
