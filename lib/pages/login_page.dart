import 'package:flutter/material.dart';
import 'package:socket_chat_app/widgets/custom_textfield.dart';

import '../widgets/label_widget.dart';
import '../widgets/logo_widget.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            LogoWidget(),
            _FormWidget(),
            LabelsWidget(),
            Text(
              'Terminos y condiciones de uso',
              style: TextStyle(fontWeight: FontWeight.w200),
            ),
          ],
        ),
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget();

  @override
  State<_FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<_FormWidget> {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomTextField(
            prefixIcon: Icons.mail_outline,
            hintText: 'Correo',
            keyboardType: TextInputType.emailAddress,
            controller: emailCtrl,
          ),
          CustomTextField(
            prefixIcon: Icons.lock_outline,
            hintText: 'Contraseña',
            keyboardType: TextInputType.text,
            controller: passwordCtrl,
            isPassword: true,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Ingresar'),
          ),
        ],
      ),
    );
  }
}
