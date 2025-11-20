import 'package:flutter/material.dart';
import 'package:new_techblog/component/divider_widget.dart';
import 'package:new_techblog/component/my_color.dart';
import 'package:new_techblog/component/mystring.dart';
import 'package:new_techblog/component/text_style.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
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
                style:headlineMedium
,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "shahram.b6996@gmail.com",
                style:headlineMedium
,
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
      ),
    );
  }
}
