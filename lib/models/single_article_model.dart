import 'package:new_techblog/component/api_constant.dart';

class SingleArticleModel {
  Info? info;
  bool? isFavorite;
  List<Related>? related;
  List<Tags>? tags;

  SingleArticleModel({this.info, this.isFavorite, this.related, this.tags});

  SingleArticleModel.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
    isFavorite = json['isFavorite'];
    if (json['related'] != null) {
      related = <Related>[];
      json['related'].forEach((v) {
        related!.add(new Related.fromJson(v));
      });
    }
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(new Tags.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.info != null) {
      data['info'] = this.info!.toJson();
    }
    data['isFavorite'] = this.isFavorite;
    if (this.related != null) {
      data['related'] = this.related!.map((v) => v.toJson()).toList();
    }
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Info {
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

  Info(
    this.title,
    this.content,
    this.image,
  );

  Info.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    image = ApiConstant.baseImgUrl + json['image'];
    catId = json['cat_id'];
    catName = json['cat_name'];
    author = json['author'];
    view = json['view'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['image'] = this.image;
    data['cat_id'] = this.catId;
    data['cat_name'] = this.catName;
    data['author'] = this.author;
    data['view'] = this.view;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Related {
  String? id;
  String? title;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;

  Related(
      {this.id,
      this.title,
      this.image,
      this.catId,
      this.catName,
      this.author,
      this.view,
      this.status,
      this.createdAt});

  Related.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = ApiConstant.baseImgUrl + json['image'];
    catId = json['cat_id'];
    catName = json['cat_name'];
    author = json['author'];
    view = json['view'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['cat_id'] = this.catId;
    data['cat_name'] = this.catName;
    data['author'] = this.author;
    data['view'] = this.view;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Tags {
  String? id;
  String? title;

  Tags({this.id, this.title});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}
