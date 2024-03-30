import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class EmptyTaskWidget extends StatelessWidget {
  const EmptyTaskWidget({
    super.key,
    required this.onPressed,
  });
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 331,
        decoration: BoxDecoration(
          color: context.colors.backgroundSecondary!.withAlpha(120),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nenhuma tarefa encontrada",
              style: TextStyle(
                fontSize: 24,
                color: context.colors.fgDefault,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Você não possui nenhuma tarefa, mas pode criar clicando abaixo",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: context.colors.fgDefault,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            EzoomButton(
              onPressed: onPressed,
              text: "Criar",
            )
          ],
        ),
      ),
    );
  }
}
