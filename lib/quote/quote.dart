import 'dart:convert';

class Quote {
  final String quote;
  final String author;
  final String category;
  Quote({required this.quote, required this.author, required this.category});

  // factory Constucctor  To Convert Map to Object
  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      quote: json["quote"],
      author: json["author"],
      category: json["category"],
    );
  }
}
