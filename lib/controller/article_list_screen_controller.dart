import 'dart:developer';

import 'package:get/get.dart';
import 'package:new_techblog/component/api_constant.dart';
import 'package:new_techblog/models/article_model.dart';
import 'package:new_techblog/services/dio_service.dart';

class ArticleListScreenController extends GetxController {
  RxList<ArticleInfoModel> articleList = RxList();

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    var response = await DioService().getData(ApiConstant.getArticleItem);

    if (response.statusCode == 200) {

      response.data.map((e) {
        articleList.add(ArticleInfoModel.fromJson(e));
      }).toList();
      log("$response");
    }
  }
}
