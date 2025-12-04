import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:new_techblog/component/my_color.dart';
import 'package:new_techblog/component/mystring.dart';
import 'package:new_techblog/component/text_style.dart';
import 'package:new_techblog/controller/home_screen_controller.dart';
import 'package:new_techblog/controller/single_article_screen_controller.dart';
import 'package:new_techblog/gen/assets.gen.dart';
import 'package:new_techblog/models/fake_data.dart';
import 'package:new_techblog/view/article_list_screen.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Obx(
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
          } else {
            return Column(
              children: [
                bannerWidget(),
                SizedBox(
                  height: 50,
                ),
                tagListWidget(),
                seeMoreWidget(),
                blogListWidget(),
                seeMorepodcastWidget(),
                podcastWidget(),
                SizedBox(
                  height: 100,
                )
              ],
            );
          }
        },
      ),
    );
  }

  Widget bannerWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Stack(
        children: [
          Container(
            height: 200,
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: GradientColors.homePosterCoverGradiant,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
              borderRadius: BorderRadius.circular(15),
            ),
            child: CachedNetworkImage(
              imageUrl: controller.bannerModel.value.image!,
              imageBuilder: (context, imageProvider) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(controller.bannerModel.value.image!),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              placeholder: (context, url) => Placeholder(
                child: SpinKitFadingCircle(
                  color: SolidColors.primaryColor,
                  size: 32,
                ),
              ),
              errorWidget: (context, url, error) => Icon(
                Icons.image_not_supported_outlined,
                size: 32,
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            left: 10,
            right: 10,
            child: Text(
              controller.bannerModel.value.title!,
              style: headlineMedium.copyWith(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Widget tagListWidget() {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        itemCount: controller.tagList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            height: 40,
            margin: EdgeInsets.only(left: 10),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(24),
                gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: GradientColors.tags)),
            child: Row(
              children: [
                ImageIcon(
                  Assets.icons.hashTagIcon.image().image,
                  color: Colors.white,
                  size: 16,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  controller.tagList[index].title!,
                  style:
                      headlineSmall.copyWith(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget seeMoreWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      child: InkWell(
        onTap: () {
          Get.toNamed("/articleListView");
        },
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
              MyString.viewHotestBlog,
              style: displaySmall,
            )
          ],
        ),
      ),
    );
  }

  Widget blogListWidget() {
    return Obx(
      () {
        return SizedBox(
          height: 210,
          child: ListView.builder(
            itemCount: controller.articleList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  onTap: () {
                    Get.find<SingleArticleScreenController>()
                        .getData(int.parse(controller.articleList[index].id!));
                  },
                  child: SizedBox(
                    width: 200,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 200,
                              height: 160,
                              foregroundDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: GradientColors.blogPost),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: controller.articleList[index].image!,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                placeholder: (context, url) =>
                                    SpinKitFadingCircle(
                                  color: SolidColors.primaryColor,
                                  size: 32,
                                ),
                                errorWidget: (context, url, error) => Icon(
                                  Icons.image_not_supported_outlined,
                                  size: 32,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 10,
                              right: 10,
                              bottom: 10,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.articleList[index].author??"",
                                    style: displayMedium,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        controller.articleList[index].view!,
                                        style: displayMedium,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        Icons.remove_red_eye_sharp,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          controller.articleList[index].title!,
                          style: headlineMedium,
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget seeMorepodcastWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
            MyString.viewHotestPodCasts,
            style: displaySmall,
          )
        ],
      ),
    );
  }

  Widget podcastWidget() {
    return Obx(() {
      return SizedBox(
        height: 210,
        child: ListView.builder(
          itemCount: controller.podcastList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: 200,
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 160,
                      child: CachedNetworkImage(
                        imageUrl: controller.podcastList[index].poster!,
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                        placeholder: (context, url) => SpinKitFadingCircle(
                          color: SolidColors.primaryColor,
                          size: 32,
                        ),
                        errorWidget: (context, url, error) => Icon(
                          Icons.image_not_supported_outlined,
                          size: 32,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      controller.podcastList[index].title!,
                      style: headlineMedium,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
