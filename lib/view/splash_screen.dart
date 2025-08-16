import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:new_techblog/constants/my_color.dart';
import 'package:new_techblog/gen/assets.gen.dart';
import 'package:new_techblog/view/main_screen.dart';
import 'package:new_techblog/view/profile_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>ProfileScreen(),
          //  MainScreen(),
        )));
  }

  @override
  Widget build(BuildContext context) {
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
