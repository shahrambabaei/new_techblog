import 'package:get/get.dart';
import 'package:new_techblog/app_bindings/articlelist_screen_binding.dart';
import 'package:new_techblog/app_bindings/main_screen_binding.dart';
import 'package:new_techblog/app_bindings/single_article_binding.dart';
import 'package:new_techblog/app_bindings/splash_screen_binding.dart';
import 'package:new_techblog/routes/app_routes.dart';
import 'package:new_techblog/view/article_list_screen.dart';
import 'package:new_techblog/view/article_screen.dart';
import 'package:new_techblog/view/main_screen.dart';
import 'package:new_techblog/view/maycats_widget.dart';
import 'package:new_techblog/view/splash_screen.dart';

class AppPage {
  static final appPage = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => SplashScreen(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.mainScreen,
      page: () => MainScreen(),
      binding: MainScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.articleListScreen,
      page: () => ArticleListScreen(title: "مقالات جدید"),
    ),
    GetPage(
        name: AppRoutes.articleScreen,
        page: () => ArticleScreen(),
        binding: SingleArticleScreenBinding()),
    GetPage(
      name: AppRoutes.myCatsWidget,
      page: () => MyCatsWidget(),
    ),
  ];
}
