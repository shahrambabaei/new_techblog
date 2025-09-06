import 'package:flutter/material.dart';
import 'package:new_techblog/component.dart';
import 'package:new_techblog/constants/my_color.dart';
import 'package:new_techblog/gen/assets.gen.dart';
import 'package:new_techblog/view/register_screen.dart';
import 'package:new_techblog/view/home_screen.dart';
import 'package:new_techblog/view/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List screenList = [HomeScreen(), RegisterScreen(), ProfileScreen()];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    return Scaffold(
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
                Scaffold.of(context).openDrawer();
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
                  style: textTheme.headlineSmall!.copyWith(color: Colors.black),
                ),
                onTap: () {},
              ),
              Divider(
                color: SolidColors.dividerColor,
              ),
              ListTile(
                title: Text(
                  " درباره تک‌بلاگ",
                  style:
                      textTheme.headlineMedium!.copyWith(color: Colors.black),
                ),
                onTap: () {},
              ),
              Divider(
                color: SolidColors.dividerColor,
              ),
              ListTile(
                title: Text(
                  'اشتراک گذاری تک بلاگ',
                  style: textTheme.headlineSmall!.copyWith(color: Colors.black),
                ),
                onTap: () {},
              ),
              Divider(
                color: SolidColors.dividerColor,
              ),
              ListTile(
                title: Text(
                  "تک‌بلاگ در گیت هاب",
                  style: textTheme.headlineSmall!.copyWith(color: Colors.black),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          IndexedStack(
            index: selectedIndex,
            children: [
              HomeScreen(),
              RegisterScreen(),
              ProfileScreen(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavigation(
              onChannge: (value) {
                selectedIndex = value;
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }
}
