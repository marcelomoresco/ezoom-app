import 'package:flutter/material.dart';

class EzoomErrorPage extends StatelessWidget {
  const EzoomErrorPage({
    super.key,
    this.color = Colors.white,
  });
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.error,
            radius: 28,
            child: Icon(
              Icons.info_outline,
              color: color,
              size: 32,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              "Algo deu errado!",
              style: TextStyle(
                color: color,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            "Algo deu errado, entre em contato com o suporte",
            style: TextStyle(
              color: color,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
