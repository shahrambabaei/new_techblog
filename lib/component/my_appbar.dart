import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_techblog/component/my_color.dart';
import 'package:new_techblog/component/text_style.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MyAppBar({super.key, required this.title});

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(Get.width, Get.height * .09);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 8, 14, 0),
          child: AppBar(
            backgroundColor: Colors.transparent,
            leadingWidth: 40,
            leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                decoration: BoxDecoration(
                    color: SolidColors.primaryColor, shape: BoxShape.circle),
                child: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Colors.white,
                ),
              ),
            ),
            actions: [
              Text(
                title,
                style: appBarTextStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
