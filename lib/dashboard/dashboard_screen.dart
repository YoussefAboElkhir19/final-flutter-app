import 'package:flutter/material.dart';
import 'package:flutter_application_1/add_items/item.dart';
import 'package:flutter_application_1/add_items/item_model.dart';
import 'package:flutter_application_1/details/details_pages/details_page.dart';
import 'package:flutter_application_1/add_items/add_item_Screen.dart';
import 'package:flutter_application_1/details/details_widget/favorite_widget.dart';
import 'package:flutter_application_1/favorite/favorite_model.dart';
import 'package:flutter_application_1/profile/profile_page/profile_page.dart';
import 'package:flutter_application_1/profile/user_Model.dart';
import 'package:flutter_application_1/favorite/favorite_screen.dart';
import 'package:flutter_application_1/Login/login.dart';
// provider
import 'package:provider/provider.dart';
//preferences
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String? fullName;
  String? email;

  @override
  void initState() {
    super.initState();
    _loadFullName();
  }

  Future<void> _loadFullName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      fullName = prefs.getString('signupName');
      email = prefs.getString('signupEmail');
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get the profile image from the UserModel By use Provider
    final profileImage = Provider.of<UserModel>(context).user?.image;
    // Get the Data iyem from ItemModel By use Provider
    final items = Provider.of<ItemModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              "Dashboard",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
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
          if (email != null)
            Text(
              email!,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

          // Consumer<DashboardModel>(
          //   builder: (context, dashboardModel, child) {
          //     // fullName = dashboardModel.fullName;
          //     email = dashboardModel.email;
          //     return DataSignup(email: email);
          //   },
          // ),
          Consumer<ItemModel>(
            builder:
                (context, fav, child) => Stack(
                  alignment: Alignment.topRight,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FavoriteScreen(),
                          ),
                        );
                      },
                      icon: Icon(Icons.favorite, color: Colors.red),
                    ),
                    Consumer<FavoriteModel>(
                      builder: (context, fav, child) {
                        return fav.fav.isNotEmpty
                            ? Positioned(
                              right: 8,
                              top: 8,
                              child: Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  fav.fav.length.toString(),
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                            : SizedBox.shrink();
                      },
                    ),
                  ],
                ),
          ),
          IconButton(
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.remove('isLoggedIn');
              Navigator.pushReplacementNamed(context, '/login');
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          if (fullName != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Welcome ${fullName!}",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
              ),
              itemCount: items.items.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    items.selectItem(
                      Item(
                        title: items.items[index].title,
                        body: items.items[index].body,
                        images: items.items[index].images,
                        favorite: items.items[index].favorite,
                      ),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailsPage()),
                    );
                  },
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                            ),
                            child: Image.file(
                              items.items[index].images![0],
                              height: 125,
                              width: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(items.items[index].title),
                              FavoriteWadgit(
                                index: items.items.indexOf(items.items[index]),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
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
        child: Icon(Icons.add),
      ),
    );
  }
}
