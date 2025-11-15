import 'package:get/get.dart';
import 'package:new_techblog/controller/home_screen_controller.dart';
import 'package:new_techblog/controller/main_screen_controller.dart';
import 'package:new_techblog/controller/splash_screen_controller.dart';

class MyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => MainScreenController(),
    );
    Get.put(
      SplashController(),
    );
    Get.put(
      HomeScreenController(),
    );
  }
}
