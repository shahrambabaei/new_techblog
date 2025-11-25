import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:new_techblog/component/api_constant.dart';
import 'package:new_techblog/models/single_article_model.dart';
import 'package:new_techblog/models/tag_mode.dart';
import 'package:new_techblog/services/dio_service.dart';

class SingleArticleScreenController extends GetxController {
  SingleArticleModel singleArticleModel = SingleArticleModel();
  List<TagModel> tagList = [];
  final int id;

  bool isloading = true;

  SingleArticleScreenController({required this.id});

  @override
  void onInit() {
    print("🎯 onInit called");
    getData();
    super.onInit();
  }

  getData() async {
    print("🎯 getData called with id: $id");
    var response = await DioService().getData(
        "${ApiConstant.baseUrl}article/get.php?command=info&id=$id&user_id=1");

    if (response.statusCode == 200) {
      isloading = true;
      singleArticleModel = SingleArticleModel.fromJson(response.data["info"]);
      response.data["tags"].map((e) {
        tagList.add(TagModel.fromJson(e));
      }).toList();
    }
    isloading = false;
    update();
  }
}
