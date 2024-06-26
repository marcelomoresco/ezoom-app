import 'package:ezoom_todolist/src/modules/tasks/presentation/cubits/task/tasks_cubit.dart';
import 'package:ezoom_todolist/src/modules/tasks/presentation/view/task_view.dart';
import 'package:ezoom_todolist/src/modules/tasks/presentation/widgets/tasks_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  final tasksCubit = Modular.get<TasksCubit>();

  @override
  void initState() {
    tasksCubit.initial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TasksAppbarWidget(),
      body: BlocBuilder<TasksCubit, TasksState>(
        bloc: Modular.get<TasksCubit>(),
        builder: (context, state) {
          if (state is TasksSucess) {
            return TasksView(
              tasks: state.tasks,
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
