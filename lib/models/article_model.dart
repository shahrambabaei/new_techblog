import 'package:new_techblog/component/api_constant.dart';

class ArticleModel {
  late String id;
  late String title;
  late String catId;
  late String image;
  late String catName;
  late String author;
  late String view;
  late String status;
  late String createdAt;

  ArticleModel(
      {required this.id,
      required this.title,
      required this.image,
      required this.catId,
      required this.catName,
      required this.author,
      required this.view,
      required this.status,
      required this.createdAt});

  ArticleModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    image = ApiConstant.hostusl + json["image"];
    catId = json["cat_id"];
    catName = json["cat_name"];
    author = json["author"];
    view = json["view"];
    status = json["status"];
    createdAt = json["created_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['cat_id'] = catId;
    data['cat_name'] = catName;
    data['author'] = author;
    data['view'] = view;
    data['status'] = status;
    data['created_at'] = createdAt;
    return data;
  }
}
