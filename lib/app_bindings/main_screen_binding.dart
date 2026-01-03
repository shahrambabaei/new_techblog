import 'package:get/get.dart';
import 'package:new_techblog/controller/main_screen_controller.dart';


class MainScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => MainScreenController(),
    );
  }
}
