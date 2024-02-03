// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

import '../models/message.dart';
import 'const.dart';

class ChatBubble extends StatelessWidget {
   const ChatBubble({
    super.key,
    required this.message,
  });
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              topLeft: Radius.circular(32)),
          color: primaryColor,
        ),
        child: Text(
          message.message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}


class ChatBubbleFriend extends StatelessWidget {
   const ChatBubbleFriend({
    super.key,
    required this.message,
  });
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(32),
              topRight: Radius.circular(32),
              topLeft: Radius.circular(32)),
          color: Color(0xff006D84),
        ),
        child: Text(
          message.message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
