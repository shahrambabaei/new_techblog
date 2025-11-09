class BannerModel {
  String? id;
  String? title;
  String? image;

  BannerModel({this.id, this.title, this.image});

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    return data;
  }
}
