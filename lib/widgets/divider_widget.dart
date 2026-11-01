import 'package:flutter/material.dart';
import 'package:new_techblog/widgets/my_color.dart';

class DividerWidget extends StatelessWidget {
  final double size;
  const DividerWidget({
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          thickness: 1,
          indent: size,
          endIndent: size,
          color: SolidColors.dividerColor,
        ),
      ],
    );
  }
}