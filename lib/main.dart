import 'package:flutter/material.dart';
import 'package:socket_chat_app/pages/loading_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Socket Chat App',
      debugShowCheckedModeBanner: false,
      initialRoute: LoadingPage.routeName,
    );
  }
}
