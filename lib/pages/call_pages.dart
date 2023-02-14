import 'package:flutter/material.dart';
import 'package:flutter_clone_whatsapp/widgets/item_call_widget.dart';

class CallPage extends StatelessWidget {
  const CallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ItemCallWidget(),
          ItemCallWidget(),
          ItemCallWidget(),
          ItemCallWidget(),
          ItemCallWidget(),
        ],
      ),
    );
  }
}

