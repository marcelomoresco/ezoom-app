import 'package:ezoom_todolist/src/core/widgets/ezoom_toast.dart';
import 'package:ezoom_todolist/src/modules/auth/presentation/cubits/signup/signup_cubit.dart';
import 'package:ezoom_todolist/src/modules/auth/presentation/view/register_view.dart';
import 'package:ezoom_todolist/src/modules/auth/presentation/widgets/register_app_bar.dart';
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
      appBar: const RegisterAppBar(),
      body: BlocConsumer<SignupCubit, SignupState>(
        bloc: Modular.get<SignupCubit>(),
        listener: (context, state) {
          if (state is SignupSuccess) {
            Modular.to.pop();
            EzoomToast.showSuccessToast("Conta registrada com sucesso!");
          }
        },
        builder: (context, state) {
          return const RegisterView();
        },
      ),
    );
  }
}
