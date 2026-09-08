import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:new_techblog/screens/register/register_screen_view.dart';
import 'package:new_techblog/screens/home_screen/home_screen.dart';
import 'package:new_techblog/screens/pofile/profile_screen.dart';



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
