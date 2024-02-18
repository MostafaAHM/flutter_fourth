import 'package:flutter/material.dart';
import 'package:flutter_navigation/widgets/categories_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return /* SingleChildScrollView(
      child: Column(
        children: DUMMY_CATEGORIES
            // ignore: non_constant_identifier_names
            .map((CatData) =>
                CategoryItem(CatData.id, CatData.title, CatData.color))
            .toList(),
      ),
    );*/

        GridView(
      padding: const EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15),
      children: DUMMY_CATEGORIES
          // ignore: non_constant_identifier_names
          .map((CatData) =>
              CategoryItem(CatData.id, CatData.title, CatData.color))
          .toList(),
    );
  }
}
