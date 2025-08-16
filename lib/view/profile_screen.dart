import 'package:flutter/material.dart';
import 'package:new_techblog/component.dart';
import 'package:new_techblog/constants/my_color.dart';
import 'package:new_techblog/constants/mystring.dart';
import 'package:new_techblog/gen/assets.gen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
            ),
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage(Assets.images.profile.path),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(
                  Assets.icons.pen.image().image,
                  color: SolidColors.seeMore,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  MyString.imageProfileEdit,
                  style: Theme.of(context).textTheme.displaySmall,
                )
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              "شهرام بابایی",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "shahram.b6996@gmail.com",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              height: 50,
            ),
            DividerWidget(
              text: MyString.myFavBlog,
              size: 50,
            ),
            InkWell(
              onTap: () {},
              child: SizedBox(
                height: 40,
                child: Center(
                  child: Text(
                    MyString.myFavBlog,
                    style: TextTheme.of(context).headlineMedium,
                  ),
                ),
              ),
            ),
            DividerWidget(
              text: MyString.myFavPodcast,
              size: 50,
            ),
            InkWell(
              onTap: () {},
              child: SizedBox(
                height: 40,
                child: Center(
                  child: Text(
                    MyString.myFavBlog,
                    style: TextTheme.of(context).headlineMedium,
                  ),
                ),
              ),
            ),
            DividerWidget(
              text: MyString.logOut,
              size: 50,
            ),
            InkWell(
              onTap: () {},
              child: SizedBox(
                height: 40,
                child: Center(
                  child: Text(
                    MyString.myFavBlog,
                    style: TextTheme.of(context).headlineMedium,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
