import 'package:ezoom_todolist/src/modules/tasks/domain/entities/task.dart';

abstract interface class TaskRepository {
  Future<Task> findById(String id);
  Future<List<Task>> findAll();
  Future<void> createTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> deleteTask(String id);
}
