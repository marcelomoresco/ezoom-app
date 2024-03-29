import 'package:ezoom_todolist/src/modules/tasks/domain/entities/task.dart';
import 'package:ezoom_todolist/src/modules/tasks/domain/repositories/task_repository.dart';

class GetTaskUsecase {
  final TaskRepository taskRepository;

  GetTaskUsecase({required this.taskRepository});

  Future<Task> call(String id) async {
    return taskRepository.findById(id);
  }
}
