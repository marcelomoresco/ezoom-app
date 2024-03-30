import 'dart:math';

import 'package:design_system/design_system.dart';
import 'package:ezoom_todolist/src/modules/tasks/presentation/cubits/task/tasks_cubit.dart';
import 'package:ezoom_todolist/src/modules/tasks/presentation/view/create_edit_task_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TasksAppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const TasksAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final tasksCubit = Modular.get<TasksCubit>();
    return AppBar(
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 25);
}
