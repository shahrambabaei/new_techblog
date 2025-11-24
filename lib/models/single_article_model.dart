import 'package:new_techblog/component/api_constant.dart';

class SingleArticleModel {
  String? id;
  String? title;
  String? content;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;

  SingleArticleModel();

  SingleArticleModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    content = json["content"];
    image = ApiConstant.baseImgUrl + json["image"];
    catId = json["cat_id"];
    catName = json["cat_name"];
    author = json["author"];
    view = json["view"];
    status = json["status"];
    createdAt = json["created_at"];
  }
}
