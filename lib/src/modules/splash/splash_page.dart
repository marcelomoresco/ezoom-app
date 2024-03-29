import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4)).then(
      (value) => Modular.to.pushReplacementNamed('/login'),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.1),
        child: Stack(
          children: [
            Center(
              child: Hero(
                tag: 'logoSplashLogin',
                child: Image.asset(
                  "assets/icon/ezoom_logo.jpeg",
                  height: 190,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(
                  strokeCap: StrokeCap.round,
                  strokeWidth: 3,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
