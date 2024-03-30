// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/subjects.dart';

import 'package:ezoom_todolist/src/modules/tasks/domain/entities/task.dart';

class CreateEditTaskWidget extends StatefulWidget {
  const CreateEditTaskWidget({
    super.key,
    this.task,
    required this.onPressed,
  });
  final Task? task;
  final Function(Task) onPressed;

  @override
  State<CreateEditTaskWidget> createState() => _CreateEditTaskWidgetState();
}

class _CreateEditTaskWidgetState extends State<CreateEditTaskWidget> {
  late BehaviorSubject<String> title;
  late BehaviorSubject<String> description;
  late BehaviorSubject<bool> isDone;

  @override
  void initState() {
    title = BehaviorSubject.seeded(widget.task?.title ?? '');
    description = BehaviorSubject.seeded(widget.task?.description ?? '');
    isDone = BehaviorSubject.seeded(widget.task?.isDone ?? false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 16,
              ),
              Center(
                child: Text(
                  widget.task != null ? "Editar tarefa" : 'Criar tarefa',
                  style: TextStyle(
                    color: context.colors.background,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              EzoomTextField(
                initialValue: title.value,
                labelText: "Titíulo",
                onChanged: (value) {
                  title.add(value);
                },
              ),
              const SizedBox(
                height: 16,
              ),
              EzoomTextField(
                initialValue: description.value,
                labelText: "Descrição",
                onChanged: (value) {
                  description.add(value);
                },
              ),
              const SizedBox(
                height: 16,
              ),
              EzoomCheckboxText(
                initialValue: isDone.value,
                title: "Já foi finalizado?",
                onTap: (value) {
                  isDone.add(value);
                },
              ),
              const SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: StreamBuilder<String>(
                    stream: title,
                    builder: (context, title) {
                      return StreamBuilder<String>(
                          stream: description,
                          builder: (context, description) {
                            return EzoomButton(
                              onPressed: isValid(
                                      title.data ?? '', description.data ?? '')
                                  ? () {
                                      widget.onPressed(
                                        Task(
                                          id: widget.task?.id,
                                          title: title.data!,
                                          description: description.data!,
                                          isDone: isDone.value,
                                        ),
                                      );
                                      Modular.to.maybePop();
                                    }
                                  : null,
                              text: labelButton,
                            );
                          });
                    }),
              ),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isValid(String title, String descrption) {
    if (title.isNotEmpty && descrption.isNotEmpty) {
      return true;
    }
    return false;
  }

  String get labelButton => widget.task?.id != null ? "Editar" : "Criar";
}
