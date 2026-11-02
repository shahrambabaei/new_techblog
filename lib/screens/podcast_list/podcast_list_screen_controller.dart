import 'package:get/get.dart';
import 'package:new_techblog/data/models/podcast_info_model.dart';
import 'package:new_techblog/data/services/api_constant.dart';
import 'package:new_techblog/data/services/dio_service.dart';

class PodcastListScreenController extends GetxController {
  RxList<PodcastInfoModel> podcastList = RxList();
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    getPodcastList();
    super.onInit();
  }

  getPodcastList() async {
    var response = await DioService().getData(ApiConstant.getPodcastItem);

    if (response.statusCode == 200) {
      response.data.map((item) {
        podcastList.add(PodcastInfoModel.fromJson(item));
      }).toList();
    }
    isLoading.value = false;
  }
}
