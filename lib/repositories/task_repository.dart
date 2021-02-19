import 'package:fonibo_task/models/task_model.dart';
import 'package:fonibo_task/repositories/task_repository_interface.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TaskRepository implements ITaskRepository {
  @override
  Future<List<TaskModel>> getAllTasks() async {
    var url = 'https://cdn.fonibo.com/challenges/tasks.json';
    var response = await http.get(url);
    List<TaskModel> tasks = [];
    if (response.statusCode == 200) {
      List list = json.decode(response.body);
      tasks = list.map((model) => TaskModel.fromMap(model)).toList();
    }
    return tasks;
  }
}
