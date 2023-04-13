import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

class _FormWidget extends StatelessWidget {
  const _FormWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextField(),
        const TextField(),
        ElevatedButton(onPressed: () {}, child: const Text('Ingresar')),
      ],
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
