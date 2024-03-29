import 'dart:convert';

import '../models/single_post_model.dart';
import 'package:http/http.dart' as http;

class SinglePostService {
  /// get single post with model
  Future<SinglePostModel?> getSinglePostWithModel() async {
    try {
      Uri url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        SinglePostModel model =
            SinglePostModel.fromJson(json.decode(response.body));
        return model;
      }
    } catch (e) {
      print(e);
    }

    return null;
  }

  /// get single post without model
  Future<dynamic> getSinglePostWithOutModel() async {
    try {
      Uri url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        String body = response.body;
        dynamic data = jsonDecode(body);
        return data;
      }
    } catch (e) {
      print(e);
    }

    return null;
  }
}
