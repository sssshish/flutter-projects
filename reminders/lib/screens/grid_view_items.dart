import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/category_collection.dart';

class GridViewItems extends StatelessWidget {
  const GridViewItems({
    required this.categoryCollection,
  });

  final CategoryCollection categoryCollection;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        padding: EdgeInsets.all(10),
        childAspectRatio: 16 / 9,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: categoryCollection.categories
            .map(
              (category) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF1A191D),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [category.icon, Text('0')],
                        ),
                        Text(category.name)
                      ]),
                ),
              ),
            )
            .toList());
  }
}
