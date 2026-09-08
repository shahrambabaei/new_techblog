import 'package:get/get.dart';
import 'package:new_techblog/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 3)).then(
      (value) {
        Get.offAllNamed(AppRoutes.mainScreen);
      },
    );
  }
}
