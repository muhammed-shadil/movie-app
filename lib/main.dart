import 'package:flutter/material.dart';
import 'package:movie_app/controller/movie_details_provider.dart';
import 'package:movie_app/controller/movie_provider.dart';
import 'package:movie_app/view/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MovieProvider()),
        ChangeNotifierProvider(create: (_) => MovieDetailsProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: Typography.englishLike2014,
        iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 185, 182, 182)),
      ),
      home: const HomeScreen(),
    );
  }
}
