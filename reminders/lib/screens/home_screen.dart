import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reminders/common/widgets/category_icons.dart';
import 'package:reminders/models/category.dart';
import 'package:reminders/models/category_collection.dart';
import 'package:reminders/screens/list_view_items.dart';

import 'footer.dart';
import 'grid_view_items.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String layoutType = 'grid';
  CategoryCollection categoryCollection = CategoryCollection();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              if (layoutType == 'grid') {
                setState(() {
                  layoutType = 'list';
                });
              } else {
                setState(() {
                  layoutType = 'grid';
                });
              }
            },
            child: Text(
              layoutType == 'grid' ? 'Edit' : 'Done',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: layoutType == 'grid'
                  ? GridViewItems(
                      categoryCollection: categoryCollection,
                    )
                  : ListViewItems(
                      categoryCollection: categoryCollection,
                    ),
            ),
            Footer()
          ],
        ),
      ),
    );
  }
}
