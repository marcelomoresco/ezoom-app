import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RegisterAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: kToolbarHeight + 20,
      leading: IconButton(
        onPressed: () => Modular.to.pop(),
        icon: Icon(
          Icons.arrow_back_ios_new,
          color: context.colors.fgDefault,
        ),
      ),
      backgroundColor: context.colors.background,
      centerTitle: true,
      title: const Text(
        "Cadastrar",
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20);
}
