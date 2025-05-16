import 'dart:convert';

import 'package:flutter_application_1/quote/quote.dart';
import 'package:http/http.dart' as http;

Future<List<Quote>> fetchQuote() async {
  final response = await http.get(
    Uri.parse("https://api.api-ninjas.com/v1/quotes"),
    headers: {'X-Api-Key': 'WaByPdyrkN14RlLpo1Z/2Q==CTNZsbkjlLaLlJRS'},
  );

  if (response.statusCode == 200) {
    // List Of Map
    //Decode To convert to string
    List<dynamic> data = jsonDecode(response.body);
    return
    // Convert to List of Object
    data.map((e) => Quote.fromJson(e)).toList();
    //  data.map((e) => Quote.fromJson(e)).toList().first;
  } else {
    throw Exception('Failed to load quote');
  }
}
