import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:new_techblog/component/api_constant.dart';
import 'package:new_techblog/models/single_article_model.dart';

import 'package:new_techblog/services/dio_service.dart';

class SingleArticleScreenController extends GetxController {
  SingleArticleModel singleArticleModel = SingleArticleModel();

  final int id;

  bool isloading = true;

  SingleArticleScreenController({required this.id});

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    var response = await DioService().getData(
        "${ApiConstant.baseUrl}article/get.php?command=info&id=$id&user_id=1");

    if (response.statusCode == 200) {
      isloading = true;
      singleArticleModel = SingleArticleModel.fromJson(response.data);
    }

    isloading = false;
    update();
  }
}
