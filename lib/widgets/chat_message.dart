import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({super.key, required this.text, required this.uid});
  final String text;
  final String uid;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: uid == '123' ? _myMessage() : _notMyMessage(),
    );
  }

  _myMessage() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Color(0xff4D9EF6),
        ),
        child: Text(text),
      ),
    );
  }

  _notMyMessage() {
    return Container();
  }
}
