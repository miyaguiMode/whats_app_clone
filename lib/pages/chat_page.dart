// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_clone_whatsapp/data/data_dummy.dart';
import 'package:flutter_clone_whatsapp/widgets/item_chat_widget.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (BuildContext context, int index){
        return ItemChatWidget(chatModel: chats[index],);
      },
    );
  }
}

