import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_techblog/component/my_color.dart';
import 'package:new_techblog/component/storage_constant.dart';
import 'package:new_techblog/gen/assets.gen.dart';

class BottomNavigation extends StatelessWidget {
  final Function(int index) onChange;

  const BottomNavigation({
    required this.onChange,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: MediaQuery.of(context).size.height / 10,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(colors: GradientColors.bottomNav)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () => onChange(0),
              icon: ImageIcon(
                Assets.icons.user.image().image,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                GetStorage().read(StorageConstant.token) == null
                    ? onChange(1)
                    : onChange(2);
              },
              icon: ImageIcon(
                Assets.icons.w.image().image,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () => onChange(3),
              icon: ImageIcon(
                Assets.icons.pen.image().image,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
