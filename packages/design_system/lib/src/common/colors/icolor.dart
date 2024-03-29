import 'package:flutter/material.dart';

class IColors extends ThemeExtension<IColors> {
  const IColors({
    required this.primary,
    required this.danger,
    required this.sucess,
    required this.warning,
    required this.background,
    required this.fgDefault,
    required this.secodary,
    required this.backgroundSecondary,
  });

  final Color? primary;
  final Color? danger;
  final Color? warning;
  final Color? sucess;
  final Color? background;
  final Color? fgDefault;
  final Color? secodary;
  final Color? backgroundSecondary;
  @override
  IColors copyWith({Color? brandColor, Color? danger}) {
    return IColors(
      primary: primary ?? primary,
      danger: danger ?? this.danger,
      sucess: sucess,
      warning: warning,
      background: null,
      secodary: null,
      fgDefault: null,
      backgroundSecondary: null,
    );
  }

  @override
  IColors lerp(IColors? other, double t) {
    if (other is! IColors) {
      return this;
    }

    return IColors(
      danger: Color.lerp(danger, other.danger, t),
      background: null,
      warning: warning,
      sucess: null,
      secodary: null,
      fgDefault: null,
      primary: null,
      backgroundSecondary: null,
    );
  }
}
