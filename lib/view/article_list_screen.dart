import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:new_techblog/component/my_appbar.dart';
import 'package:get/get.dart';
import 'package:new_techblog/component/my_color.dart';
import 'package:new_techblog/component/text_style.dart';
import 'package:new_techblog/controller/article_screen_controller.dart';
import 'package:new_techblog/controller/home_screen_controller.dart';

class ArticleListScreen extends GetView<ArticleScreenController> {
  const ArticleListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(
          title: "لیست مقالات",
        ),
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Obx(() {
            return SizedBox(
              height: Get.height,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.articleList.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: SizedBox(
                      height: 110,
                      child: Row(
                        children: [
                          Container(
                            height: double.infinity,
                            width: 110,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: controller.articleList[index].image!,
                              placeholder: (context, url) => SpinKitFadingCircle(
                                size: 32,
                                color: SolidColors.primaryColor,
                              ),
                              errorWidget: (context, url, error) => Icon(
                                Icons.image_not_supported_outlined,
                                size: 32,
                              ),
                              imageBuilder: (context, imageProvider) => Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    image: DecorationImage(
                                        image: imageProvider, fit: BoxFit.cover)),
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  controller.articleList[index].title!,
                                  style: appBarTextStyle.copyWith(fontSize: 14),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          controller.articleList[index].author ??
                                              "",
                                          style: subTitleStyle1,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5, right: 10),
                                          child: Text(
                                            "بازدید",
                                            style: subTitleStyle1,
                                          ),
                                        ),
                                        Text(
                                          controller.articleList[index].view!,
                                          style: subTitleStyle1,
                                        )
                                      ],
                                    ),
                                    Text(
                                      controller.articleList[index].catName!,
                                      style: subTitleStyle,
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
