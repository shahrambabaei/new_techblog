import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_techblog/component/bottomNavigation_widget.dart';
import 'package:new_techblog/component/my_color.dart';
import 'package:new_techblog/controller/main_screen_controller.dart';
import 'package:new_techblog/gen/assets.gen.dart';
import 'package:new_techblog/view/register_screen.dart';
import 'package:new_techblog/view/home_screen.dart';
import 'package:new_techblog/view/profile_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends GetView<MainScreenController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse('https://flutter.dev');
    return Scaffold(
      key: controller.scaffoldKey,
      drawer: Drawer(
        backgroundColor: SolidColors.scaffoldBg,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.white),
                child: Image.asset(
                  Assets.images.logosplash.path,
                  scale: 2,
                ),
              ),
              ListTile(
                title: Text(
                  'پروفایل کاربر',
                  style: controller.textTheme.headlineSmall!
                      .copyWith(color: Colors.black),
                ),
                onTap: () {},
              ),
              Divider(
                color: SolidColors.dividerColor,
              ),
              ListTile(
                title: Text(
                  " درباره تک‌بلاگ",
                  style: controller.textTheme.headlineMedium!
                      .copyWith(color: Colors.black),
                ),
                onTap: () {},
              ),
              Divider(
                color: SolidColors.dividerColor,
              ),
              ListTile(
                title: Text(
                  'اشتراک گذاری تک بلاگ',
                  style: controller.textTheme.headlineSmall!
                      .copyWith(color: Colors.black),
                ),
                onTap: () {

                  // SharePlus.instance.share(
                  //     ShareParams(text: "techBlog", title: "shahram babaei"));
                },
              ),
              Divider(
                color: SolidColors.dividerColor,
              ),
              ListTile(
                title: Text(
                  "تک‌بلاگ در گیت هاب",
                  style: controller.textTheme.headlineSmall!
                      .copyWith(color: Colors.black),
                ),
                onTap: () async {
                  await launchUrl(url);
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            Assets.images.logosplash.path,
            height: 50,
          ),
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                controller.scaffoldKey.currentState!.openDrawer();
              },
              icon: Icon(Icons.menu),
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: Stack(
        children: [
          Obx(
            () {
              return IndexedStack(
                index: controller.selectedIndex.value,
                children: controller.screenList,
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavigation(
              onChannge: (value) {
                controller.selectedIndex.value = value;
              },
            ),
          ),
        ],
      ),
    );
  }
}
