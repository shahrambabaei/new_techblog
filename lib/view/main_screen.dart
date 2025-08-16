import 'package:flutter/material.dart';
import 'package:new_techblog/component.dart';
import 'package:new_techblog/constants/my_color.dart';
import 'package:new_techblog/gen/assets.gen.dart';
import 'package:new_techblog/view/home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
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
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              child: Image.asset(
                Assets.images.logosplash.path,
                height: 50,
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
        HomeScreen(textTheme: textTheme),
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavigation(),
          ),
        ],
      ),
    );
  }
}



