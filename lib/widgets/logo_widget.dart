import 'package:flutter/cupertino.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

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
