import 'package:flutter/material.dart';
import 'package:new_techblog/component/my_color.dart';

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