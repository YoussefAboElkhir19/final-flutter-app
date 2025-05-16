// libraray to input and output
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/profile/profile_widgets/options.dart';
import 'package:flutter_application_1/profile/user_Model.dart';
// import library to select image
import 'package:image_picker/image_picker.dart';
// provider
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),

      body: Column(
        children: [
          Center(
            child: Consumer<UserModel>(
              builder: (context, userModel, child) {
                return Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 110,
                      backgroundColor:
                          Colors.grey[200], // Optional: Add a background color
                      child:
                          userModel.user?.image == null
                              ? Icon(Icons.person, size: 200)
                              : ClipOval(
                                child: Image.file(
                                  // Style for image Selected
                                  width: 240, // Double the radius
                                  height: 240, // Double the radius
                                  fit:
                                      BoxFit
                                          .cover, // Ensures the image covers the circle
                                  userModel.user!.image!,
                                ),
                              ),
                    ),
                    CircleAvatar(
                      child: IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder:
                                (context) => SizedBox(
                                  height: 150,
                                  child: Column(
                                    children: [
                                      Text("Profile"),
                                      Divider(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          options(
                                            title: "Camera",
                                            icon: Icons.camera_alt,
                                            onPressed: () {
                                              userModel.imageSelector(
                                                ImageSource.camera,
                                              );
                                            },
                                          ),
                                          options(
                                            title: "Image",
                                            icon: Icons.image,
                                            onPressed: () {
                                              userModel.imageSelector(
                                                ImageSource.gallery,
                                              );
                                            },
                                          ),
                                          if (userModel.user?.image != null)
                                            options(
                                              selectedImage:
                                                  userModel.user?.image,
                                              title: "Delete",
                                              icon: Icons.delete,
                                              onPressed: () {
                                                userModel.removeImage();
                                              },
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                          );
                        },
                        icon: Icon(Icons.camera_alt),
                      ),
                    ),
                  ],
                );
              },
              // End Return
            ),
          ),
          ListTile(
            title: Text("Name"),
            subtitle: Text("Youssef"),
            trailing: Icon(Icons.edit),
          ),
          ListTile(
            title: Text("Bio"),
            subtitle: Text("Programmer . junior flutter . Developer"),
            trailing: Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
}
