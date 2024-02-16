import 'dart:convert';

import 'package:http/http.dart' as http;

class BooksService {
  final String booksUrl = 'https://simple-books-api.glitch.me/books';

  Future<dynamic> fetchBooks() async {
    try {
      Uri url = Uri.parse(booksUrl);
      http.Response response = await http.get(url);
      print(response.statusCode);

      if (response.statusCode == 200) {
        String body = response.body;
        print(body);
        dynamic data = jsonDecode(body);
        print(data);
        return data;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
