import 'package:get/get.dart';
import 'package:new_techblog/screens/main_screen/main_screen_binding.dart';
import 'package:new_techblog/screens/manage_article/manage_article_binding.dart';
import 'package:new_techblog/screens/podcast_list/podcast_list_screen.dart';
import 'package:new_techblog/screens/podcast_list/podcast_list_screen_binding.dart';
import 'package:new_techblog/screens/single_article/single_article_binding.dart';
import 'package:new_techblog/screens/splash/splash_screen.dart';
import 'package:new_techblog/screens/splash/splash_screen_binding.dart';
import 'package:new_techblog/routes/app_routes.dart';
import 'package:new_techblog/screens/single_article/single_article_screen.dart';
import 'package:new_techblog/screens/manage_article/manage_article_screen.dart';

import 'package:new_techblog/screens/main_screen/main_screen_view.dart';
import 'package:new_techblog/widgets/maycats_widget.dart';
import '../screens/article_list/article_list_screen.dart';

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
      page: () => ArticleListScreen(title: "لیست مقاله ها"),
    ),
    GetPage(
        name: AppRoutes.articleScreen,
        page: () => SingleArticleScreen(),
        binding: SingleArticleScreenBinding()),
    GetPage(
      name: AppRoutes.myCatsWidget,
      page: () => MyCatsWidget(),
    ),
    GetPage(
      name: AppRoutes.manageArticleScreen,
      page: () => ManageArticleScreen(),
      binding: ManageArticleBinding(),
    ),
    GetPage(
        name: AppRoutes.podcastListScreen,
        page: () => PodcastListScreen(title: "لیست پادکست ها",),
        binding: PodcastListScreenBinding()),
  ];
}
