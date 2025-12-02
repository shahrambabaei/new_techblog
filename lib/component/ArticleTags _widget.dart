import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_techblog/component/my_color.dart';
import 'package:new_techblog/controller/article_list_screen_controller.dart';
import 'package:new_techblog/controller/single_article_screen_controller.dart';
import 'package:new_techblog/view/article_list_screen.dart';

class ArticleTagsWidget extends StatelessWidget {
  const ArticleTagsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SingleArticleScreenController>(
      builder: (controller) {
        return SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.singleArticleModel.tags!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10),
                child: InkWell(
                  onTap: () {
                    var tagId = controller.singleArticleModel.tags![index].id;
                    Get.find<ArticleListScreenController>()
                        .getArticleListWithTagsId(id: tagId!);
                    Get.to(ArticleListScreen(
                      title: controller.singleArticleModel.tags![index].title!,
                    ));
                  },
                  child: Container(
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: SolidColors.surface),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                          controller.singleArticleModel.tags![index].title!),
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
}
