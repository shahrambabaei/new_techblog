import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../data/services/api_constant.dart';
import '../../data/models/article_model.dart';
import '../../data/models/single_article_model.dart';
import '../../data/services/dio_service.dart';
import 'package:new_techblog/widgets/storage_constant.dart';

class ManageArticleController extends GetxController {
  RxList<ArticleInfoModel> articleList = RxList.empty();
  RxBool isLaoding = true.obs;
  Rx<SingleArticleModel> singleArticleModel = SingleArticleModel(
    info: Info(
      "اینجا عنوان مقاله قرار میگیره ، یه عنوان جذاب انتخاب کن",
      """من متن و بدنه اصلی مقاله هستم ، اگه میخوای من رو ویرایش کنی و یه مقاله جذاب بنویسی ، نوشته آبی رنگ بالا که نوشته "ویرایش متن اصلی مقاله" رو با انگشتت لمس کن تا وارد ویرایشگر بشی""",
      "",
    ),
  ).obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
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

    isLaoding.value = false;
  }
}
