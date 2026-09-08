import 'package:get/get.dart';
import 'package:new_techblog/screens/manage_article/manage_article_controller.dart';
import 'package:new_techblog/screens/main_screen/main_screen_controller.dart';

class ManageArticleBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ManageArticleController());
  }
}
