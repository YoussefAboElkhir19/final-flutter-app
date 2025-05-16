import 'package:flutter/material.dart';
import 'package:flutter_application_1/quote/quote.dart';
import 'package:flutter_application_1/quote/serivce.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  // variable type of ListQuote
  late Future<List<Quote>> future;
  @override
  void initState() {
    future = fetchQuote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quote",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),

        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/quote2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder:
                    (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text("Author: "),
                          Text(
                            snapshot.data![index].author,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text("Category: "),
                          Text(
                            snapshot.data![index].category,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text("Quote: "),
                          Text(
                            snapshot.data![index].quote,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
              );
            }
            // check If Found Error
            else if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Error: ${snapshot.error}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              );
            }
            // Loading
            return Center(
              child: SizedBox(
                height: 100,
                width: 100,
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }
}
