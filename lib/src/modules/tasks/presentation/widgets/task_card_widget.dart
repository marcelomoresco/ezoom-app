import 'package:design_system/design_system.dart';
import 'package:ezoom_todolist/src/core/extensions/string_extension.dart';
import 'package:ezoom_todolist/src/core/widgets/ezoom_modal_confirmation.dart';
import 'package:ezoom_todolist/src/modules/tasks/domain/entities/task.dart';
import 'package:ezoom_todolist/src/modules/tasks/presentation/cubits/task/tasks_cubit.dart';
import 'package:ezoom_todolist/src/modules/tasks/presentation/view/create_edit_task_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TaskCardWidget extends StatelessWidget {
  const TaskCardWidget({
    super.key,
    required this.task,
  });
  final Task task;

  @override
  Widget build(BuildContext context) {
    final tasksCubit = Modular.get<TasksCubit>();
    return Column(
      children: [
        Opacity(
          opacity: task.isDone ? 0.7 : 1,
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: context.colors.secodary,
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: task.isDone,
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_box,
                        color: context.colors.sucess,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          task.title.toCapitalize(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            decoration:
                                task.isDone ? TextDecoration.lineThrough : null,
                            color: context.colors.fgDefault,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          task.description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            decoration:
                                task.isDone ? TextDecoration.lineThrough : null,
                            color: context.colors.fgDefault,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () => showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return CreateEditTaskWidget(
                            task: task,
                            onPressed: (task) {
                              tasksCubit.update(task);
                            },
                          );
                        },
                      ),
                      icon: Icon(
                        Icons.edit,
                        color: context.colors.fgDefault,
                        size: 32,
                      ),
                    ),
                    IconButton(
                      onPressed: () => EzoomModalConfirm.show(
                        context,
                        title: "Tem certeza que quer deletar essa tarefa?",
                        description:
                            "Ao deletar você não conseguirá mais ver ela!",
                        onConfirm: () {
                          tasksCubit.delete(task);
                          Modular.to.maybePop();
                        },
                      ),
                      icon: Icon(
                        Icons.delete,
                        color: context.colors.danger,
                        size: 32,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
