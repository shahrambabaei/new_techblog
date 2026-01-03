import 'package:get/get.dart';
import '../controller/article_list_screen_controller.dart';

class ArticleListScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ArticleListScreenController(),
    );
  }
}
