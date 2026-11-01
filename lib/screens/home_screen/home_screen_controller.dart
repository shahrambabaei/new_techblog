import 'package:get/get.dart';
import 'package:new_techblog/data/services/api_constant.dart';
import 'package:new_techblog/data/models/article_model.dart';
import 'package:new_techblog/data/models/banner_model.dart';
import 'package:new_techblog/data/models/podcast_model.dart';
import 'package:new_techblog/data/models/tag_mode.dart';
import 'package:new_techblog/data/services/dio_service.dart';

class HomeScreenController extends GetxController {
  final Rx<BannerModel> bannerModel = BannerModel().obs;
  final RxList<ArticleInfoModel> articleList = <ArticleInfoModel>[].obs;
  final RxList<PodcastModel> podcastList = <PodcastModel>[].obs;
  final RxList<TagModel> tagList = <TagModel>[].obs;
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    getDate();
    super.onInit();
  }

  Future<void> getDate() async {
    isLoading.value = true;
    try {
      var response = await DioService().getData(ApiConstant.getHomeItem);
      if (response != null && response.statusCode == 200) {
        final data = response.data;

        // Banner
        if (data["poster"] != null) {
          bannerModel.value = BannerModel.fromJson(data["poster"]);
        }

        // Tags
        if (data["tags"] != null) {
          tagList.assignAll(
            (data["tags"] as List).map((e) => TagModel.fromJson(e)).toList(),
          );
        }

        // Articles (Top visited)
        if (data["top_visited"] != null) {
          articleList.assignAll(
            (data["top_visited"] as List)
                .map((e) => ArticleInfoModel.fromJson(e))
                .toList(),
          );
        }

        // Podcasts
        if (data["top_podcasts"] != null) {
          podcastList.assignAll(
            (data["top_podcasts"] as List)
                .map((e) => PodcastModel.fromJson(e))
                .toList(),
          );
        }
      }
    } catch (e) {
      Get.snackbar('خطا', 'خطا در برقراری ارتباط با سرور');
    } finally {
      isLoading.value = false;
    }
  }
}
