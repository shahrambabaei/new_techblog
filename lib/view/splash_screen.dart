import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:new_techblog/component/my_color.dart';
import 'package:new_techblog/controller/splash_screen_controller.dart';
import 'package:new_techblog/gen/assets.gen.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<SplashController>();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.images.logosplash.path,
              height: 100,
            ),
            SizedBox(
              height: 40,
            ),
            SpinKitFadingCube(
              color: SolidColors.primaryColor,
              size: 32.0,
            )
          ],
        ),
      ),
    );
  }
}
