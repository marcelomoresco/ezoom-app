import 'package:design_system/design_system.dart';
import 'package:ezoom_todolist/src/core/mixins/validator_mixin.dart';
import 'package:ezoom_todolist/src/modules/auth/domain/entities/user.dart';
import 'package:ezoom_todolist/src/modules/auth/presentation/cubits/signup/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/subjects.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> with ValidatorMixin {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  BehaviorSubject<bool> showPassword = BehaviorSubject.seeded(false);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          const SizedBox(
            height: 64,
          ),
          const Text(
            "Crie sua conta",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          const SizedBox(
            height: 64,
          ),
          EzoomTextField(
            labelText: "E-mail",
            controller: emailController,
            validator: validateEmail,
            onChanged: (value) => setState(() {}),
          ),
          const SizedBox(
            height: 16,
          ),
          EzoomTextField(
            labelText: "Username",
            controller: usernameController,
            validator: requiredField,
            onChanged: (value) => setState(() {}),
          ),
          const SizedBox(
            height: 16,
          ),
          StreamBuilder<bool>(
              stream: showPassword,
              builder: (context, password) {
                return EzoomTextField(
                  labelText: "Senha",
                  obscureText: password.data ?? false,
                  controller: passwordController,
                  validator: requiredField,
                  onChanged: (value) => setState(() {}),
                  suffixIcon: password.data == false
                      ? Icons.visibility_off
                      : Icons.visibility,
                  onPressedSuffix: () {
                    showPassword.add(!password.data!);
                  },
                );
              }),
          const SizedBox(
            height: 32,
          ),
          EzoomButton(
            text: "Cadastrar",
            onPressed: isValid()
                ? () {
                    final user = User(
                      username: usernameController.text,
                      password: passwordController.text,
                      email: emailController.text,
                    );
                    Modular.get<SignupCubit>().register(user);
                  }
                : null,
          ),
        ],
      ),
    );
  }

  bool isValid() {
    if (usernameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      return true;
    }
    return false;
  }
}
