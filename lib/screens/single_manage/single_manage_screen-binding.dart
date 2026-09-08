import 'package:get/get.dart';
import 'package:new_techblog/screens/single_manage/single_manage_article_controller.dart';

class SingleManageScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SingleManageController(),
    );
  }
}
