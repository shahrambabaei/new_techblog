import 'package:flutter/material.dart';
import 'package:new_techblog/widgets/divider_widget.dart';
import 'package:new_techblog/widgets/my_color.dart';
import 'package:new_techblog/widgets/mystring.dart';
import 'package:new_techblog/widgets/text_style.dart';
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            CircleAvatar(
              radius: 50,
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
                  style: displaySmall,
                )
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              "شهرام بابایی",
              style: headlineMedium,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "shahram.b6996@gmail.com",
              style: headlineMedium,
            ),
            SizedBox(
              height: 50,
            ),
            DividerWidget(
              size: 40,
            ),
            InkWell(
              onTap: () {},
              child: SizedBox(
                height: 50,
                child: Center(
                  child: Text(
                    MyString.myFavBlog,
                    style: headlineMedium1,
                  ),
                ),
              ),
            ),
            DividerWidget(
              size: 40,
            ),
            InkWell(
              onTap: () {},
              child: SizedBox(
                height: 40,
                child: Center(
                  child: Text(MyString.myFavPodcast, style: headlineMedium1),
                ),
              ),
            ),
            DividerWidget(
              size: 40,
            ),
            InkWell(
              onTap: () {},
              child: SizedBox(
                height: 40,
                child: Center(
                  child: Text(
                    MyString.logOut,
                    style: headlineMedium1,
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
