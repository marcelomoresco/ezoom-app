import 'dart:math';

import 'package:design_system/design_system.dart';
import 'package:ezoom_todolist/src/modules/tasks/presentation/cubits/task/tasks_cubit.dart';
import 'package:ezoom_todolist/src/modules/tasks/presentation/view/create_edit_task_widget.dart';
import 'package:ezoom_todolist/src/modules/tasks/presentation/view/task_view.dart';
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
      appBar: AppBar(
        toolbarHeight: kToolbarHeight + 25,
        backgroundColor: context.colors.background,
        title: const Text("Tarefas"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.sizeOf(context).height,
                ),
                builder: (context) {
                  return CreateEditTaskWidget(
                    onPressed: (task) {
                      tasksCubit.create(task);
                    },
                  );
                },
              );
            },
          )
        ],
        leading: IconButton(
          onPressed: () => Modular.to.pushReplacementNamed("/login"),
          icon: Transform.rotate(
            angle: pi,
            child: Icon(
              Icons.exit_to_app,
              size: 32,
              color: context.colors.fgDefault,
            ),
          ),
        ),
      ),
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
