import 'package:get/get.dart';
import 'package:new_techblog/screens/register/register_controller.dart';

class RegisterScreenBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(
      () => RegisterController(),
    );
  }
}
