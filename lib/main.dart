import 'package:flutter/material.dart';
import 'welcome_page.dart';

const d_red = Color(0xFFE9717D);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'MY EPI',
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}
