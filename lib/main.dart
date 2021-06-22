import 'package:flutter/material.dart';
import 'package:movie_review_app/views/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Review',
      theme: ThemeData(
        fontFamily: "Comfortaa",
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
