import 'package:fonibo_task/models/task_model.dart';
import 'package:fonibo_task/repositories/task_repository.dart';
import 'package:fonibo_task/repositories/task_repository_interface.dart';

class TaskController {
  final ITaskRepository _taskRepository = TaskRepository();
  Future<List<TaskModel>> fetchAllTasks() {
    return _taskRepository.getAllTasks();
  }
}
