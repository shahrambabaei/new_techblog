import 'package:flutter/material.dart';
import 'package:new_techblog/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'techBlog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "dana",
        textTheme: TextTheme(
            headlineMedium: TextStyle(
                fontFamily: "dana", fontWeight: FontWeight.bold, fontSize: 18)),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
