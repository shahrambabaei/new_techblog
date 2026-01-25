import 'package:get/get.dart';
import 'package:new_techblog/controller/main_screen_controller.dart';

class ManageArticleBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () {
        MainScreenController();
      },
    );
  }
}
