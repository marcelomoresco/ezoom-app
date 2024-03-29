// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ezoom_todolist/src/modules/tasks/domain/entities/task.dart';
import 'package:ezoom_todolist/src/modules/tasks/domain/repositories/task_repository.dart';

class GetTasksUsecase {
  final TaskRepository taskRepository;

  GetTasksUsecase({
    required this.taskRepository,
  });

  Future<List<Task>> call() async {
    return taskRepository.findAll();
  }
}
