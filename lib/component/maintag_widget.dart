import 'package:flutter/material.dart';

import '../constants/my_color.dart';
import '../gen/assets.gen.dart';
import '../models/fake_data.dart';

class MainTagWidget extends StatelessWidget {
  final TextTheme textTheme;
  final int index;

  const MainTagWidget(
      {required this.textTheme, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(left: 10),
      padding: EdgeInsets.symmetric(horizontal: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: SolidColors.surface, 
          borderRadius: BorderRadius.circular(24),
      ),
      child: Text(
        textAlign: TextAlign.center,
        selectedTags[index].title,
        style: textTheme.headlineSmall!
            .copyWith(color: SolidColors.dividerColor, fontSize: 16),
      ),
    );
  }
}
