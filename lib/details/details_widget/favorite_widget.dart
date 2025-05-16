import 'package:flutter/material.dart';
import 'package:flutter_application_1/add_items/item_model.dart';
import 'package:flutter_application_1/favorite/favorite_model.dart';

import 'package:provider/provider.dart';

class FavoriteWadgit extends StatelessWidget {
  const FavoriteWadgit({required this.index, super.key});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Consumer<ItemModel>(
      builder: (context, item, child) {
        final fav = Provider.of<FavoriteModel>(context, listen: true);
        final currentItem = item.items[index];
        return IconButton(
          onPressed: () {
            // to know if true (Added) or false (Remove from fav list)
            fav.isFavorite(currentItem);
          },
          icon: Icon(
            Icons.favorite,
            color:
                item.items[index].favorite
                    ? Colors.red
                    : Colors.grey, // Use the state from FavoriteModel
          ),
        );
      },
    );
  }
}
