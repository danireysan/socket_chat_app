import 'package:flutter/material.dart';

class LabelsWidget extends StatelessWidget {
  const LabelsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          '¿No tienes cuenta?',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 15,
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Crea una ahora!',
          style: TextStyle(
            fontSize: 18,
            color: Colors.blue[600],
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
