
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_techblog/constants/my_color.dart';
import 'package:new_techblog/constants/mystring.dart';
import 'package:new_techblog/gen/assets.gen.dart';

import '../models/fake_data.dart';

class MyCatsWidget extends StatefulWidget {
  const MyCatsWidget({super.key});

  @override
  State<MyCatsWidget> createState() => _MyCatsWidgetState();
}

class _MyCatsWidgetState extends State<MyCatsWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                SvgPicture.asset(
                  Assets.images.techbot,
                  height: 100,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  MyString.cats,
                  textAlign: TextAlign.center,
                  style: textTheme.headlineMedium,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "نام ونام خانوادگی",
                        hintStyle: textTheme.headlineSmall),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  MyString.chooseCats,
                  textAlign: TextAlign.center,
                  style: textTheme.headlineSmall,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: SizedBox(
                    height: 85,
                    child: GridView.builder(
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: tagList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                          childAspectRatio: 0.25),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            selectedTags.add(tagList[index]);

                            setState(() {});
                          },
                          child: Container(
                            height: 40,
                            // margin: EdgeInsets.only(left: 10),
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(24),
                                gradient: LinearGradient(
                                    begin: Alignment.centerRight,
                                    end: Alignment.centerLeft,
                                    colors: GradientColors.tags)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ImageIcon(
                                  Assets.icons.hashTagIcon.image().image,
                                  color: Colors.white,
                                  size: 16,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  tagList[index].title,
                                  style: textTheme.headlineSmall!.copyWith(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  Assets.images.downArrow.path,
                  height: 70,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: SizedBox(
                    height: 85,
                    child: GridView.builder(
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: selectedTags.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                          childAspectRatio: 0.2),
                      itemBuilder: (context, index) {
                        return Container(
                          height: 50,
                          margin: EdgeInsets.only(left: 10),
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: SolidColors.surface,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                textAlign: TextAlign.center,
                                selectedTags[index].title,
                                style: textTheme.headlineSmall!.copyWith(
                                    color: SolidColors.dividerColor,
                                    fontSize: 16),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              IconButton(
                                onPressed: () {
                                  selectedTags.removeAt(index);
                                  setState(() {});
                                },
                                icon: Icon(Icons.delete_forever_outlined),
                                color: SolidColors.dividerColor,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
