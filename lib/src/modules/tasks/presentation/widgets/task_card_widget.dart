import 'package:design_system/design_system.dart';
import 'package:ezoom_todolist/src/core/widgets/ezoom_modal_confirmation.dart';
import 'package:ezoom_todolist/src/modules/tasks/domain/entities/task.dart';
import 'package:ezoom_todolist/src/modules/tasks/presentation/cubits/task/tasks_cubit.dart';
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
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: context.colors.background,
      ),
      child: Row(
        children: [
          const Column(
            children: [
              Text("Titulo"),
              Text("Descriçao"),
            ],
          ),
          IconButton(
            onPressed: () => EzoomModalConfirm.show(
              context,
              title: "Tem certeza que quer deletar essa tarefa?",
              description: "Ao deletar você não conseguirá mais ver ela!",
              onConfirm: () {
                Modular.get<TasksCubit>().delete(task);
                Modular.to.maybePop();
              },
            ),
            icon: const Icon(Icons.delete),
          )
        ],
      ),
    );
  }
}
