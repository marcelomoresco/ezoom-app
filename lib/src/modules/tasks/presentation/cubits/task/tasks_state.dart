part of 'tasks_cubit.dart';

@immutable
sealed class TasksState {}

final class TasksInitial extends TasksState {}

final class TasksSucess extends TasksState {
  final List<Task> tasks;
  TasksSucess(this.tasks);
}

final class TasksError extends TasksState {
  final String message;

  TasksError(this.message);
}

final class TasksLoading extends TasksState {}
