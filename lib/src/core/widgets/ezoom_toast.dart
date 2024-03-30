import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class EzoomToast {
  static OverlaySupportEntry? overlaySupportEntry;

  static void showErrorToast(
    String message, {
    Duration messageDuration = const Duration(milliseconds: 4000),
  }) {
    overlaySupportEntry = showOverlayNotification(
      (context) {
        return _toastOverlay(
          context: context,
          message: message,
          duration: messageDuration,
          backgroundColor: context.colors.danger!,
          icon: Icons.info_outline,
          textColor: context.colors.fgDefault!,
        );
      },
      position: NotificationPosition.bottom,
      duration: messageDuration,
    );
  }

  static void showSuccessToast(
    String message, {
    Duration messageDuration = const Duration(milliseconds: 4000),
  }) {
    overlaySupportEntry = showOverlayNotification(
      (context) {
        return _toastOverlay(
          context: context,
          message: message,
          duration: messageDuration,
          backgroundColor: context.colors.sucess!,
          icon: Icons.check_circle_outline,
          textColor: context.colors.fgDefault!,
        );
      },
      position: NotificationPosition.bottom,
      duration: messageDuration,
    );
  }

  static void showWarningToast(
    String message, {
    Duration messageDuration = const Duration(milliseconds: 4000),
  }) {
    overlaySupportEntry = showOverlayNotification(
      (context) {
        return _toastOverlay(
          context: context,
          message: message,
          duration: messageDuration,
          backgroundColor: context.colors.warning!,
          icon: Icons.info_outline,
          textColor: context.colors.fgDefault!,
        );
      },
      position: NotificationPosition.bottom,
      duration: messageDuration,
    );
  }

  static void _closeToast() {
    overlaySupportEntry?.dismiss();
  }

  static Widget _toastOverlay({
    required BuildContext context,
    required String message,
    required Duration duration,
    required Color backgroundColor,
    required IconData icon,
    required Color textColor,
    void Function()? onTap,
  }) {
    return SafeArea(
      child: GestureDetector(
        onVerticalDragEnd: (details) {
          if (details.primaryVelocity == null) return;
          if (details.primaryVelocity == 0) return;
          if (details.primaryVelocity! > 0) {
            _closeToast();
          }
        },
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 32,
            left: 8,
            right: 8,
          ),
          child: Material(
            child: Container(
              padding: const EdgeInsets.only(right: 10),
              width: MediaQuery.sizeOf(context).width,
              height: 55,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12, right: 8),
                          child: Icon(
                            icon,
                            color: textColor,
                            size: 32,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            message,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: textColor,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TweenAnimationBuilder(
                    tween: Tween(begin: 0.0, end: 1.0),
                    duration: duration,
                    builder:
                        (BuildContext context, double value, Widget? child) {
                      return ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                        child: LinearProgressIndicator(
                          value: value,
                          backgroundColor: Colors.transparent,
                          valueColor: AlwaysStoppedAnimation<Color>(textColor),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
