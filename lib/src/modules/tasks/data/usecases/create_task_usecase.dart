// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ezoom_todolist/src/modules/tasks/domain/entities/task.dart';
import 'package:ezoom_todolist/src/modules/tasks/domain/repositories/task_repository.dart';

class CreateTaskUsecase {
  final TaskRepository taskRepository;

  CreateTaskUsecase({
    required this.taskRepository,
  });

  Future<void> call(Task task) async {
    return await taskRepository.createTask(task);
  }
}
