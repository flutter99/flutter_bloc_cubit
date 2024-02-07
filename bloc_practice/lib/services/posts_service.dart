import 'dart:convert';

import 'package:bloc_practice/models/post_with_id_model.dart';

import '../models/get_posts_model.dart';
import 'package:http/http.dart' as http;

class PostsService {
  /// get posts with model
  Future<List<PostsModel>?> getPostsWithModel() async {
    try {
      Uri url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        List<PostsModel> postsModel = List<PostsModel>.from(
          json.decode(response.body).map(
                (e) => PostsModel.fromJson(e),
              ),
        );
        return postsModel;
      }
    } catch (e) {
      print(e);
    }

    return null;
  }

  /// get posts id with model
  Future<List<PostsWithIdModel>?> getPostsWithIdModel(
      {required int postId}) async {
    try {
      Uri url = Uri.parse(
          'https://jsonplaceholder.typicode.com/comments?postId=$postId');
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        List<PostsWithIdModel> postsIdModel = List<PostsWithIdModel>.from(
          json.decode(response.body).map(
                (e) => PostsWithIdModel.fromJson(e),
              ),
        );
        return postsIdModel;
      }
    } catch (e) {
      print(e);
    }

    return null;
  }
}
