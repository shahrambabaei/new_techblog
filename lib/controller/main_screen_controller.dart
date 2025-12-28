import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_techblog/view/home_screen.dart';
import 'package:new_techblog/view/post_screen.dart';
import 'package:new_techblog/view/profile_screen.dart';
import 'package:new_techblog/view/register/register_screen.dart';

class MainScreenController extends GetxController {
  RxInt selectedIndex = 0.obs;
  List<Widget> screenList = [
    HomeScreen(),
    RegisterScreen(),
    PostScreen(),
    ProfileScreen(),
  ];
   // GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final Uri url = Uri.parse('https://flutter.dev');

  @override
  void onInit() {
    super.onInit();
  }
}
