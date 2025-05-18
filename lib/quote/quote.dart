import 'dart:convert';

class Quote {
  final String quote;
  final String author;
  final String category;

  Quote({required this.quote, required this.author, required this.category});

  // factory Constructor  To Convert Map to Object
  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      author: json["author"],
      category: json["category"],
      quote: json["quote"],
    );
  }
}
