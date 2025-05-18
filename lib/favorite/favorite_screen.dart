import 'package:flutter/material.dart';
import 'package:flutter_application_1/favorite/favorite_model.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorite",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),

        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Consumer<FavoriteModel>(
        builder: (context, fav, child) {
          if (fav.fav.isEmpty) {
            return const Center(child: Text("No Favorite"));
          }
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
            ),
            itemCount: fav.fav.length,
            itemBuilder: (context, index) {
              return SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image.file(
                        fav.fav[index].images![0],
                        height: 125,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(fav.fav[index].title),
                          IconButton(
                            onPressed: () {
                              fav.fav[index].favorite = false;
                              fav.removeToFav(fav.fav[index]);
                            },
                            icon: const Icon(Icons.favorite, color: Colors.red),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Text("jjjjj"), // This is the optional child parameter
      ),
    );
  }
}
