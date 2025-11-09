class ArticleModel {
  String? id;
  String? title;
  String? catId;
  String? image;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;

  ArticleModel(
      {this.id,
      this.title,
      this.image,
      this.catId,
      this.catName,
      this.author,
      this.view,
      this.status,
      this.createdAt});

  ArticleModel.fromJson(Map<String, dynamic> json) {
    id:
    json["id"];
    title:
    json["title"];
    image:
    json["image"];
    carId:
    json["cat_id"];
    catName:
    json["cat_name"];
    author:
    json["author"];
    view:
    json["view"];
    status:
    json["status"];
    createdAt:
    json["created_at"];
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
