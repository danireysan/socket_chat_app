import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  static const routeName = '/chat';
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue[100],
                  radius: 20,
                  child: const Text('Te', style: TextStyle(fontSize: 12)),
                ),
                const SizedBox(height: 3),
                const Text(
                  'Test User',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Flexible(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                reverse: true,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    child: Text('This is a message $index'),
                  );
                },
              ),
            ),
            const Divider(height: 2),
            Container(
              color: Colors.white30,
              height: 50,
            )
          ],
        ));
  }
}
