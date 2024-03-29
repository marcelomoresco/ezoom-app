// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ezoom_todolist/src/core/services/client/client_service.dart';
import 'package:ezoom_todolist/src/modules/tasks/domain/repositories/task_repository.dart';
import 'package:ezoom_todolist/src/modules/tasks/domain/entities/task.dart';

class TaskRepositoryImpl implements TaskRepository {
  final ClientService clientService;

  TaskRepositoryImpl({
    required this.clientService,
  });

  @override
  Future<void> createTask(Task task) {
    // TODO: implement createTask
    throw UnimplementedError();
  }

  @override
  Future<List<Task>> findAll() {
    // TODO: implement findAll
    throw UnimplementedError();
  }

  @override
  Future<Task> findById(String id) {
    // TODO: implement findById
    throw UnimplementedError();
  }

  @override
  Future<void> updateTask(Task task) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTask(String id) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }
}
