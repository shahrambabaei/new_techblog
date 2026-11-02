class PodcastInfoModel {
  String? id;
  String? title;
  String? poster;
  String? publisher;
  String? view;
  String? status;
  String? createdAt;
  bool? isFavorite;

  PodcastInfoModel(
      {this.id,
      this.title,
      this.poster,
      this.publisher,
      this.view,
      this.status,
      this.createdAt,
      this.isFavorite});

  PodcastInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    poster = json['poster'];
    publisher = json['publisher'];
    view = json['view'];
    status = json['status'];
    createdAt = json['created_at'];
    isFavorite = json['isFavorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['poster'] = this.poster;
    data['publisher'] = this.publisher;
    data['view'] = this.view;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['isFavorite'] = this.isFavorite;
    return data;
  }
}