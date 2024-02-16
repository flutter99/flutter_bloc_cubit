import 'package:bloc_practice/screens/components/books_widget.dart';
import 'package:bloc_practice/services/books_service.dart';
import 'package:flutter/material.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({super.key});

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  BooksService booksService = BooksService();

  List<dynamic> books = [];
  bool isLoading = true;

  getBooks() {
    booksService.fetchBooks().then((value) {
      setState(() {
        books = value;
        isLoading = false;
      });
    }).onError((error, stackTrace) {
      print('Error $error');
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    getBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// appbar
      appBar: AppBar(
        centerTitle: true,
        title: Text('Books Page'),
      ),

      /// body
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TabBar(
                  controller: tabController,
                  tabs: const [
                    Tab(
                      text: 'Fiction',
                    ),
                    Tab(
                      text: 'Non Fiction',
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      ListView.builder(
                        itemCount: books.length,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 30,
                        ),
                        itemBuilder: (context, index) {
                          var book = books[index];
                          return book['type'] == 'fiction'
                              ? BookWidget(
                                  bookId: book['id'],
                                  bookName: book['name'],
                                  //bookType: book['type'],
                                  isAvailable: book['available'],
                                )
                              : const SizedBox();
                        },
                      ),
                      ListView.builder(
                        itemCount: books.length,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 30,
                        ),
                        itemBuilder: (context, index) {
                          var book = books[index];
                          return book['type'] == 'non-fiction'
                              ? BookWidget(
                                  bookId: book['id'],
                                  bookName: book['name'],
                                  //bookType: book['type'],
                                  isAvailable: book['available'],
                                )
                              : const SizedBox();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
