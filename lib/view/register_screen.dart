import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_techblog/constants/my_color.dart';
import 'package:new_techblog/constants/mystring.dart';
import 'package:new_techblog/gen/assets.gen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.images.techbot,
              height: 100,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              MyString.welcome,
              style: textTheme.headlineMedium,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              MyString.welcomeescription,
              style: textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "بزن بریم",
                style: textTheme.displayLarge,
              ),
              style: ButtonStyle(
                  textStyle: WidgetStateTextStyle.resolveWith((state) {
                    if (state.contains(WidgetState.pressed)) {
                      return TextStyle(fontSize: 25, color: Colors.white);
                    }
                    return TextStyle(fontSize: 18, color: Colors.white);
                  }),
                  backgroundColor:
                      WidgetStatePropertyAll(SolidColors.primaryColor)),
            )
          ],
        ),
      ),
    );
  }
}
