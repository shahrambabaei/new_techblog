import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 3)).then(
      (value) => Get.toNamed("/articleListView()"),
    );
  }
}
