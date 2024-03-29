import 'package:design_system/design_system.dart';
import 'package:ezoom_todolist/src/modules/auth/presentation/cubits/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colors.background,
        centerTitle: true,
        title: const Text(
          "Login",
        ),
      ),
      body: BlocConsumer<LoginCubit, LoginState>(
        bloc: Modular.get<LoginCubit>(),
        listener: (context, state) {
          if (state is LoginSucess) {
            //REDIRECT TASKS
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const EzoomTextField(
                  labelText: "Username",
                ),
                const SizedBox(
                  height: 16,
                ),
                const EzoomTextField(
                  labelText: "Senha",
                  obscureText: true,
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
          );
        },
      ),
    );
  }
}
