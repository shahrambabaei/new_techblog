import 'package:get/get.dart';
import 'package:new_techblog/component/api_constant.dart';
import 'package:new_techblog/models/article_model.dart';
import 'package:new_techblog/models/banner_model.dart';
import 'package:new_techblog/models/podcast_model.dart';
import 'package:new_techblog/models/tag_mode.dart';
import 'package:new_techblog/services/dio_service.dart';

class HomeScreenController extends GetxController {
  Rx<BannerModel> bannerModel = BannerModel().obs;
  RxList<ArticleInfoModel> articleList = RxList();
  RxList<PodcastModel> podcastList = RxList();
  RxList<TagModel> tagList = RxList();
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    getDate();
    super.onInit();
  }

  getDate() async {
    try {
      var response = await DioService().getData(ApiConstant.getHomeItem);
      if (response.statusCode == 200) {
        isLoading.value = true;
        response.data["top_podcasts"].map((e) {
          podcastList.add(PodcastModel.fromJson(e));
        }).toList();

        //banner
        bannerModel.value = BannerModel.fromJson(response.data["poster"]);

        response.data["tags"].map((e) {
          tagList.add(TagModel.fromJson(e));
        }).toList();

        //Article
        response.data["top_visited"].map((e) {
          articleList.add(ArticleInfoModel.fromJson(e));
        }).toList();

        //podcast
        response.data["top_podcasts"].map((e) {
          podcastList.add(PodcastModel.fromJson(e));
        }).toList();
        isLoading.value = false;
      }
    } catch (e) {
      // print(e.toString());
    }
  }
}
