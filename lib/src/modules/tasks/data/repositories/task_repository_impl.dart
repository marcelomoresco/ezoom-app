// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ezoom_todolist/src/core/services/client/client_service.dart';
import 'package:ezoom_todolist/src/core/services/client/dtos/client_request.dart';
import 'package:ezoom_todolist/src/modules/tasks/consts/task_endpoints.dart';
import 'package:ezoom_todolist/src/modules/tasks/domain/repositories/task_repository.dart';
import 'package:ezoom_todolist/src/modules/tasks/domain/entities/task.dart';

class TaskRepositoryImpl implements TaskRepository {
  final ClientService clientService;

  TaskRepositoryImpl({
    required this.clientService,
  });

  @override
  Future<void> createTask(Task task) async {
    await clientService.post(
      ClientRequest(
        path: TaskEndpoints.create,
        data: task.toJson(),
      ),
    );
  }

  @override
  Future<List<Task>> findAll() async {
    final response = await clientService.get(
      const ClientRequest(
        path: TaskEndpoints.get,
      ),
    );
    final result = response.body as List;
    return result.map((e) => Task.fromJson(e)).toList();
  }

  @override
  Future<Task> findById(String id) async {
    final response = await clientService.get(
      ClientRequest(
        path: TaskEndpoints.findById(id),
      ),
    );

    return Task.fromJson(response.body);
  }

  @override
  Future<void> updateTask(Task task) async {
    await clientService.put(
      ClientRequest(
        path: TaskEndpoints.update(task.id!),
        data: task.toJson(),
      ),
    );
  }

  @override
  Future<void> deleteTask(String id) async {
    await clientService.post(
      ClientRequest(
        path: TaskEndpoints.delete(id),
      ),
    );
  }
}
