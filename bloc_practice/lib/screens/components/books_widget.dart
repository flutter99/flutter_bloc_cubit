import 'package:flutter/material.dart';

class BookWidget extends StatelessWidget {
  final int bookId;
  final String bookName;
  final String? bookType;
  final bool isAvailable;

  const BookWidget({
    super.key,
    required this.bookId,
    required this.bookName,
    this.bookType,
    required this.isAvailable,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Book Id: $bookId",
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            "Book Name: $bookName",
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          bookType == null ? const SizedBox() : const SizedBox(height: 10.0),
          bookType == null
              ? const SizedBox()
              : Text(
                  "Book Type: $bookType",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
          const SizedBox(height: 10.0),
          Text(
            "Is Available: $isAvailable",
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
