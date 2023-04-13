import 'package:flutter/material.dart';
import 'package:socket_chat_app/pages/chat_page.dart';
import 'package:socket_chat_app/pages/loading_page.dart';
import 'package:socket_chat_app/pages/login_page.dart';
import 'package:socket_chat_app/pages/register_page.dart';
import 'package:socket_chat_app/pages/users_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  LoadingPage.routeName: (_) => const LoadingPage(),
  LoginPage.routeName: (_) => const LoginPage(),
  RegisterPage.routeName: (_) => const RegisterPage(),
  ChatPage.routeName: (_) => const ChatPage(),
  UsersPage.routeName: (_) => const UsersPage(),
};
