import 'package:flutter/material.dart';
import 'package:flutter_clone_whatsapp/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp Clone',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color(0xff128C7E),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Color(0xff01C851),),
      ),
    );
  }
}
