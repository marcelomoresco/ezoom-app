import 'package:design_system/design_system.dart';
import 'package:ezoom_todolist/src/modules/auth/presentation/cubits/signup/signup_cubit.dart';
import 'package:ezoom_todolist/src/modules/auth/presentation/view/register_view.dart';
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
          return const RegisterView();
        },
      ),
    );
  }
}
