import 'package:flutter/material.dart';
import 'package:socket_chat_app/widgets/custom_textfield.dart';

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
            _LogoWidget(),
            _FormWidget(),
            _LabelsWidget(),
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

class _LogoWidget extends StatelessWidget {
  const _LogoWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 50),
        width: 170,
        child: Column(
          children: const [
            Image(image: AssetImage('assets/tag-logo.png')),
            SizedBox(height: 20),
            Text('Messenger', style: TextStyle(fontSize: 30))
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
        ],
      ),
    );
  }
}

class _LabelsWidget extends StatelessWidget {
  const _LabelsWidget();

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
