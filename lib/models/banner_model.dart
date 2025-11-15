import 'package:new_techblog/component/api_constant.dart';

class BannerModel {
  late String id;
  late String title;
  late String image;

  BannerModel({required this.id, required this.title, required this.image});

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = ApiConstant.hostusl + json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    return data;
  }
}
