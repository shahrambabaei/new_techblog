import 'package:get/get.dart';
import 'package:new_techblog/controller/register_controller.dart';

class RegisterScreenBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(
      () => RegisterController(),
    );
  }
}
