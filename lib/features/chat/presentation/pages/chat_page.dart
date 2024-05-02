import 'package:flutter/material.dart';
import 'package:furnika/core/common/widgets/custom_app_bar.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: 'Chat',
        context: context,
      ),
      body: Text('Chat screen'),
    );
  }
}
