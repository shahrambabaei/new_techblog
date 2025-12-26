import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:new_techblog/component/my_color.dart';
import 'package:new_techblog/my_binding.dart';
import 'package:new_techblog/view/article_list_screen.dart';
import 'package:new_techblog/view/article_screen.dart';
import 'package:new_techblog/view/main_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:new_techblog/view/maycats_widget.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
        statusBarColor: SolidColors.statusBarColor,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: SolidColors.systemNavigationBarColor,
        systemNavigationBarIconBrightness: Brightness.dark),
  );
  await GetStorage.init();
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
          name: "/articleListView()",
          page: () => ArticleListScreen(
            title: "مقالات جدید",
          ),
        ),
        GetPage(
          name: "/articleScreen",
          page: () => ArticleScreen(),
        ),
        GetPage(
          name: "/",
          page: () => MainScreen(),
        ),
        GetPage(
          name: "/myCatsWidget",
          page: () => MyCatsWidget(),
        )
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
    );
  }
}
