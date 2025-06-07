import 'package:flutter/material.dart';

import '../models/category_collection.dart';

class ListViewItems extends StatefulWidget {
  const ListViewItems({
    required this.categoryCollection,
  });

  final CategoryCollection categoryCollection;
  @override
  State<ListViewItems> createState() => _ListViewItemsState();
}

class _ListViewItemsState extends State<ListViewItems> {
  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (newIndex > oldIndex) {
              newIndex--;
            }
            final item =
                widget.categoryCollection.categories.removeAt(oldIndex);

            widget.categoryCollection.categories.insert(newIndex, item);
          });
        },
        children: widget.categoryCollection.categories
            .map(
              (category) => ListTile(
                key: UniqueKey(),
                tileColor: Colors.grey[800],
                leading: Container(
                    decoration: BoxDecoration(
                        color: Colors.blueAccent, shape: BoxShape.circle),
                    child: Icon(Icons.check)),
                title: Row(
                  children: [
                    category.icon,
                    SizedBox(width: 10),
                    Text(category.name),
                  ],
                ),
                trailing: Icon(Icons.reorder),
              ),
            )
            .toList());
  }
}
