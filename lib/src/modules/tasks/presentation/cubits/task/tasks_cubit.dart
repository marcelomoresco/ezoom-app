// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:diacritic/diacritic.dart';
import 'package:ezoom_todolist/src/core/widgets/ezoom_toast.dart';
import 'package:ezoom_todolist/src/modules/tasks/data/usecases/create_task_usecase.dart';
import 'package:ezoom_todolist/src/modules/tasks/data/usecases/update_task_usecase.dart';
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
  final CreateTaskUsecase createTaskUsecase;
  final UpdateTaskUsecase updateTaskUsecase;

  TasksCubit({
    required this.getTaskUsecase,
    required this.getTasksUsecase,
    required this.deleteTaskUsecase,
    required this.createTaskUsecase,
    required this.updateTaskUsecase,
  }) : super(TasksInitial());

  late List<Task> tasks;

  Future<void> initial() async {
    try {
      emit(TasksLoading());
      tasks = await getTasksUsecase();
      emit(TasksSucess(tasks));
    } catch (e) {
      EzoomToast.showErrorToast("Opss...algo deu errado!");
    }
  }

  void create(Task task) async {
    try {
      emit(TasksLoading());
      await createTaskUsecase(task);
      EzoomToast.showSuccessToast("Tarefa criada com sucesso!");
      initial();
    } catch (e) {
      EzoomToast.showErrorToast("Opss...algo deu errado!");
    }
  }

  void update(Task task) async {
    try {
      emit(TasksLoading());
      await updateTaskUsecase(task);
      EzoomToast.showSuccessToast("Tarefa atualizada com sucesso!");
      initial();
    } catch (e) {
      EzoomToast.showErrorToast("Opss...algo deu errado!");
    }
  }

  void delete(Task task) async {
    try {
      emit(TasksLoading());
      await deleteTaskUsecase(task.id!);
      EzoomToast.showSuccessToast("Tarefa deletada com sucesso!");
      initial();
    } catch (e) {
      EzoomToast.showErrorToast("Opss...algo deu errado!");
    }
  }

  void search(String searchText) async {
    searchText = searchText.toLowerCase();
    final filteredTasks = tasks.where(
      (element) {
        final title = removeDiacritics(element.title.toLowerCase());
        final description = removeDiacritics(element.description.toLowerCase());
        final search = removeDiacritics(searchText);
        return title.contains(search) || description.contains(search);
      },
    ).toList();
    emit(TasksSucess(filteredTasks));
  }
}
