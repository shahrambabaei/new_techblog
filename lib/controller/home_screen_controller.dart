import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_techblog/component/api_constant.dart';
import 'package:new_techblog/models/article_model.dart';
import 'package:new_techblog/models/banner_model.dart';
import 'package:new_techblog/models/podcast_model.dart';
import 'package:new_techblog/services/dio_service.dart';

class HomeScreenController extends GetxController {
  late BannerModel bannerModel;
  RxList<ArticleModel> articleList = RxList();
  RxList<PodcastModel> podcastList = RxList();

  @override
  void onInit() {
    getDate();

    super.onInit();
  }

  getDate() async {
    var response = await DioService().getData(ApiConstant.getHomeItem);
    if (response.statusCode == 200) {
      response.data["top_podcasts"].map((e) {
        podcastList.add(PodcastModel.fromJson(e));
      }).toList();
      bannerModel = BannerModel.fromJson(response.data["poster"]);
      //Article
      response.data["top_visited"].map((item) {
        articleList.add(ArticleModel.fromJson(item));
      }).toList();
      //podcast
      response.data["top_podcasts"].map((e) {
        podcastList.add(PodcastModel.fromJson(e));
      }).toList();
    }
  }
}
