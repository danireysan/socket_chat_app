import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_chat_app/pages/loading_page.dart';
import 'package:socket_chat_app/pages/login_page.dart';
import 'package:socket_chat_app/routes/routes.dart';
import 'package:socket_chat_app/services/auth_service.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: MaterialApp(
        title: 'Socket Chat App',
        debugShowCheckedModeBanner: false,
        initialRoute: LoadingPage.routeName,
        routes: appRoutes,
      ),
    );
  }
}
