import 'package:new_techblog/component/api_constant.dart';

class PodcastModel {
  String? id;
  String? title;
  String? poster;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;

  PodcastModel(
      {this.id,
      this.title,
      this.poster,
      this.catName,
      this.author,
      this.view,
      this.status,
      this.createdAt});

  PodcastModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    poster = ApiConstant.hostusl + json["poster"];
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
    data['poster'] = poster;
    data['cat_name'] = catName;
    data['author'] = author;
    data['view'] = view;
    data['status'] = status;
    data['created_at'] = createdAt;
    return data;
  }
}
