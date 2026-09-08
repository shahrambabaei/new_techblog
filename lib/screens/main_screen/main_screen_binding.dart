import 'package:get/get.dart';
import 'package:new_techblog/screens/main_screen/main_screen_controller.dart';


class MainScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => MainScreenController(),
    );
  }
}
