import 'package:bloc_practice/models/get_posts_model.dart';
import 'package:bloc_practice/services/posts_service.dart';
import 'package:flutter/material.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  PostsService postsService = PostsService();

  List<PostsModel> posts = [];
  bool isLoading = true;

  /// get posts
  getPosts() {
    postsService.getPostsWithModel().then((value) {
      setState(() {
        isLoading = false;
        posts = value!;

        print(posts);
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
    getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// body
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            )
          : ListView.builder(
              itemCount: posts.length,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 100,
              ),
              itemBuilder: (context, index) {
                String userId = posts[index].userId.toString();
                String id = posts[index].id.toString();
                String title = posts[index].title.toString();
                String body = posts[index].body.toString();

                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 16),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(5, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('User Id: $userId'),
                      const SizedBox(height: 12),
                      Text('id: $id'),
                      const SizedBox(height: 12),
                      Text('title: $title'),
                      const SizedBox(height: 12),
                      Text('body: $body'),
                      const SizedBox(height: 12),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
