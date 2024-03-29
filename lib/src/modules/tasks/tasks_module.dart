import 'package:ezoom_todolist/src/core/services/client/client_service.dart';
import 'package:ezoom_todolist/src/modules/tasks/data/repositories/task_repository_impl.dart';
import 'package:ezoom_todolist/src/modules/tasks/data/usecases/delete_task_usecase.dart';
import 'package:ezoom_todolist/src/modules/tasks/data/usecases/get_task_usecase.dart';
import 'package:ezoom_todolist/src/modules/tasks/data/usecases/get_tasks_usecase.dart';
import 'package:ezoom_todolist/src/modules/tasks/domain/repositories/task_repository.dart';
import 'package:ezoom_todolist/src/modules/tasks/presentation/cubits/task/tasks_cubit.dart';
import 'package:ezoom_todolist/src/modules/tasks/presentation/page/tasks_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TasksModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<TaskRepository>(
          (i) => TaskRepositoryImpl(
            clientService: i.get<ClientService>(),
          ),
        ),
        Bind<TasksCubit>(
          (i) => TasksCubit(
            getTaskUsecase: GetTaskUsecase(
              taskRepository: i.get<TaskRepository>(),
            ),
            getTasksUsecase: GetTasksUsecase(
              taskRepository: i.get<TaskRepository>(),
            ),
            deleteTaskUsecase: DeleteTaskUsecase(
              taskRepository: i.get<TaskRepository>(),
            ),
          ),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '',
          child: (context, args) {
            return const TasksPage();
          },
          transition: TransitionType.noTransition,
        ),
      ];
}
