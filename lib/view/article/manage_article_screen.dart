import 'package:cached_network_image/cached_network_image.dart'
    show CachedNetworkImage;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart' show SpinKitFadingCircle;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart' show GetStorage;
import 'package:new_techblog/component/my_appbar.dart';
import 'package:new_techblog/component/mystring.dart';
import 'package:new_techblog/component/text_style.dart';
import 'package:new_techblog/controller/article/manage_article_controller.dart';
import 'package:new_techblog/controller/register_controller.dart';
import 'package:new_techblog/gen/assets.gen.dart';

import '../../component/my_color.dart';

class ManageArticleScreen extends StatelessWidget {
  ManageArticleScreen({super.key});

  final articleManageController = Get.find<ManageArticleController>();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: MyAppBar(title: "مدیریت مقاله ها"),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Obx(
          () {
            if (articleManageController.isLaoding.value) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SpinKitFadingCircle(
                      color: SolidColors.primaryColor,
                      size: 32,
                    ),
                    SizedBox(height: 16),
                    Text('در حال بارگذاری...'),
                  ],
                ),
              );
            } else {
              if (articleManageController.articleList.isNotEmpty) {
                return SizedBox(
                  height: Get.height,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: articleManageController.articleList.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: InkWell(
                          onTap: () {
                            // articleManageController.getData(
                            //   int.parse(controller.articleList[index].id!),
                            // );
                          },
                          child: SizedBox(
                            height: 110,
                            key: Key(
                                articleManageController.articleList[index].id ??
                                    'default_$index'),
                            child: Row(
                              children: [
                                Container(
                                  height: double.infinity,
                                  width: 110,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: articleManageController
                                        .articleList[index].image!,
                                    placeholder: (context, url) =>
                                        SpinKitFadingCircle(
                                      size: 32,
                                      color: SolidColors.primaryColor,
                                    ),
                                    errorWidget: (context, url, error) => Icon(
                                      Icons.image_not_supported_outlined,
                                      size: 32,
                                    ),
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover)),
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
                                        articleManageController
                                            .articleList[index].title!,
                                        style: appBarTextStyle.copyWith(
                                            fontSize: 14),
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
                                                articleManageController
                                                        .articleList[index]
                                                        .author ??
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
                                                articleManageController
                                                    .articleList[index].view!,
                                                style: subTitleStyle1,
                                              )
                                            ],
                                          ),
                                          Text(
                                            articleManageController
                                                .articleList[index].catName!,
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
                  ),
                );
              }
              return emptyArticle();
            }
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            fixedSize: Size(Get.width, 56),
          ),
          child: Text(
            "بریم برای نوشتن یک مقاله باحال",
            style: displayMedium.copyWith(fontSize: 14, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget emptyArticle() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
          ),
          SvgPicture.asset(
            Assets.images.articleEmpty,
            height: 100,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            MyString.articleEmpty,
            style: headlineMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 200,
          ),
        ],
      ),
    );
  }
}
