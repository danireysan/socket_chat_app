import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  const BlueButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 2,
        backgroundColor: Colors.blue,
        shape: const StadiumBorder(),
      ),
      onPressed: onPressed,
      child: SizedBox(
        height: 55,
        width: double.infinity,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 17,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
