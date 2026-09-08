import 'package:get/get.dart';
import 'package:new_techblog/data/services/api_constant.dart';
import 'package:new_techblog/data/models/single_article_model.dart';
import 'package:new_techblog/data/services/dio_service.dart';
import 'package:new_techblog/screens/single_article/single_article_screen.dart';

class SingleArticleScreenController extends GetxController {
  Rx<SingleArticleModel> singleArticleModel = SingleArticleModel().obs;
  RxBool isLoading = true.obs;

  getData(int id) async {
    singleArticleModel.value = SingleArticleModel();
    isLoading.value = true;
    var response = await DioService().getData(
        "${ApiConstant.baseUrl}article/get.php?command=info&id=$id&user_id=1");

    if (response.statusCode == 200) {
      singleArticleModel.value = SingleArticleModel.fromJson(response.data);
    }

    isLoading.value = false;
    Get.to(() => SingleArticleScreen());
  }
}
