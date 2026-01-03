import 'package:get/get.dart';
import 'package:new_techblog/controller/article_list_screen_controller.dart';
import 'package:new_techblog/controller/home_screen_controller.dart';
import 'package:new_techblog/controller/main_screen_controller.dart';
import 'package:new_techblog/controller/register_controller.dart';
import 'package:new_techblog/controller/single_article_screen_controller.dart';
import 'package:new_techblog/controller/splash_screen_controller.dart';

class MyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController(), fenix: true);
    Get.lazyPut(() => RegisterController(), fenix: true);
    Get.lazyPut(() => SingleArticleScreenController(), fenix: true);
    Get.lazyPut(() => ArticleListScreenController(), fenix: true);
  }
}
