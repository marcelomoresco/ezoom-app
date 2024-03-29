import 'package:ezoom_todolist/src/modules/tasks/domain/repositories/task_repository.dart';

class DeleteTaskUsecase {
  final TaskRepository taskRepository;
  DeleteTaskUsecase({required this.taskRepository});

  Future<void> call(String id) async {
    return taskRepository.deleteTask(id);
  }
}
