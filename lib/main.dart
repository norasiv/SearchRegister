import 'package:flutter/material.dart';
import 'package:flutterproj/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          title: "Flutter Demo",
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xff152D3F),
              brightness: Brightness.light,
          ),
          ),
      home: const HomePage()
    );
  }

}

