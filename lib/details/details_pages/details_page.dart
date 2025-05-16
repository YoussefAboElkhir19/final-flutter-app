import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/add_items/add_item_Screen.dart';
import 'package:flutter_application_1/add_items/item_model.dart';
import 'package:flutter_application_1/profile/profile_page/profile_page.dart';
import 'package:flutter_application_1/profile/user_Model.dart';

// import Widgets
import '../details_widget/details_widget.dart';
// provider
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  // Constractor
  // ? means that the value can be null
  final String? title;
  final String? body;
  final List<File>? image;

  const DetailsPage({this.image, this.title, this.body, super.key});

  @override
  Widget build(BuildContext context) {
    final profileImage = Provider.of<UserModel>(context).user?.image;
    final items = Provider.of<ItemModel>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(items.selectedItem!.title),
        // Navigate to ProfilePage
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            icon:
                profileImage == null
                    ? Icon(Icons.person)
                    : CircleAvatar(
                      child: ClipOval(
                        child: Image.file(
                          profileImage,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
          ),
        ],
      ),

      body: Column(
        children: [
          Image.file(
            items.selectedItem!.images![0],
            height: 100,
            fit: BoxFit.cover,
            width: double.infinity,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FavoriteWadgit(index: items.items.indexOf(items.selectedItem!)),
              IconButton(onPressed: () {}, icon: Icon(Icons.share)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              textAlign: TextAlign.justify,
              //?? meas if body == null
              // body ?? "This is My Bodyyyy",
              items.selectedItem!.body,
            ),
          ),
          // image == null || image!.isEmpty
          //     ? Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: [
          //         MyPhotos(url: "assets/about1.jpg", text: "About1"),
          //         MyPhotos(url: "assets/about1.jpg", text: "About2"),
          //       ],
          //     )
          //     :
          SizedBox(
            height: 500,
            child: GridView.builder(
              // lenth of the list
              itemCount: items.selectedItem!.images!.length,
              // to return the list of images
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.file(
                    items.selectedItem!.images![0],
                    height: 100,
                    width: 100,
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                childAspectRatio: 1,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddItemScreen()),
          );
        },
        child: Icon(Icons.next_plan),
      ),
    );
  }
}
