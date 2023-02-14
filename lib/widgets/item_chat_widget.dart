import 'package:flutter/material.dart';
import 'package:flutter_clone_whatsapp/models/chat_model.dart';
import 'package:flutter_clone_whatsapp/pages/chat_detail_page.dart';

class ItemChatWidget extends StatelessWidget {
  ChatModel chatModel;

  ItemChatWidget({super.key, required this.chatModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ChatDetailPage()));
        },
        leading: CircleAvatar(
          backgroundColor: Colors.black12,
          radius: 30,
          backgroundImage: NetworkImage(chatModel.avatarUrl),
        ),
        title: Text(
          chatModel.username,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        subtitle: Text(
          chatModel.isTyping == true ? 'Typing...' : chatModel.message,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w300,
            color:
                chatModel.isTyping == true ? Color(0xff01C851) : Colors.black,
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              chatModel.time,
              style: TextStyle(
                fontSize: 12.0,
                color: chatModel.countMessage > 0 ? Color(0xff01C851) : Colors.black54,
              ),
            ),
            if (chatModel.countMessage > 0)
              Container(
                height: 20,
                width: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xff01C851),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  chatModel.countMessage.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.0,
                  ),
                ),
              )
            else
              SizedBox(),
          ],
        ),
      ),
    );
  }
}
