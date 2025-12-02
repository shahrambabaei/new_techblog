import 'package:get/get.dart';
import 'package:new_techblog/component/api_constant.dart';
import 'package:new_techblog/models/article_model.dart';
import 'package:new_techblog/services/dio_service.dart';

class ArticleListScreenController extends GetxController {
  RxList<ArticleInfoModel> articleList = RxList();

  @override
  void onInit() {
    getArticleList();
    super.onInit();
  }

  getArticleList() async {
    var response = await DioService().getData(ApiConstant.getArticleItem);

    if (response.statusCode == 200) {
      response.data.map((e) {
        articleList.add(ArticleInfoModel.fromJson(e));
      }).toList();
    }
  }

  getArticleListWithTagsId({required String id}) async {
    articleList.clear();
    var response = await DioService().getData("${ApiConstant.baseUrl}article/get.php?command=get_articles_with_tag_id&tag_id=$id&user_id=1");

    if (response.statusCode == 200) {
      response.data.map((e) {
        articleList.add(ArticleInfoModel.fromJson(e));
      }).toList();
    }
  }
}
