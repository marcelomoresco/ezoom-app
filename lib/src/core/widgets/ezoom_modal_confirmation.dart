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
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 4),
                child: Text(
                  title,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: context.colors.primary,
                    fontSize: 28,
                  ),
                ),
              ),
              Text(
                description,
                textAlign: TextAlign.start,
                style:
                    TextStyle(color: context.colors.background, fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 16),
                child: Column(
                  children: [
                    EzoomButton(
                      onPressed: onConfirm,
                      text: "Confirmar",
                      backgroundColor: context.colors.sucess,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    EzoomButton(
                      onPressed: onCancel ?? () => Modular.to.maybePop(),
                      text: "Cancelar",
                      backgroundColor: context.colors.danger,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
