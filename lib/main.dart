import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:new_techblog/component/api_constant.dart';
import 'package:new_techblog/component/my_color.dart';
import 'package:new_techblog/my_binding.dart';
import 'package:new_techblog/services/dio_service.dart';
import 'package:new_techblog/view/main_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:new_techblog/view/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
    return GetMaterialApp(
      initialBinding: MyBinding(),
      getPages: [
        GetPage(
          name: "/mainScreen",
          page: () => MainScreen(),
        ),
        GetPage(
          name: "/",
          page: () => SplashScreen(),
        ),
      ],
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
      locale: Locale("fa", ''),
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
            hintStyle: Theme.of(context).textTheme.headlineSmall,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(width: 2))),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                textStyle: WidgetStateTextStyle.resolveWith((state) {
                  if (state.contains(WidgetState.pressed)) {
                    return TextStyle(fontSize: 25, color: Colors.white);
                  }
                  return TextStyle(fontSize: 18, color: Colors.white);
                }),
                backgroundColor:
                    WidgetStatePropertyAll(SolidColors.primaryColor))),
        fontFamily: "dana",
        textTheme: TextTheme(
          displayLarge: TextStyle(
              fontFamily: 'dana',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: SolidColors.posterTitle),
          titleMedium: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: SolidColors.posterSubTitle),
          bodyLarge: TextStyle(
              fontFamily: 'dana', fontSize: 13, fontWeight: FontWeight.w300),
          displayMedium: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w300),
          displaySmall: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              color: SolidColors.seeMore,
              fontWeight: FontWeight.w700),
          headlineMedium: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              color: Color.fromARGB(255, 70, 70, 70),
              fontWeight: FontWeight.w700),
          headlineSmall: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              color: SolidColors.hintText,
              fontWeight: FontWeight.w700),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
    );
  }
}
