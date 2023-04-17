import 'package:flutter/material.dart';
import 'package:socket_chat_app/pages/register_page.dart';
import 'package:socket_chat_app/widgets/custom_textfield.dart';

import '../widgets/blue_button_widget.dart';
import '../widgets/label_widget.dart';
import '../widgets/logo_widget.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * .9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                LogoWidget(title: 'Messenger'),
                _FormWidget(),
                LabelsWidget(
                  route: RegisterPage.routeName,
                  title: '¿No tienes una cuenta?',
                  subtitle: 'Crea una ahora!',
                ),
                Text(
                  'Terminos y condiciones de uso',
                  style: TextStyle(fontWeight: FontWeight.w200),
                ),
              ],
            ),
          ),
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
          BlueButton(
            text: "Ingresar",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
