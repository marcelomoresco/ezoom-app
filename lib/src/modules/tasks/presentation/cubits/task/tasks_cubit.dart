// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:ezoom_todolist/src/modules/tasks/data/usecases/delete_task_usecase.dart';
import 'package:ezoom_todolist/src/modules/tasks/data/usecases/get_task_usecase.dart';
import 'package:ezoom_todolist/src/modules/tasks/data/usecases/get_tasks_usecase.dart';
import 'package:ezoom_todolist/src/modules/tasks/domain/entities/task.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  final GetTaskUsecase getTaskUsecase;
  final GetTasksUsecase getTasksUsecase;
  final DeleteTaskUsecase deleteTaskUsecase;

  TasksCubit({
    required this.getTaskUsecase,
    required this.getTasksUsecase,
    required this.deleteTaskUsecase,
  }) : super(TasksInitial());

  void initial() async {
    emit(TasksLoading());
    final tasks = await getTasksUsecase();
    emit(TasksSucess(tasks));
  }
}
