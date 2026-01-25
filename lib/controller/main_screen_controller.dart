import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_techblog/view/main_screen/home_screen.dart';
import 'package:new_techblog/view/register/register_screen.dart';

import '../view/main_screen/profile_screen.dart';

class MainScreenController extends GetxController {
  RxInt selectedIndex = 0.obs;
  List<Widget> screenList = [
    HomeScreen(),
    RegisterScreen(),
    ProfileScreen(),
  ];
// GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
// final Uri url = Uri.parse('https://flutter.dev');
}
