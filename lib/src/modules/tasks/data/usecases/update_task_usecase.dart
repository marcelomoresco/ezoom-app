import 'package:ezoom_todolist/src/modules/tasks/domain/entities/task.dart';
import 'package:ezoom_todolist/src/modules/tasks/domain/repositories/task_repository.dart';

class UpdateTaskUsecase {
  final TaskRepository taskRepository;

  UpdateTaskUsecase({required this.taskRepository});

  Future<void> call(Task task) async {
    await taskRepository.updateTask(task);
  }
}
