import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:new_techblog/component/mystring.dart';
import 'package:new_techblog/component/text_style.dart';
import 'package:new_techblog/controller/register_controller.dart';
import 'package:new_techblog/gen/assets.gen.dart';
import 'package:new_techblog/view/maycats_widget.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
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
              style: headlineMedium,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              MyString.welcomeescription,
              style: headlineMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: () {
                _showEmailBottomSheet(context, textTheme);
              },
              child: Text(
                "بزن بریم",
                style: displayLarge,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> _showEmailBottomSheet(
      BuildContext context, TextTheme textTheme) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Form(
              // key:,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    MyString.insertYourEmail,
                    style: headlineMedium,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    child: TextFormField(
                      controller: controller.emailEditingController,
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.ltr,
                      decoration: InputDecoration(
                          hintText: "example@gmail.com",
                          hintStyle: textTheme.headlineSmall,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'لطفا این فیلد را پر کنید';
                        }
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                          return 'ایمیل معتبر وارد کنید';
                        }
                        return null;
                      },
                      onChanged: (value) {},
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        controller.register();
                        Get.back();
                        _activateCodeBottomSheet(context, textTheme);
                      },
                      child: Text(
                        "ادامه",
                      ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> _activateCodeBottomSheet(
      BuildContext context, TextTheme textTheme) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  MyString.activateCode,
                  style: headlineMedium,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  child: TextFormField(
                    controller: controller.activeCodeEditingController,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                    decoration: InputDecoration(
                      hintText: "*****",
                    ),
                    onChanged: (value) {},
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {
                      controller.verify();
                    },
                    child: Text(
                      "ادامه",
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
