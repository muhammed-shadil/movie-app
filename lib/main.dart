import 'package:flutter/material.dart';
import 'package:movie_app/view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: Typography.englishLike2014,
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 185, 182, 182)),
      ),
      home: const HomeScreen(),
    );
  }
}
