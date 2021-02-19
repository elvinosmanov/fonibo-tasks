import 'package:fonibo_task/models/task_model.dart';

abstract class ITaskRepository {
  Future<List<TaskModel>> getAllTasks();
}
