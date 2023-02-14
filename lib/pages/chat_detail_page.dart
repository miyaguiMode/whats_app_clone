import 'package:flutter/material.dart';
import 'package:flutter_clone_whatsapp/data/data_dummy.dart';
import 'package:flutter_clone_whatsapp/models/chat_message_model.dart';

class ChatDetailPage extends StatefulWidget {
  ChatDetailPage({super.key});

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 24,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white10,
              backgroundImage: NetworkImage('https://images.pexels.com/photos/11295165/pexels-photo-11295165.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
            ),
            SizedBox(width: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jimena Lopez',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    'Last seen today 2:20 PM',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white60,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
          IconButton(onPressed: () {}, icon: Icon(Icons.call)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: Stack(
        children: [
          //fondo
          Container(
            color: Colors.black.withOpacity(0.07),
          ),

          //listado de mensajes
          ListView.builder(
            padding: const EdgeInsets.only(bottom: 72,top: 8),
            itemCount: chatsMessageList.length,
            itemBuilder: (BuildContext context, int index) {
              return Align(
                alignment: chatsMessageList[index].messageType == 'me' ? Alignment.topRight : Alignment.topLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 6.0),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: chatsMessageList[index].messageType == 'me' ? Color(0xffE3FFC4) : Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                      topRight: chatsMessageList[index].messageType == 'me' ? Radius.circular(0) : Radius.circular(16),
                      topLeft: chatsMessageList[index].messageType == 'other' ? Radius.circular(0) : Radius.circular(16),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        offset: const Offset(4, 4),
                        blurRadius: 10.0,
                      )
                    ],
                  ),
                  child: Text(
                    chatsMessageList[index].messageContent,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              );
            },
          ),

          //input nuevo mensaje
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Type message',
                        hintStyle: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.black38,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(
                          Icons.sentiment_satisfied_alt,
                          size: 30.0,
                          color: Colors.black45,
                        ),
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.attach_file,
                                size: 30,
                                color: Colors.black45,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.camera_alt,
                                size: 30,
                                color: Colors.black45,
                              ),
                            ),
                            const SizedBox(
                              width: 6.0,
                            ),
                          ],
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      autofocus: true,
                      onChanged: (String value) {
                        setState(() {
                          //_controller.text = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        chatsMessageList.add(ChatMessageModel(messageContent: _controller.text, messageType: 'me'));
                        _controller.text='';
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 16, 185, 163),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
