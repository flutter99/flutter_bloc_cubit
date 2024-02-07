import 'package:bloc_practice/models/post_with_id_model.dart';
import 'package:bloc_practice/services/posts_service.dart';
import 'package:flutter/material.dart';

class PostsWithIdPage extends StatefulWidget {
  const PostsWithIdPage({super.key});

  @override
  State<PostsWithIdPage> createState() => _PostsWithIdPageState();
}

class _PostsWithIdPageState extends State<PostsWithIdPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  PostsService postsService = PostsService();
  List<PostsWithIdModel> postIdModel = [];
  int currentIndex = 1;
  List tabs = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  bool isLoading = true;

  getPostsWithId() {
    postsService.getPostsWithIdModel(postId: currentIndex).then((value) {
      setState(() {
        postIdModel = value!;
        isLoading = false;
        print(postIdModel);
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
    tabController = TabController(length: 10, vsync: this);
    getPostsWithId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// appbar
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text(
          'Posts With ID',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      /// body
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /// tabs
          const SizedBox(height: 20),
          TabBar(
            controller: tabController,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            indicatorColor: Colors.green,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            onTap: (index) {
              setState(() {
                currentIndex = index + 1;
              });
              postsService
                  .getPostsWithIdModel(postId: currentIndex)
                  .then((value) {
                setState(() {
                  postIdModel = value!;
                  isLoading = false;
                  print(postIdModel);
                });
              }).onError((error, stackTrace) {
                print(error);
                setState(() {
                  isLoading = false;
                });
              });
            },
            tabs: tabs.map(
              (e) {
                return Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Posts with id: ${e.toString()}',
                    style: const TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                );
              },
            ).toList(),
          ),

          /// body
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: tabs.map(
                (e) {
                  return isLoading == true
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 20,
                          ),
                          itemCount: postIdModel.length,
                          itemBuilder: (context, index) {
                            String postId =
                                postIdModel[index].postId.toString();
                            String id = postIdModel[index].id.toString();
                            String name = postIdModel[index].name.toString();
                            return Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(12.0),
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 10,
                                    offset: const Offset(3, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(postId),
                                  const SizedBox(height: 10),
                                  Text(id),
                                  const SizedBox(height: 10),
                                  Text(name),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            );
                          },
                        );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
