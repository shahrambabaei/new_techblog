import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:new_techblog/component/my_color.dart';
import 'package:new_techblog/component/text_style.dart';
import 'package:new_techblog/controller/single_article_screen_controller.dart';
import 'package:new_techblog/models/single_article_model.dart';

class RelatedWidget extends StatelessWidget {
  const RelatedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SingleArticleScreenController>(
      builder: (controller) {
        return SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.singleArticleModel.related!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 20),
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
                              borderRadius: BorderRadius.circular(12),
                              // gradient: LinearGradient(
                              //     colors: GradientColors.tags,
                              //     begin: Alignment.bottomCenter,
                              //     end: Alignment.topCenter
                              // ),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: controller
                                  .singleArticleModel.related![index].image!,
                              imageBuilder: (context, imageProvider) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover),
                                  ),
                                );
                              },
                              placeholder: (context, url) =>
                                  SpinKitFadingCircle(
                                color: SolidColors.primaryColor,
                                size: 32,
                              ),
                              errorWidget: (context, url, error) => Icon(
                                Icons.image_not_supported_outlined,
                                size: 32,
                              ),
                              fit: BoxFit.cover,
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
                                    controller.singleArticleModel
                                        .related![index].author??"",
                                    style: displayMedium,
                                  ),
                                  Text(
                                      controller.singleArticleModel
                                          .related![index].view??"",
                                      style: displayMedium)
                                ],
                              ))
                        ],
                      ),
                      Text(
                        controller.singleArticleModel.related![index].title!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: headlineMedium,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
