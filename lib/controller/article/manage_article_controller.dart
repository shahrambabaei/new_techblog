import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart' show GetStorage;
import 'package:new_techblog/component/storage_constant.dart'
    show StorageConstant;

import '../../component/api_constant.dart';
import '../../models/article_model.dart';
import '../../services/dio_service.dart';

class ManageArticleController extends GetxController {
  RxList<ArticleInfoModel> articleList = RxList();
  final box = GetStorage();

  @override
  void onInit() {
    // TODO: implement onInit
    getManageArticle();
    super.onInit();
  }

  getManageArticle() async {
    var response = await DioService().getData(
      "${ApiConstant.publishedByMe}1",
    );

    if (response.statusCode == 200) {
      response.data.map((e) {
        articleList.add(ArticleInfoModel.fromJson(e));
      }).toList();
    }
  }
}
