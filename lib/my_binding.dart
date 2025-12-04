import 'package:get/get.dart';
import 'package:new_techblog/controller/article_list_screen_controller.dart';
import 'package:new_techblog/controller/home_screen_controller.dart';
import 'package:new_techblog/controller/main_screen_controller.dart';
import 'package:new_techblog/controller/single_article_screen_controller.dart';
import 'package:new_techblog/controller/splash_screen_controller.dart';
import 'package:new_techblog/models/single_article_model.dart';

class MyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => MainScreenController(),
    );
    Get.put(
      SplashController(),
    );
    Get.put(
      HomeScreenController(),
    );
    Get.put(
      ArticleListScreenController(),
    );
    Get.put(
      SingleArticleScreenController(),
    );

  }
}
