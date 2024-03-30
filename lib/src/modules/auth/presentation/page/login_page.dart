import 'package:design_system/design_system.dart';
import 'package:ezoom_todolist/src/modules/auth/presentation/cubits/login/login_cubit.dart';
import 'package:ezoom_todolist/src/modules/auth/presentation/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            Modular.to.pushReplacementNamed("/tasks");
          }
        },
        builder: (context, state) {
          return const LoginView();
        },
      ),
    );
  }
}
