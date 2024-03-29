import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
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
  }
}
