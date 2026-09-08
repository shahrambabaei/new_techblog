import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_techblog/widgets/text_style.dart';
import 'package:new_techblog/routes/app_routes.dart' show AppRoutes;
import '../gen/assets.gen.dart';
import 'my_color.dart';


class SeeMoreWidget extends StatelessWidget {
  final String title;
  final Function() onTap;

  const SeeMoreWidget({super.key, required this.title,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.pen.image().image,
            color: SolidColors.seeMore,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: displaySmall,
          )
        ],
      ),
    );
  }
}
