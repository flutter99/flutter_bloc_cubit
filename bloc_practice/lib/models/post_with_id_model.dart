class PostsWithIdModel {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  PostsWithIdModel({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  PostsWithIdModel.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['postId'] = postId;
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['body'] = body;
    return data;
  }
}
