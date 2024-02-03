// ignore_for_file: must_be_immutable

import 'package:chat_app/models/message.dart';
import 'package:chat_app/screens/cubits/chat_cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../reusable component/ChatBubble.dart';
import '../reusable%20component/const.dart';

class ChatScreen extends StatelessWidget {
  String? email;
  List<Message> messagesList = [];
  final _controller = ScrollController();
  TextEditingController controller = TextEditingController();
  ChatScreen({super.key, required this.email});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              logo,
              height: 50,
            ),
            const Text('Chat'),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          BlocConsumer<ChatCubit, ChatState>(
            listener: (context, state) {
              if (state is ChatSuccess) {
                messagesList = state.messages;
              }
            },
            builder: (context, state) {
              return Expanded(
                child: ListView.builder(
                  reverse: true,
                  controller: _controller,
                  itemCount: messagesList.length,
                  itemBuilder: (context, index) {
                    if (messagesList[index].id == email) {
                      return ChatBubble(
                        message: messagesList[index],
                      );
                    } else {
                      return ChatBubbleFriend(
                        message: messagesList[index],
                      );
                    }
                  },
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              controller: controller,
              onFieldSubmitted: (data) {
                if (data.isNotEmpty) {
                  BlocProvider.of<ChatCubit>(context)
                      .sendMessage(message: data, email: '$email');
                }
                controller.clear();
                _controller.animateTo(0,
                    duration: const Duration(microseconds: 500),
                    curve: Curves.easeOut);
              },
              decoration: InputDecoration(
                hintText: 'Send message',
                suffixIcon: const Icon(
                  Icons.send,
                  color: primaryColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: primaryColor,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
