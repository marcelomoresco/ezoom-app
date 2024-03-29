import 'package:design_system/design_system.dart';
import 'package:ezoom_todolist/src/core/mixins/validator_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/subjects.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with ValidatorMixin {
  final _formKey = GlobalKey<FormState>();
  BehaviorSubject<bool> showPassword = BehaviorSubject.seeded(false);
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EzoomTextField(
              labelText: "Username",
              validator: requiredField,
              controller: usernameController,
            ),
            const SizedBox(
              height: 16,
            ),
            StreamBuilder<bool>(
              stream: showPassword,
              builder: (context, snap) {
                return EzoomTextField(
                  labelText: "Senha",
                  obscureText: snap.data ?? true,
                  suffixIcon: snap.data == false
                      ? Icons.visibility_off
                      : Icons.visibility,
                  validator: requiredField,
                  controller: passwordcontroller,
                );
              },
            ),
            const SizedBox(
              height: 32,
            ),
            EzoomButton(
              text: "Entrar",
              onPressed: () {},
            ),
            const SizedBox(
              height: 8,
            ),
            EzoomButton(
              text: "Criar conta",
              onPressed: () {
                Modular.to.pushNamed('/register');
              },
            ),
          ],
        ),
      ),
    );
  }
}
