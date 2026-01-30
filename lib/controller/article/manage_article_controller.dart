import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../component/api_constant.dart';
import '../../models/article_model.dart';
import '../../services/dio_service.dart';
import 'package:new_techblog/component/storage_constant.dart';

class ManageArticleController extends GetxController {
  RxList<ArticleInfoModel> articleList = RxList();
  RxBool isLaoding = true.obs;
  final box = GetStorage();

  @override
  void onInit() {
    getManageArticle();
    super.onInit();
  }

  getManageArticle() async {
    print(box.read(StorageConstant.userId)+"**************************");
    var response = await DioService().getData(
      ApiConstant.publishedByMe + box.read(StorageConstant.userId),
    );

    if (response.statusCode == 200) {
      response.data.map((e) {
        articleList.add(ArticleInfoModel.fromJson(e));
      }).toList();
    }
    isLaoding.value = false;
  }
}
