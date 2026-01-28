import 'package:get/get.dart';
import 'package:new_techblog/controller/article/manage_article_controller.dart';
import 'package:new_techblog/controller/main_screen_controller.dart';

class ManageArticleBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ManageArticleController());
  }
}
