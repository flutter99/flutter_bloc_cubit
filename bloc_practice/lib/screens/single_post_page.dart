import 'package:bloc_practice/models/single_post_model.dart';
import 'package:bloc_practice/services/api_service.dart';
import 'package:flutter/material.dart';

class SinglePostPage extends StatefulWidget {
  const SinglePostPage({super.key});

  @override
  State<SinglePostPage> createState() => _SinglePostPageState();
}

class _SinglePostPageState extends State<SinglePostPage> {
  APIService apiService = APIService();
  SinglePostModel singlePostModel = SinglePostModel();
  dynamic singlePost;
  bool isLoading = true;

  /// get post with model
  getPostWithModel() {
    apiService.getSinglePostWithModel().then((value) {
      setState(() {
        singlePostModel = value!;
        isLoading = false;
        print(singlePostModel);
      });
    }).onError((error, stackTrace) {
      print(error);
      isLoading = false;
      setState(() {});
    });
  }

  /// get post without model

  getPostWithoutModel() {
    apiService.getSinglePostWithOutModel().then((value) {
      setState(() {
        singlePost = value;
        isLoading = false;
        print("Single Post $singlePost");
      });
    }).onError((error, stackTrace) {
      print(error);
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getPostWithModel();
    getPostWithoutModel();
  }

  @override
  Widget build(BuildContext context) {
    String userId = singlePostModel.userId.toString();
    String id = singlePostModel.id.toString();
    String title = singlePostModel.title.toString();
    String body = singlePostModel.body.toString();
    return Scaffold(
      /// body
      body: isLoading == true
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            )
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      'User ID is: ${singlePost['userId'].toString()}',
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Post ID is: ${singlePost['id'].toString()}',
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Title is: ${singlePost['title'].toString()}',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Body is: ${singlePost['body'].toString()}',
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
