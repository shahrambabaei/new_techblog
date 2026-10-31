import 'package:get/get.dart';
import 'package:new_techblog/screens/manage_article/manage_article_controller.dart';

class ManageArticleBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ManageArticleController());
  }
}
