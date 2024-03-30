import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EzoomModalConfirm {
  static Future<bool?> show(
    BuildContext context, {
    required String title,
    required String description,
    required void Function() onConfirm,
    void Function()? onCancel,
    Color backgroundColor = Colors.white,
  }) async {
    return showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      backgroundColor: backgroundColor,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height,
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 8,
              ),
              Text(
                title,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: context.colors.secodary,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                description,
                textAlign: TextAlign.start,
                style:
                    TextStyle(color: context.colors.background, fontSize: 20),
              ),
              const SizedBox(
                height: 24,
              ),
              Column(
                children: [
                  EzoomButton(
                    onPressed: onConfirm,
                    text: "Confirmar",
                    backgroundColor: context.colors.sucess,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextButton(
                    onPressed: onCancel ?? () => Modular.to.maybePop(),
                    child: Text(
                      "Cancelar",
                      style: TextStyle(
                        color: context.colors.danger,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
