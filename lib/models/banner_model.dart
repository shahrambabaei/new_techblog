import 'package:new_techblog/component/api_constant.dart';

class BannerModel {
  String? id;
  String? title;
  String? image;

  BannerModel();

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = ApiConstant.baseImgUrl + json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    return data;
  }
}
