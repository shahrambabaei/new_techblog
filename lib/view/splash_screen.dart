import 'package:flutter/material.dart';
import 'package:new_techblog/gen/assets.gen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          Assets.images.logosplash.path,
          height: 104,
          width: 204,
        ),
      ),
    );
  }
}
