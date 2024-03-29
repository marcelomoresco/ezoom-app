import 'package:design_system/design_system.dart';
import 'package:ezoom_todolist/src/modules/auth/presentation/cubits/signup/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: BlocConsumer<SignupCubit, SignupState>(
        bloc: Modular.get<SignupCubit>(),
        listener: (context, state) {
          if (state is SignupSuccess) {
            //REDIRECT TASKS
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
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
                const EzoomTextField(
                  labelText: "E-mail",
                ),
                const SizedBox(
                  height: 16,
                ),
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
                  text: "Cadastrar",
                  onPressed: () {},
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
