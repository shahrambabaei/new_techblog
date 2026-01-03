import 'package:get/get.dart';

import '../controller/single_article_screen_controller.dart';

class SingleArticleScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SingleArticleScreenController());
  }
}
