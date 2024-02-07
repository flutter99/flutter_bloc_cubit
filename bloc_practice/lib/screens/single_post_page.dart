import 'package:bloc_practice/models/single_post_model.dart';
import 'package:bloc_practice/services/api_service.dart';
import 'package:flutter/material.dart';

class SinglePostPage extends StatefulWidget {
  const SinglePostPage({super.key});

  @override
  State<SinglePostPage> createState() => _SinglePostPageState();
}

class _SinglePostPageState extends State<SinglePostPage> {
  APIService _apiService = APIService();
  SinglePostModel singlePostModel = SinglePostModel();

  getPost() {
    _apiService.getSinglePost().then((value) {
      setState(() {
        singlePostModel = value!;
        print(singlePostModel);
      });
    }).onError((error, stackTrace) {
      print(error);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPost();
  }

  @override
  Widget build(BuildContext context) {
    String userId = singlePostModel.userId.toString();
    String id = singlePostModel.id.toString();
    String title = singlePostModel.title.toString();
    String body = singlePostModel.body.toString();
    return Scaffold(
      /// body
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Text(
                'User ID is: $userId',
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Post ID is: $id',
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Title is: $title',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Body is: $body',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
