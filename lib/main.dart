import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_techblog/constants/my_color.dart';
import 'package:new_techblog/view/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
        statusBarColor: SolidColors.statusBarColor,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: SolidColors.systemNavigationBarColor,
        systemNavigationBarIconBrightness: Brightness.dark),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'techBlog',
      localizationsDelegates: [
       
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('fa'), // farsi
      ],
      debugShowCheckedModeBanner: false,
      locale: Locale("fa",''),
      theme: ThemeData(
        fontFamily: "dana",
        textTheme: TextTheme(
            headlineMedium: TextStyle(
                fontFamily: "dana", fontWeight: FontWeight.bold, fontSize: 18),
                ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
