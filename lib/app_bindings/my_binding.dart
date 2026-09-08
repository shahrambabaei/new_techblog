import 'package:get/get.dart';
import 'package:new_techblog/screens/home_screen/home_screen_controller.dart';
import 'package:new_techblog/screens/register/register_controller.dart';
import 'package:new_techblog/screens/single_article/single_article_screen_controller.dart';


import '../screens/article_list/article_list_screen_controller.dart';

class MyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController(), fenix: true);
    Get.lazyPut(() => RegisterController(), fenix: true);
    Get.lazyPut(() => SingleArticleScreenController(), fenix: true);
    Get.lazyPut(() => ArticleListScreenController(), fenix: true);
  }
}
