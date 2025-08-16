import 'package:flutter/material.dart';
import 'package:new_techblog/constants/my_color.dart';
import 'package:new_techblog/gen/assets.gen.dart';

class DividerWidget extends StatelessWidget {
  final String text;
  final double size;
  const DividerWidget({
    required this.text,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          thickness: 1.5,
          indent: size,
          endIndent: size,
          color: SolidColors.dividerColor,
          
        ),
       
      ],
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 10,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: GradientColors.bottomNavBackground,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: MediaQuery.of(context).size.height / 8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient:
                  LinearGradient(colors: GradientColors.bottomNav)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: ImageIcon(
                    Assets.icons.user.image().image,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: ImageIcon(
                    Assets.icons.w.image().image,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: ImageIcon(
                    Assets.icons.pen.image().image,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
