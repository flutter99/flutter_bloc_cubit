class SinglePostModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  SinglePostModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  SinglePostModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
