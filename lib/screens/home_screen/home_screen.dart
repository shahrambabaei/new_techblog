import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:new_techblog/gen/assets.gen.dart';
import 'package:new_techblog/routes/app_routes.dart';
import 'package:new_techblog/screens/article_list/article_list_screen.dart';
import 'package:new_techblog/screens/article_list/article_list_screen_controller.dart';
import 'package:new_techblog/screens/home_screen/home_screen_controller.dart';
import 'package:new_techblog/screens/single_article/single_article_screen_controller.dart';
import 'package:new_techblog/widgets/my_color.dart';
import 'package:new_techblog/widgets/mystring.dart';
import 'package:new_techblog/widgets/see_more_widget.dart';
import 'package:new_techblog/widgets/text_style.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.isLoading.value) {
          return Container(
            height: Get.height,
            color: SolidColors.lightBackColor,
            child: const Center(
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

        return RefreshIndicator(
          color: SolidColors.primaryColor,
          onRefresh: () async {
            await controller.getDate();
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            child: Container(
              color: SolidColors.lightBackColor,
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  bannerWidget(),
                  const SizedBox(height: 16),
                  tagListWidget(),
                  const SizedBox(height: 20),
                  seeMoreArticleWidget(),
                  const SizedBox(height: 12),
                  blogListWidget(),
                  const SizedBox(height: 20),
                  seeMorepodcastWidget(),
                  const SizedBox(height: 12),
                  podcastWidget(),
                  const SizedBox(height: 200),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget bannerWidget() {
    final poster = controller.bannerModel.value;
    final imageUrl = poster.image ?? '';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Stack(
        children: [
          Container(
            height: 200,
            foregroundDecoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: GradientColors.homePosterCoverGradiant,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: imageUrl.isEmpty
                ? Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  )
                : CachedNetworkImage(
                    imageUrl: imageUrl,
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
                    placeholder: (context, url) => const Center(
                      child: SpinKitFadingCircle(
                        color: SolidColors.primaryColor,
                        size: 32,
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(
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
              poster.title ?? '',
              style: headlineMedium.copyWith(color: Colors.white),
            ),
          ),
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
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final tag = controller.tagList[index];
          return InkWell(
            borderRadius: BorderRadius.circular(24),
            onTap: () {
              final tagId = tag.id;
              if (tagId != null) {
                Get.find<ArticleListScreenController>()
                    .getArticleListWithTagsId(id: tagId);
                Get.to(
                  () => ArticleListScreen(
                    title: tag.title ?? '',
                  ),
                );
              }
            },
            child: Container(
              height: 40,
              margin: const EdgeInsets.only(left: 10),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(24),
                gradient: const LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: GradientColors.tags,
                ),
              ),
              child: Row(
                children: [
                  ImageIcon(
                    Assets.icons.hashTagIcon.image().image,
                    color: Colors.white,
                    size: 14,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    tag.title ?? '',
                    style: headlineSmall.copyWith(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget seeMoreArticleWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SeeMoreWidget(
        title: MyString.viewHotestBlog,
        onTap: () => Get.toNamed(AppRoutes.articleListScreen),
      ),
    );
  }

  Widget blogListWidget() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          controller.articleList.length,
          (index) {
            final article = controller.articleList[index];
            final articleId = article.id;

            return Padding(
              padding: const EdgeInsets.only(left: 15),
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  if (articleId != null) {
                    final parsedId = int.tryParse(articleId);
                    if (parsedId != null) {
                      Get.find<SingleArticleScreenController>()
                          .getData(parsedId);
                    }
                  }
                },
                child: SizedBox(
                  width: 180,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 180,
                            height: 160,
                            foregroundDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: const LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: GradientColors.blogPost,
                              ),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: article.image ?? '',
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              placeholder: (context, url) => const Center(
                                child: SpinKitFadingCircle(
                                  color: SolidColors.primaryColor,
                                  size: 32,
                                ),
                              ),
                              errorWidget: (context, url, error) => const Icon(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    article.author ?? '',
                                    style: displayMedium,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      article.view ?? '0',
                                      style: displayMedium,
                                    ),
                                    const SizedBox(width: 5),
                                    const Icon(
                                      Icons.remove_red_eye_sharp,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        article.title ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: headlineMedium,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget seeMorepodcastWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SeeMoreWidget(
        title: MyString.viewHotestPodCasts,
        onTap: () => Get.toNamed(AppRoutes.podcastListScreen),
      ),
    );
  }

  Widget podcastWidget() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          controller.podcastList.length,
          (index) {
            final podcast = controller.podcastList[index];

            return Padding(
              padding: const EdgeInsets.only(left: 15),
              child: SizedBox(
                width: 180,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 180,
                      height: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: podcast.poster ?? '',
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
                        placeholder: (context, url) => const Center(
                          child: SpinKitFadingCircle(
                            color: SolidColors.primaryColor,
                            size: 32,
                          ),
                        ),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.image_not_supported_outlined,
                          size: 32,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      podcast.title ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: headlineMedium,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
