import 'package:design_system/design_system.dart';
import 'package:ezoom_todolist/src/modules/tasks/domain/entities/task.dart';
import 'package:ezoom_todolist/src/modules/tasks/presentation/cubits/task/tasks_cubit.dart';
import 'package:ezoom_todolist/src/modules/tasks/presentation/view/create_edit_task_widget.dart';
import 'package:ezoom_todolist/src/modules/tasks/presentation/widgets/empty_tasks_widget.dart';
import 'package:ezoom_todolist/src/modules/tasks/presentation/widgets/task_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TasksView extends StatefulWidget {
  const TasksView({
    super.key,
    required this.tasks,
  });
  final List<Task> tasks;

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  final tasksCubit = Modular.get<TasksCubit>();

  @override
  Widget build(BuildContext context) {
    if (widget.tasks.isEmpty) {
      return RefreshIndicator(
        onRefresh: () => tasksCubit.initial(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmptyTaskWidget(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return CreateEditTaskWidget(
                        onPressed: (task) {
                          tasksCubit.create(task);
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          const EzoomTextField(
            labelText: "Pesquisar por...",
            suffixIcon: Icons.search,
          ),
          const SizedBox(
            height: 16,
          ),
          Flexible(
            child: ListView.builder(
              itemCount: widget.tasks.length,
              itemBuilder: (context, index) {
                final item = widget.tasks[index];
                return TaskCardWidget(task: item);
              },
            ),
          ),
        ],
      ),
    );
  }
}
