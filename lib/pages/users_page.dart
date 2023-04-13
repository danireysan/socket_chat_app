import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget {
  static const routeName = '/users';
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Hola Mundo'),
      ),
    );
  }
}
