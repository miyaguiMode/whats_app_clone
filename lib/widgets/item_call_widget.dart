import 'package:flutter/material.dart';

class ItemCallWidget extends StatelessWidget {
  const ItemCallWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 4),
      child: ListTile(
        leading: CircleAvatar(
          radius: 24,
          backgroundImage: NetworkImage(
              'https://images.pexels.com/photos/6599062/pexels-photo-6599062.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load'),
        ),
        title: Text(
          'Juan Manuel Gonzales',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          children: [
            Icon(
              Icons.call_made_rounded,
              color: Color(0xff01C851),
            ),
            SizedBox(width: 4,),
            Text(
              'Ayer a las 11:02 PM',
              style: TextStyle(
                color: Colors.black45,
              ),
            ),
          ],
        ),
        trailing: Icon(
          Icons.call,
          color: Color(0xff01C851),
        ),
      ),
    );
  }
}
