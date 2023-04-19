import 'package:flutter/material.dart';
import 'package:socket_chat_app/pages/users_page.dart';
import 'package:socket_chat_app/routes/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Socket Chat App',
      debugShowCheckedModeBanner: false,
      initialRoute: UsersPage.routeName,
      routes: appRoutes,
    );
  }
}
