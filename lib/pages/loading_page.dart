import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_chat_app/pages/login_page.dart';
import 'package:socket_chat_app/pages/users_page.dart';

import '../services/auth_service.dart';

class LoadingPage extends StatelessWidget {
  static const routeName = '/loading';
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: (context, snapshot) {
          bool hasData = snapshot.hasData;
          if (snapshot.data == true && hasData) {
            return const UsersPage();
          }
          if (snapshot.data == false && hasData) {
            return const LoginPage();
          }

          return const Center(
            child: Text('Espere...'),
          );
        },
      ),
    );
  }

  Future<bool> checkLoginState(BuildContext context) async {
    final authService = Provider.of<AuthService>(context, listen: false);
    final autenticado = await authService.isLoggedIn();

    return autenticado;
  }
}
