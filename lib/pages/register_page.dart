import 'package:flutter/material.dart';
import 'package:socket_chat_app/pages/login_page.dart';
import 'package:socket_chat_app/widgets/custom_textfield.dart';

import '../widgets/blue_button_widget.dart';
import '../widgets/label_widget.dart';
import '../widgets/logo_widget.dart';

class RegisterPage extends StatelessWidget {
  static const routeName = '/register';
  const RegisterPage({super.key});

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
                LogoWidget(title: 'Registro'),
                _FormWidget(),
                LabelsWidget(
                  route: LoginPage.routeName,
                  title: '¿Ya tienes una cuenta?',
                  subtitle: 'Ingresa ahora',
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
  final nameController = TextEditingController();
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
            prefixIcon: Icons.perm_identity,
            hintText: 'Nombre',
            keyboardType: TextInputType.emailAddress,
            controller: nameController,
          ),
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
