import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Ezoom Todolist',
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      theme: ThemeData.light(useMaterial3: false).copyWith(
        textTheme: GoogleFonts.ralewayTextTheme(
          ThemeData.light().textTheme,
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16),
            ),
          ),
        ),
        extensions: [
          const IColors(
            primary: Color(0xFF1E86FA),
            danger: Color(0xFFFF0010),
            warning: Color(0xFFFF9A00),
            background: Color(0xFF000000),
            sucess: Color(0XFF009456),
            secodary: Color(0xFF2C2C2C),
            fgDefault: Color(0xFFFFFFFF),
            backgroundSecondary: Color(0xFF1F222A),
          )
        ],
      ),
      builder: (context, widget) {
        SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp],
        );
        return Material(
          child: widget,
        );
      },
    );
  }
}
