import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:new_techblog/component/ArticleTags%20_widget.dart';
import 'package:new_techblog/component/my_color.dart';
import 'package:new_techblog/component/ralated_widget.dart';
import 'package:new_techblog/component/text_style.dart';
import 'package:new_techblog/controller/single_article_screen_controller.dart';
import 'package:new_techblog/gen/assets.gen.dart';

class ArticleScreen extends GetView<SingleArticleScreenController> {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Obx(
        () {
          if (controller.isLoading.value) {
            return SizedBox(
              height: Get.height,
              child: Center(
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
              ),
            );
          }
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: Get.height * .3,
                      width: Get.width,
                      child: CachedNetworkImage(
                        imageUrl:
                            controller.singleArticleModel.value.info!.image!,
                        imageBuilder: (context, imageProvider) => Image(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                        placeholder: (context, url) => SpinKitFadingCircle(
                          size: 32,
                          color: SolidColors.primaryColor,
                        ),
                        errorWidget: (context, url, error) => Image.asset(
                          Assets.images.singlePlaceHolder.path,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: GradientColors.singleAppbarGradiant),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              IconButton(
                                onPressed: () => Get.back(),
                                icon: Icon(
                                  Icons.arrow_back_rounded,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                              Expanded(child: SizedBox()),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.bookmark,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.share,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    controller.singleArticleModel.value.info!.title!,
                    maxLines: 2,
                    style: appBarTextStyle,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      Image.asset(
                        Assets.images.profileAvatar.path,
                        height: 34,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5,
                        ),
                        child: Text(
                          controller.singleArticleModel.value.info!.author ??
                              "",
                          style: TextTheme.of(context).labelLarge,
                        ),
                      ),
                      Text(controller.singleArticleModel.value.info!.createdAt!)
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child:
                      Text(controller.singleArticleModel.value.info!.content!),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ArticleTagsWidget(),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text("نوشته های مرتبط"),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RelatedWidget(),
                )
              ],
            ),
          );
        },
      )),
    );
  }
}
