import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/add_items/item.dart';
import 'package:flutter_application_1/add_items/item_model.dart';
import 'package:flutter_application_1/dashboard/dashboard_screen.dart';
import 'package:flutter_application_1/details/details_pages/details_page.dart';
import 'package:image_picker/image_picker.dart';
// provider
import 'package:provider/provider.dart';

class AddItemScreen extends StatefulWidget {
  AddItemScreen({super.key});
  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();

  @override
  void dispose() {
    title.dispose();
    body.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Item',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Consumer<ItemModel>(
                builder:
                    (context, ItemModel, child) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        // Image Selector
                        Center(
                          child:
                              ItemModel.selectedImage!.isEmpty
                                  ? Container(
                                    height: 150,
                                    width:
                                        MediaQuery.of(context).size.width - 40,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 8,
                                          offset: Offset(2, 2),
                                        ),
                                      ],
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        ItemModel.imageSelector();
                                      },
                                      icon: Icon(Icons.camera_alt, size: 40),
                                    ),
                                  )
                                  : SizedBox(
                                    height: 150,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children:
                                          ItemModel.selectedImage!
                                              .map(
                                                (toElement) => Stack(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                            horizontal: 8.0,
                                                          ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              12,
                                                            ),
                                                        child: Image.file(
                                                          toElement,
                                                          height: 150,
                                                          width: 150,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      top: 5,
                                                      right: 5,
                                                      child: IconButton(
                                                        onPressed: () {
                                                          ItemModel.removeImage(
                                                            ItemModel
                                                                .selectedImage!
                                                                .indexOf(
                                                                  toElement,
                                                                ),
                                                          );
                                                        },
                                                        icon: Icon(
                                                          Icons.cancel,
                                                          color: Colors.red,
                                                          size: 24,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                              .toList(),
                                    ),
                                  ),
                        ),
                        SizedBox(height: 20),
                        // Title Input
                        Text(
                          "Title",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: 8),
                        TextField(
                          controller: title,
                          decoration: InputDecoration(
                            hintText: "Enter Title",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        // Body Input
                        Text(
                          "Body",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: 8),
                        TextField(
                          controller: body,
                          minLines: 3,
                          maxLines: 10,
                          decoration: InputDecoration(
                            hintText: "Enter Body",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ],
                    ),
              ),
            ),
          ),
        ],
      ),
      // Floating Action Button to save the item
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.save),
        onPressed: () {
          final item = Provider.of<ItemModel>(context, listen: false);
          item.addItem(
            Item(
              // take a copy from list
              images: List.from(item.selectedImage!),
              title: title.text,
              body: body.text,
              favorite: false,
            ),
          );
          // after navigating to the DashboardScreen, clear the images field
          item.selectedImage!.clear();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => DashboardScreen()),
          );
        },
      ),
    );
  }
}
