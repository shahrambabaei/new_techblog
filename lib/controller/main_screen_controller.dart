import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_techblog/view/home_screen.dart';
import 'package:new_techblog/view/profile_screen.dart';
import 'package:new_techblog/view/register_screen.dart';

class MainScreenController extends GetxController {
  RxInt selectedIndex = 0.obs;
  List<Widget> screenList = [
    HomeScreen(),
    RegisterScreen(),
    ProfileScreen(),
  ];
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final Uri url = Uri.parse('https://flutter.dev');
  late TextTheme textTheme;

  @override
  void onInit() {
    super.onInit();
    textTheme = TextTheme.of(Get.context!);
  }
}
